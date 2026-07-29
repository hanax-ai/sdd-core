#!/usr/bin/env python3
"""Validate SDD-Core v4 contracts and validation-first fixtures."""

from __future__ import annotations

import argparse
import base64
import copy
import hashlib
import hmac
import json
import os
import re
import subprocess
import sys
import tempfile
import venv
from datetime import datetime, timezone
from pathlib import Path
from typing import Any
from urllib.parse import unquote
from xml.etree import ElementTree

ROOT = Path(__file__).resolve().parents[1]


def load_validation_dependencies() -> tuple[Any, Any]:
    try:
        import yaml as yaml_module
        from jsonschema import Draft202012Validator as validator_class

        return yaml_module, validator_class
    except ModuleNotFoundError:
        requirements = ROOT / "requirements-validation.txt"
        cache_key = hashlib.sha256(
            requirements.read_bytes()
            + f"{sys.version_info.major}.{sys.version_info.minor}".encode("ascii")
            + sys.platform.encode("ascii")
        ).hexdigest()[:20]
        environment = (
            Path(tempfile.gettempdir()) / f"sdd-core-validation-{cache_key}"
        )
        python = (
            environment / ("Scripts/python.exe" if os.name == "nt" else "bin/python")
        )
        marker = environment / ".requirements-sha256"
        requirements_digest = hashlib.sha256(requirements.read_bytes()).hexdigest()
        if not python.exists() or not marker.exists() or (
            marker.read_text(encoding="ascii").strip() != requirements_digest
        ):
            print(
                "BOOTSTRAP: creating disposable hash-locked validation environment",
                file=sys.stderr,
            )
            venv.EnvBuilder(with_pip=True, clear=True).create(environment)
            subprocess.run(
                [
                    str(python),
                    "-m",
                    "pip",
                    "--disable-pip-version-check",
                    "install",
                    "--require-hashes",
                    "--trusted-host",
                    "pypi.org",
                    "--trusted-host",
                    "files.pythonhosted.org",
                    "-r",
                    str(requirements),
                ],
                check=True,
            )
            marker.write_text(requirements_digest + "\n", encoding="ascii")
        completed = subprocess.run([str(python), str(Path(__file__)), *sys.argv[1:]])
        raise SystemExit(completed.returncode)


yaml, Draft202012Validator = load_validation_dependencies()
SCHEMAS = {
    "adoption": ROOT / "contracts/adoption/project-adoption.schema.json",
    "authority": ROOT / "contracts/authority/mission-envelope.schema.json",
    "evidence": ROOT / "contracts/evidence/evidence-envelope.schema.json",
}
INTEGRATION_SCHEMAS = {
    "harness": ROOT / "integrations/fusion-harness/binding.schema.json",
    "workflow": ROOT / "integrations/agent-workflow/status.schema.json",
}


def load_json(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8"))


def load_yaml(path: Path) -> Any:
    return yaml.safe_load(path.read_text(encoding="utf-8"))


def parse_time(value: str) -> datetime:
    return datetime.fromisoformat(value.replace("Z", "+00:00"))


def canonical_mission_payload(instance: dict[str, Any]) -> bytes:
    payload = copy.deepcopy(instance)
    payload["integrity"].pop("canonicalDigest", None)
    if "signature" in payload:
        payload["signature"].pop("value", None)
    return json.dumps(
        payload,
        ensure_ascii=False,
        separators=(",", ":"),
        sort_keys=True,
    ).encode("utf-8")


def verify_rs256(
    payload: bytes,
    signature_value: str,
    modulus_hex: str,
    exponent: int,
) -> bool:
    try:
        signature = base64.b64decode(signature_value, validate=True)
    except ValueError:
        return False
    modulus = int(modulus_hex, 16)
    width = (modulus.bit_length() + 7) // 8
    if len(signature) != width:
        return False
    encoded = pow(int.from_bytes(signature, "big"), exponent, modulus).to_bytes(
        width, "big"
    )
    digest_info = bytes.fromhex("3031300d060960864801650304020105000420")
    expected_tail = digest_info + hashlib.sha256(payload).digest()
    padding_length = width - len(expected_tail) - 3
    if padding_length < 8:
        return False
    expected = b"\x00\x01" + (b"\xff" * padding_length) + b"\x00" + expected_tail
    return hmac.compare_digest(encoded, expected)


def schema_validator(path: Path) -> Draft202012Validator:
    schema = load_json(path)
    Draft202012Validator.check_schema(schema)
    return Draft202012Validator(
        schema,
        format_checker=Draft202012Validator.FORMAT_CHECKER,
    )


def mission_semantic_errors(instance: dict[str, Any]) -> list[str]:
    errors: list[str] = []
    payload = canonical_mission_payload(instance)
    expected_digest = "sha256:" + hashlib.sha256(payload).hexdigest()
    if not hmac.compare_digest(
        instance["integrity"]["canonicalDigest"], expected_digest
    ):
        errors.append("canonical mission digest mismatch")

    profiles = load_json(ROOT / "contracts/authority/trust-profiles.json")["profiles"]
    profile = profiles.get(instance["trustProfile"]["id"])
    signature = instance["signature"]
    if profile is None:
        errors.append("trust profile is not approved")
    elif not hmac.compare_digest(
        instance["trustProfile"]["digest"], profile["digest"]
    ):
        errors.append("trust profile digest mismatch")
    elif (
        instance["trustProfile"]["keyId"] != signature["keyId"]
        or signature["keyId"] not in profile["keys"]
    ):
        errors.append("signature key is not approved by the trust profile")
    else:
        key = profile["keys"][signature["keyId"]]
        if not verify_rs256(
            payload,
            signature["value"],
            key["modulusHex"],
            key["exponent"],
        ):
            errors.append("issuer signature verification failed")

    now = datetime.now(timezone.utc)
    if parse_time(instance["expiresAt"]) <= parse_time(instance["issuedAt"]):
        errors.append("mission expires at or before issue time")
    if parse_time(instance["notBefore"]) > parse_time(instance["issuedAt"]):
        errors.append("mission is not active at issue time")
    if now < parse_time(instance["notBefore"]):
        errors.append("mission is not yet active")
    if now >= parse_time(instance["expiresAt"]):
        errors.append("mission is expired at verification time")
    if instance["revocation"]["revoked"]:
        errors.append("mission is revoked")
    if instance["supersession"]["superseded"]:
        errors.append("mission is superseded")
    if instance["replay"]["status"] != "fresh" or instance["replay"]["previousUses"] != 0:
        errors.append("mission nonce has been replayed")

    authorized = instance["authorization"]
    request = instance["request"]
    if request["repository"] not in authorized["repositories"]:
        errors.append("requested repository exceeds authorization")
    if not set(request["paths"]).issubset(authorized["paths"]):
        errors.append("requested paths exceed authorization")
    if not set(request["actions"]).issubset(authorized["actions"]):
        errors.append("requested actions exceed authorization")
    if request["branch"] not in authorized["branches"]:
        errors.append("requested branch exceeds authorization")
    if request["environment"] not in authorized["environments"]:
        errors.append("requested environment exceeds authorization")
    if not set(request["capabilities"]).issubset(authorized["capabilities"]):
        errors.append("requested capabilities exceed authorization")
    if not set(request["tools"]).issubset(authorized["tools"]):
        errors.append("requested tools exceed authorization")
    if not set(request["mcpOperations"]).issubset(authorized["mcpOperations"]):
        errors.append("requested MCP operations exceed authorization")
    if set(request["actions"]) & set(authorized["prohibitedActions"]):
        errors.append("requested action is explicitly prohibited")
    if instance["frozenPolicy"]["authorizedDigest"] != instance["frozenPolicy"]["currentDigest"]:
        errors.append("frozen policy changed")
    if instance["base"]["authorizedCommit"] != instance["base"]["currentCommit"]:
        errors.append("base commit mismatch")
    if instance["base"]["branch"] != request["branch"]:
        errors.append("base branch mismatch")
    return errors


def evidence_semantic_errors(instance: dict[str, Any]) -> list[str]:
    prohibited = {"authority", "authorized", "approval", "approved", "gateapproval", "grantsauthority"}
    errors: list[str] = []

    def walk(value: Any) -> None:
        if isinstance(value, dict):
            for key, child in value.items():
                normalized = "".join(ch for ch in key.lower() if ch.isalnum())
                if normalized in prohibited:
                    errors.append(f"prohibited authority-like field: {key}")
                walk(child)
        elif isinstance(value, list):
            for child in value:
                walk(child)

    walk(instance)
    if not instance["contentDigest"].startswith("sha256:"):
        errors.append("evidence is not content-addressable")
    if not instance["review"]["advisory"]:
        errors.append("review must remain advisory")
    return errors


def validate_contract_slice(name: str) -> list[str]:
    validator = schema_validator(SCHEMAS[name])
    fixture_root = SCHEMAS[name].parent / "fixtures"
    failures: list[str] = []

    for path in sorted((fixture_root / "valid").glob("*.json")):
        instance = load_json(path)
        errors = list(validator.iter_errors(instance))
        semantic = (
            mission_semantic_errors(instance)
            if name == "authority"
            else evidence_semantic_errors(instance)
            if name == "evidence"
            else []
        )
        if errors or semantic:
            failures.append(f"{path.relative_to(ROOT)} expected PASS: {errors!s} {semantic!s}")

    for path in sorted((fixture_root / "invalid").glob("*.json")):
        instance = load_json(path)
        errors = list(validator.iter_errors(instance))
        semantic: list[str] = []
        if not errors and name == "authority":
            semantic = mission_semantic_errors(instance)
        elif not errors and name == "evidence":
            semantic = evidence_semantic_errors(instance)
        if not errors and not semantic:
            failures.append(f"{path.relative_to(ROOT)} expected REJECT but passed")

    return failures


def harness_semantic_errors(instance: dict[str, Any]) -> list[str]:
    errors: list[str] = []
    release = instance["release"]
    ready = (
        release["available"]
        and release["compatible"]
        and instance["sddCompatibility"]["verified"]
        and instance["installation"]["verified"]
    )
    if instance["readiness"] == "READY" and not ready:
        errors.append("READY requires an available compatible verified installation")
    if instance["readiness"] == "BLOCKED" and ready:
        errors.append("verified compatible installation must not report BLOCKED")
    if not release["available"] and any(
        release[field] is not None for field in ("version", "commit", "digest")
    ):
        errors.append("unavailable release must not carry placeholder identity")
    if instance["mission"]["verified"]:
        errors.append("readiness profile must not pre-verify a mission")
    return errors


def workflow_semantic_errors(instance: dict[str, Any]) -> list[str]:
    errors: list[str] = []
    if instance["readiness"] == "DEGRADED":
        outage = instance.get("outage", {})
        binding = outage.get("missionBinding")
        if outage.get("adoptedDegradedPolicy") is not True or not isinstance(
            binding, dict
        ):
            errors.append("DEGRADED requires adopted policy and immutable mission")
            return errors
        reference = (ROOT / binding["envelopeReference"]).resolve()
        try:
            reference.relative_to(ROOT.resolve())
        except ValueError:
            errors.append("DEGRADED mission reference escapes the repository")
            return errors
        if not reference.is_file():
            errors.append("DEGRADED mission reference does not exist")
            return errors
        actual_digest = "sha256:" + hashlib.sha256(reference.read_bytes()).hexdigest()
        if not hmac.compare_digest(binding["envelopeDigest"], actual_digest):
            errors.append("DEGRADED mission envelope digest mismatch")
            return errors
        mission = load_json(reference)
        mission_schema_errors = list(
            schema_validator(SCHEMAS["authority"]).iter_errors(mission)
        )
        if mission_schema_errors:
            errors.append("DEGRADED mission envelope fails its schema")
            return errors
        errors.extend(
            f"DEGRADED mission: {error}" for error in mission_semantic_errors(mission)
        )
        if binding["missionId"] != mission["missionId"]:
            errors.append("DEGRADED mission ID binding mismatch")
        if binding["nonce"] != mission["nonce"]:
            errors.append("DEGRADED mission nonce binding mismatch")
    return errors


def validate_integration_slice(name: str) -> list[str]:
    validator = schema_validator(INTEGRATION_SCHEMAS[name])
    failures: list[str] = []
    if name == "harness":
        fixture_root = ROOT / "integrations/fusion-harness/fixtures"
        paths = sorted(fixture_root.glob("*.yaml"))
        paths.append(ROOT / "integrations/fusion-harness/compatibility.yaml")
    else:
        fixture_root = ROOT / "integrations/agent-workflow/fixtures"
        paths = sorted(fixture_root.glob("*.yaml"))
        schema_validator(ROOT / "integrations/agent-workflow/registration.schema.json")

    for path in paths:
        instance = load_yaml(path)
        errors = list(validator.iter_errors(instance))
        semantic = (
            harness_semantic_errors(instance)
            if name == "harness"
            else workflow_semantic_errors(instance)
        )
        expected_reject = path.name == "degraded-invalid.yaml"
        if expected_reject:
            if not errors and not semantic:
                failures.append(f"{path.relative_to(ROOT)} expected REJECT but passed")
        elif errors or semantic:
            failures.append(
                f"{path.relative_to(ROOT)} expected PASS: {errors!s} {semantic!s}"
            )
    return failures


def validate_template() -> list[str]:
    validator = schema_validator(SCHEMAS["adoption"])
    path = ROOT / "templates/project/.sdd-core/adoption.yaml"
    errors = list(validator.iter_errors(load_yaml(path)))
    if errors:
        return [f"{path.relative_to(ROOT)} expected PASS: {errors!s}"]
    return []


def repository_markdown_files() -> list[Path]:
    files: list[Path] = []
    for path in ROOT.rglob("*.md"):
        relative = path.relative_to(ROOT)
        if relative.parts[:2] == ("reference", "repos"):
            continue
        if ".git" in relative.parts:
            continue
        files.append(path)
    return sorted(files)


def front_matter(path: Path) -> Any:
    text = path.read_text(encoding="utf-8-sig")
    lines = text.splitlines()
    if not lines or lines[0] != "---":
        raise ValueError("missing opening delimiter")
    try:
        end = lines.index("---", 1)
    except ValueError as exc:
        raise ValueError("missing closing delimiter") from exc
    data = yaml.safe_load("\n".join(lines[1:end]))
    if not isinstance(data, dict):
        raise ValueError("front matter must be a mapping")
    return data


def validate_front_matter() -> list[str]:
    roots = (
        ROOT / "contracts",
        ROOT / "integrations",
        ROOT / "bootstrap",
        ROOT / "templates/project",
        ROOT / "docs/migrations/sdd-core-reset-v4",
        ROOT / "docs/specs/001-sdd-core-reset/records",
    )
    explicit = (
        ROOT / "governance/framework/ownership.md",
        ROOT / "governance/operations/ownership.md",
    )
    paths = [
        path
        for root in roots
        if root.exists()
        for path in root.rglob("*.md")
    ]
    paths.extend(path for path in explicit if path.exists())
    failures: list[str] = []
    for path in sorted(set(paths)):
        try:
            data = front_matter(path)
        except (UnicodeDecodeError, ValueError, yaml.YAMLError) as exc:
            failures.append(f"{path.relative_to(ROOT)} invalid front matter: {exc}")
            continue
        for required in ("title", "status"):
            if not data.get(required):
                failures.append(
                    f"{path.relative_to(ROOT)} front matter missing {required}"
                )
    return failures


MARKDOWN_LINK = re.compile(r"!?\[[^\]]*\]\(([^)]+)\)")


def validate_markdown_links() -> list[str]:
    failures: list[str] = []
    for path in repository_markdown_files():
        text = path.read_text(encoding="utf-8-sig")
        for raw_target in MARKDOWN_LINK.findall(text):
            target = raw_target.strip()
            if target.startswith("<") and target.endswith(">"):
                target = target[1:-1]
            if re.match(r"^(?:[a-z][a-z0-9+.-]*:|#)", target, re.I):
                continue
            target = target.split("#", 1)[0].split("?", 1)[0]
            if not target or any(marker in target for marker in ("{", "}", "*")):
                continue
            resolved = (path.parent / unquote(target)).resolve()
            try:
                resolved.relative_to(ROOT.resolve())
            except ValueError:
                failures.append(
                    f"{path.relative_to(ROOT)} link escapes repository: {raw_target}"
                )
                continue
            if not resolved.exists():
                failures.append(
                    f"{path.relative_to(ROOT)} unresolved link: {raw_target}"
                )
    return failures


def validate_structured_files() -> list[str]:
    failures: list[str] = []
    excluded = ROOT / "reference/repos"
    for path in ROOT.rglob("*"):
        if not path.is_file():
            continue
        try:
            path.relative_to(excluded)
            continue
        except ValueError:
            pass
        try:
            if path.suffix == ".json":
                load_json(path)
            elif path.suffix in (".yaml", ".yml"):
                load_yaml(path)
            elif path.suffix == ".svg":
                ElementTree.parse(path)
        except Exception as exc:  # validation reports the exact parser failure
            failures.append(f"{path.relative_to(ROOT)} parse failure: {exc}")
    return failures


def validate_repository_safety() -> list[str]:
    failures: list[str] = []
    personal_path = re.compile(
        r"(?:[A-Za-z]:[\\/]+Users[\\/]+[^\\/\s]+|/home/[^/\s]+)"
    )
    excluded = ROOT / "reference/repos"
    for path in ROOT.rglob("*"):
        if not path.is_file():
            continue
        try:
            path.relative_to(excluded)
            continue
        except ValueError:
            pass
        if path.suffix.lower() not in {
            ".md",
            ".json",
            ".yaml",
            ".yml",
            ".sh",
            ".txt",
        }:
            continue
        relative = path.relative_to(ROOT)
        if path.name.endswith(".schema.json"):
            continue
        if relative in {
            Path("contracts/adoption/fixtures/invalid/absolute-personal-path.json"),
            Path(
                "contracts/adoption/fixtures/invalid/nested-personal-path-value.json"
            ),
        }:
            continue
        try:
            text = path.read_text(encoding="utf-8-sig")
        except UnicodeDecodeError:
            continue
        if personal_path.search(text):
            failures.append(f"{path.relative_to(ROOT)} contains a personal path")

    workflow_root = ROOT / ".github/workflows"
    prohibited = re.compile(
        r"(?:contents|pull-requests|issues|actions|checks|deployments|id-token)"
        r"\s*:\s*write|claude[^\\n]*action|autofix",
        re.I,
    )
    for path in workflow_root.glob("*.y*ml"):
        if prohibited.search(path.read_text(encoding="utf-8-sig")):
            failures.append(f"{path.relative_to(ROOT)} enables write-capable automation")
    return failures


def validate_adapters() -> list[str]:
    failures: list[str] = []
    skill_names = (
        "constitution-amendment",
        "conversation-records",
        "governed-change",
        "registry-logging",
        "session-capture",
        "wip-item-bookkeeping",
    )
    for name in skill_names:
        claude = ROOT / f".claude/skills/{name}/SKILL.md"
        agents = ROOT / f".agents/skills/{name}/SKILL.md"
        if claude.read_bytes() != agents.read_bytes():
            failures.append(f"assistant skill mirror differs: {name}")
    pairs = (
        (
            ROOT / ".claude/skills/governed-change/scripts/commit-governed.sh",
            ROOT / ".agents/skills/governed-change/scripts/commit-governed.sh",
        ),
        (
            ROOT / ".claude/hooks/record-mining-reminder.sh",
            ROOT / ".codex/hooks/record-mining-reminder.sh",
        ),
    )
    for left, right in pairs:
        if left.read_bytes() != right.read_bytes():
            failures.append(
                f"assistant adapter differs: {left.relative_to(ROOT)} vs "
                f"{right.relative_to(ROOT)}"
            )
    return failures


def validate_migration_closure() -> list[str]:
    failures: list[str] = []
    map_path = ROOT / "docs/migrations/sdd-core-reset-v4/path-map.yaml"
    evidence_path = ROOT / "docs/migrations/sdd-core-reset-v4/migration-evidence.md"
    mapping = load_yaml(map_path)
    artifacts = mapping["artifacts"]
    sources = [item["source"] for item in artifacts]
    counts = {
        disposition: sum(
            item["disposition"] == disposition for item in artifacts
        )
        for disposition in ("moved", "merged", "superseded", "removed")
    }
    if len(artifacts) != 60 or len(set(sources)) != 60:
        failures.append("path map must contain 60 unique source rows")
    if counts != {"moved": 39, "merged": 3, "superseded": 16, "removed": 2}:
        failures.append(f"unexpected path-map disposition counts: {counts}")
    if mapping.get("closed_source_count") != 60:
        failures.append("path map does not close all 60 source rows")

    base_commit = mapping["base_commit"]
    for item in artifacts:
        source = item["source"]
        object_name = f"{base_commit}:{source}"
        blob = subprocess.run(
            ["git", "rev-parse", object_name],
            cwd=ROOT,
            check=True,
            capture_output=True,
            text=True,
        ).stdout.strip()
        if blob != item["source_blob"]:
            failures.append(f"source blob mismatch: {source}")
        content = subprocess.run(
            ["git", "show", object_name],
            cwd=ROOT,
            check=True,
            capture_output=True,
        ).stdout
        digest = "sha256:" + hashlib.sha256(content).hexdigest()
        if digest != item["source_sha256"]:
            failures.append(f"source SHA-256 mismatch: {source}")

    evidence = evidence_path.read_text(encoding="utf-8-sig")
    recorded_hashes = dict(
        re.findall(r"^\| `([^`]+)` \| `([0-9a-f]{64})` \|$", evidence, re.M)
    )
    moved = [item for item in artifacts if item["disposition"] == "moved"]
    for item in moved:
        target = item["target"]
        path = ROOT / target
        digest = hashlib.sha256(path.read_bytes()).hexdigest()
        if recorded_hashes.get(target) != digest:
            failures.append(f"moved-target hash mismatch: {target}")
    if len(recorded_hashes) != len(moved):
        failures.append(
            f"migration evidence has {len(recorded_hashes)} target hashes; "
            f"expected {len(moved)}"
        )

    centcom = [
        item
        for item in artifacts
        if "002-centcom-phase-2-live-github-ingestion" in item["source"]
    ]
    if len(centcom) != 15 or any(
        item["disposition"] != "superseded"
        or mapping["centcom_preservation_commit"] not in item["target"]
        for item in centcom
    ):
        failures.append("CentCom 15-file preservation mapping is incomplete")

    conversations = (ROOT / "conversations/SYNC-POLICY.md").read_text(
        encoding="utf-8-sig"
    )
    if "framework-definition" not in conversations or (
        "operational-governance" not in conversations
    ):
        failures.append("merged domain conversation routing is not preserved")
    records = (ROOT / "governance/operations/records/README.md").read_text(
        encoding="utf-8-sig"
    )
    if "register definition" not in records.lower():
        failures.append("merged register-definition guidance is not preserved")
    return failures


def validate_domain_guidance() -> list[str]:
    failures: list[str] = []
    framework = (ROOT / "governance/framework/README.md").read_text(
        encoding="utf-8-sig"
    )
    operations = (ROOT / "governance/operations/README.md").read_text(
        encoding="utf-8-sig"
    )
    combined = framework + "\n" + operations
    for prohibited in (
        "This project",
        "neither project's",
        "├── .specify/",
        "├── .claude/",
        "├── conversations/",
        "├── registers/",
    ):
        if prohibited in combined:
            failures.append(f"domain guidance retains stale identity/path: {prohibited}")
    return failures


def validate_static_repository() -> list[str]:
    failures: list[str] = []
    failures.extend(validate_front_matter())
    failures.extend(validate_markdown_links())
    failures.extend(validate_structured_files())
    failures.extend(validate_repository_safety())
    failures.extend(validate_adapters())
    failures.extend(validate_migration_closure())
    failures.extend(validate_domain_guidance())
    return failures


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--slice",
        choices=[
            "adoption",
            "authority",
            "evidence",
            "harness",
            "workflow",
            "template",
            "static",
            "all",
        ],
        default="all",
    )
    args = parser.parse_args()
    slices = (
        [*SCHEMAS, *INTEGRATION_SCHEMAS, "template", "static"]
        if args.slice == "all"
        else [args.slice]
    )
    failures: list[str] = []
    for name in slices:
        if name in SCHEMAS:
            failures.extend(validate_contract_slice(name))
        elif name in INTEGRATION_SCHEMAS:
            failures.extend(validate_integration_slice(name))
        elif name == "template":
            failures.extend(validate_template())
        else:
            failures.extend(validate_static_repository())
    if failures:
        for failure in failures:
            print(f"FAIL: {failure}")
        return 1
    print(f"PASS: {', '.join(slices)} contract fixtures")
    return 0


if __name__ == "__main__":
    sys.exit(main())
