---
title: SDD-Core Reset v4 Independent Governance and Preservation Review
status: completed
topic: independent-reset-review
scope: GLOBAL
reviewed_on: 2026-07-28
reviewer_role: independent-codex-reviewer
review_round: R3
verdict: ACCEPT
base_commit: d3363238bb2d2f513f09b364926ff4146cc376ff
planning_commit: cc4f4b17ccca428334689cc5ab381741470168c0
plan_sha256: C83198CE8CDAA85E27696273A2DE13F543D8CB1B45C2AD91FA753ECE4735354D
---

# SDD-Core Reset v4 Independent Governance and Preservation Review

## Final verdict

ACCEPT

The atomic-rebuild candidate satisfies the T021 independent governance and
preservation gate. Every R1 blocking finding remains resolved, the T020 local
gate is independently reproducible, and no new finding was identified. T022
may create the atomic migration commit. This verdict grants no merge, release,
deployment, adopter-update, external-repository, or remediation authority.

## R3 atomic-rebuild review

R3 independently reviewed the rebuilt, staged candidate before this review
record was edited. The candidate was based on the exact approved planning
commit `cc4f4b17ccca428334689cc5ab381741470168c0`; the approved
[`plan.md`](../../specs/001-sdd-core-reset/plan.md) recomputed to SHA-256
`C83198CE8CDAA85E27696273A2DE13F543D8CB1B45C2AD91FA753ECE4735354D`.

Pre-record-edit state was 174 staged files, zero unstaged files, and zero
untracked files. Compared with prior atomic candidate
`259291dec24ae10805a8aec553ef760f37efc576`, the rebuilt candidate differed
only in `.github/workflows/verify-layout.yml`: it added
`cache-dependency-path: requirements-validation.txt`. The exact pinned
`actions/setup-python` action at
`a26af69be951a213d495a4c3e4e4022e16d87065` declares that input for a
dependency-file path, and the referenced hash-locked requirements file is
tracked at the repository root.

Fresh R3 verification produced:

```text
git diff --cached --check
  exit 0
python scripts/validate-contracts.py
  PASS: adoption, authority, evidence, harness, workflow, template, static contract fixtures
Git Bash: bash -n verify-layout.sh
  exit 0
Git Bash: bash verify-layout.sh
  RESULT: 100% compliance — all 118 deterministic checks pass.
```

The authorized-base preservation set remains closed: 60 base paths, 60 unique
map rows, 39 moved, 3 merged, 16 superseded, and 2 non-authoritative directory
sentinels removed, with zero missing sources, extra sources, blob mismatches,
missing moved/merged targets, or unique authoritative removals. No
`projects/` path remains tracked.

R3 confirmed all six R1 blockers remain resolved: mechanically authenticated
and bounded mission authority; immutable full-envelope validation for Workflow
`DEGRADED`; internal-domain identity; adoption tailoring authority and nested
secret/path safety; directly reproducible deterministic validation; and
whole-migration rollback atomicity.

The R3 reviewer performed no authority-expanding action and made no external
repository or machine-tier change. Other than this explicitly requested durable
review record, the reviewer did not edit, stage, commit, push, comment, merge,
release, deploy, or mutate repository state.

## Review boundary

The preserved R2 review below was performed independently from the
implementation author
against:

- canonical repository `https://github.com/hanax-ai/sdd-core.git`;
- authorized base branch `release/sdd-core-v3.0.0-rc.1`;
- authorized base commit
  `d3363238bb2d2f513f09b364926ff4146cc376ff`;
- planning commit
  `cc4f4b17ccca428334689cc5ab381741470168c0`;
- approved
  [`plan.md`](../../specs/001-sdd-core-reset/plan.md), SHA-256
  `C83198CE8CDAA85E27696273A2DE13F543D8CB1B45C2AD91FA753ECE4735354D`;
- the approved
  [architecture proposal](../../proposals/sdd-core-reset-architecture.md),
  [specification](../../specs/001-sdd-core-reset/spec.md), and
  [tasks](../../specs/001-sdd-core-reset/tasks.md);
- the current stable, uncommitted implementation candidate.

The exact plan digest recomputed successfully and matches the
[Gate 2 authority record](../../specs/001-sdd-core-reset/records/implementation-authorization.md).
The planning commit differs from the authorized base by only `spec.md`,
`plan.md`, and `tasks.md`.

```text
git rev-parse --show-toplevel
  <isolated-sdd-core-worktree>
git branch --show-current
  codex/sdd-core-reset-planning
git rev-parse HEAD
  cc4f4b17ccca428334689cc5ab381741470168c0
```

The reviewer edited only this review record. No implementation file was
edited, staged, committed, pushed, merged, released, or deployed. External
repositories and machine-tier state were inspected read-only.

## R1 finding dispositions

| R1 finding | R2 disposition | Requirement and evidence |
|---|---|---|
| CRITICAL-01: mission authority was not mechanically bounded or verified | **RESOLVED** | Proposal R12/R14; FR-012/FR-014; CC-006. The closed schema now includes issuer authority/reference/trigger, trust binding, canonical digest, RS256 signature, branch and complete scope, prohibitions, resource limits, validation/evidence, completion, and next boundary. Independent digest and signature recomputation passed; all negative authority cases were detected. |
| CRITICAL-02: Workflow `DEGRADED` was self-asserted | **RESOLVED** | Proposal R18; FR-021/FR-022; CC-008/CC-014. Status now binds mission ID, nonce, repository-relative envelope reference, and raw envelope digest. The validator loads the referenced envelope and applies its full schema and semantic validation. |
| IMPORTANT-01: domain READMEs retained project identity and stale paths | **RESOLVED** | Proposal R2/R3/R5/R23; FR-004/FR-005/FR-007; CC-003/CC-012. Framework and operations identify as internal domains, their live trees match the candidate, and stale project wording and nonexistent domain-local paths are absent. |
| IMPORTANT-02: adoption tailoring authority and nested value safety were incomplete | **RESOLVED** | Proposal R6/R7; FR-008/FR-010/FR-011/FR-014; CC-005. Every tailoring requires treatment, rationale, and authority reference. Protected provisions, secret-bearing allowed values, nested secret keys, and personal paths reject. |
| IMPORTANT-03: T020 was not directly reproducible and verifier coverage was incomplete | **RESOLVED** | FR-026/FR-027 and T018-T020. Direct invocation now creates or reuses only a disposable requirements-digest-keyed environment when the caller lacks dependencies. The direct validator passes and the full verifier reports 118/118, including the remediated blockers and preservation recomputation. |
| IMPORTANT-04: rollback could create a mixed state | **RESOLVED** | Proposal R3/R24; FR-005/FR-027; CC-015. Post-merge rollback requires both whole-commit reverts, newest-first with `--no-commit`, followed by one rollback commit. Partial or intermediate publication is forbidden. |

## Mission authority verification

Reviewed paths:

- [`contracts/authority/mission-envelope.schema.json`](../../../contracts/authority/mission-envelope.schema.json)
- [`contracts/authority/trust-profiles.json`](../../../contracts/authority/trust-profiles.json)
- [`contracts/authority/README.md`](../../../contracts/authority/README.md)
- [`contracts/authority/fixtures/`](../../../contracts/authority/fixtures/)
- [`scripts/validate-contracts.py`](../../../scripts/validate-contracts.py)

The canonical payload was independently rebuilt as sorted, compact UTF-8 JSON
after removing only `integrity.canonicalDigest` and `signature.value`.
Independent SHA-256 and PKCS#1 v1.5 SHA-256 verification against the exact
RS256 modulus and exponent in `trust-profiles.json` produced:

```text
valid_digest_recomputed=True
valid_rs256_verified=True
trust_profile_id_found=True
trust_profile_digest_bound=True
trust_profile_key_bound=True
```

The required invalid fixtures were independently classified:

```text
base-mismatch=base
branch-expanded=branch
digest-mismatch=digest
expired=expiry
frozen-policy-changed=frozen-policy
missing-signature=missing-signature
prohibited-action=prohibited-action
replayed=replay
revoked=revocation
scope-expanded=scope
signature-mismatch=signature
superseded=supersession
required_fixture_cases_detected=True
```

The validator slice independently returned:

```text
PASS: authority contract fixtures
```

This proves signature, digest, verification-time expiry, revocation,
supersession, replay, repository/path/action scope, branch, environment,
capability, tool, MCP-operation, prohibited-action, frozen-policy, and base
controls. No `verified` boolean is accepted as authority.

## Workflow degraded-mode integrity

Reviewed paths:

- [`integrations/agent-workflow/status.schema.json`](../../../integrations/agent-workflow/status.schema.json)
- [`integrations/agent-workflow/README.md`](../../../integrations/agent-workflow/README.md)
- [`integrations/agent-workflow/fixtures/`](../../../integrations/agent-workflow/fixtures/)

The valid degraded fixture binds an immutable mission by mission ID, nonce,
repository-relative envelope reference, and SHA-256 of the complete envelope.
The invalid fixture fails that content binding.

An additional in-memory review test rebound the valid Workflow status to every
invalid authority fixture using that fixture's correct raw file digest. Full
mission validation rejected all 12 invalid mission cases:

```text
workflow_valid_errors=0
workflow_bad_binding_detected=True
workflow_full_validation_base-mismatch=True
workflow_full_validation_branch-expanded=True
workflow_full_validation_digest-mismatch=True
workflow_full_validation_expired=True
workflow_full_validation_frozen-policy-changed=True
workflow_full_validation_missing-signature=True
workflow_full_validation_prohibited-action=True
workflow_full_validation_replayed=True
workflow_full_validation_revoked=True
workflow_full_validation_scope-expanded=True
workflow_full_validation_signature-mismatch=True
workflow_full_validation_superseded=True
workflow_all_invalid_missions_rejected=True
PASS: workflow contract fixtures
```

Workflow remains coordination-only: execution is `DORMANT`, evidence is
`REFERENCE_ONLY`, authority is `NOT_GRANTED`, reconciliation is mandatory,
and Workflow cannot create, refresh, widen, or execute the mission.

## Adoption, sovereignty, and protected provisions

Reviewed paths:

- [`contracts/adoption/project-adoption.schema.json`](../../../contracts/adoption/project-adoption.schema.json)
- [`contracts/adoption/README.md`](../../../contracts/adoption/README.md)
- [`contracts/adoption/fixtures/`](../../../contracts/adoption/fixtures/)
- [`templates/project/`](../../../templates/project/)

The schema requires all ten constitutional provisions, including Gate 2, WIP
non-authority, scope isolation, and cross-repository boundaries, and forbids
their omission, tailoring, or exclusion. The root constitution, contract
README, and project template preserve adopter ownership and grant no implicit
SDD-Core write or approval authority.

Focused schema tests produced:

```text
valid_tailoring_accepted=True
missing_rationale_rejected=True
missing_authorityReference_rejected=True
nested_allowed_secret_rejected=True
nested_personal_path_rejected=True
nested_secret_key_rejected=True
tailoring-missing-rationale.json_rejected=True
nested-secret-value.json_rejected=True
nested-personal-path-value.json_rejected=True
PASS: adoption contract fixtures
```

## Domain separation and readiness

Reviewed paths:

- [`governance/framework/README.md`](../../../governance/framework/README.md)
- [`governance/framework/constitution.md`](../../../governance/framework/constitution.md)
- [`governance/framework/ownership.md`](../../../governance/framework/ownership.md)
- [`governance/operations/README.md`](../../../governance/operations/README.md)
- [`governance/operations/constitution.md`](../../../governance/operations/constitution.md)
- [`governance/operations/ownership.md`](../../../governance/operations/ownership.md)
- [`bootstrap/new-project.md`](../../../bootstrap/new-project.md)

GLOBAL, FRAMEWORK-DEFINITION, and OPERATIONAL-GOVERNANCE have explicit,
non-overlapping write and ownership boundaries. The one-way dependency runs
from ratified framework definitions to operational procedures; operations
cannot redefine framework policy. The relocated trees no longer claim
application-project, adopter, repository, or Gate authority.

Readiness permits only allowlisted metadata inspection and context assembly.
It explicitly forbids application-code access, secrets, network activity,
installation or hook invocation, connections, models, agents, MCP invocation,
repository or machine mutation, integration-state changes, and governance-gate
advancement. Disposable caching is outside governed state, contains no
secrets, and creates neither authority nor evidence.

## Sixty-source preservation

The [path map](path-map.yaml) was independently compared with the authorized
base through Git object reads and SHA-256 recomputation:

```text
base_paths=60
map_rows=60
unique_sources=60
source_sets_exact=True
disposition_counts={'moved': 39, 'merged': 3, 'superseded': 16, 'removed': 2}
source_blob_sha_or_target_failures=0
moved_rows=39
recorded_target_hashes=39
moved_target_hash_mismatches=0
git ls-files -- projects projects/**
  zero paths
```

All 60 authorized-base source paths have exactly one disposition. Every source
blob ID and SHA-256 matches the base, every moved or merged target exists, and
all 39 moved-target hashes match
[migration-evidence.md](migration-evidence.md). The two removed artifacts are
empty directory sentinels; merged conversation and register-definition
guidance remains present in its target.

## CentCom preservation

Read-only GitHub API and Git object comparison against immutable commit
[`201dde50268650e6ad489f483d5c57d3eeef2f3f`](https://github.com/hanax-ai/sdd-core-centcom-dashboard/commit/201dde50268650e6ad489f483d5c57d3eeef2f3f)
produced:

```text
centcom_map_rows=15
centcom_remote_files=15
centcom_blob_mismatches=0
centcom_source_archive_sha256=a56a64a4132324c0cf2bb8da5a5afe58da5e6d78bfbfae5bb0f986eef6f8e204
preservation_pr_state=open
preservation_pr_draft=True
preservation_pr_head=201dde50268650e6ad489f483d5c57d3eeef2f3f
```

Every remote target blob is byte-identical to its corresponding source blob at
the authorized SDD-Core base. Draft
[PR #20](https://github.com/hanax-ai/sdd-core-centcom-dashboard/pull/20)
preserves review state but grants no merge or implementation authority.

## Rollback and atomicity

[`rollback.md`](rollback.md) now matches the approved plan:

1. obtain one separate exact human authorization naming both commits;
2. apply the newer evidence-closure revert first with `--no-commit`;
3. apply the older atomic migration revert second with `--no-commit`;
4. create one rollback commit containing both inverse changes.

Both reverts are mandatory. Partial restoration, stale closure evidence, and
publication of an intermediate mixed authority state are prohibited. Before
merge, the branch/worktree may be abandoned without changing another worktree.

## Remediation and external boundaries

The candidate has one workflow,
`.github/workflows/verify-layout.yml`. It uses pinned action commits, disables
checkout credential persistence, grants only `contents: read`, installs exact
hash-locked validation dependencies, and runs the same verifier on
`ubuntu-latest` and `windows-latest`.

```text
workflow_count=1
write_capable_matches=0
```

Claude Action, Workflow remediation scheduling, Harness remediation, Autofix,
automatic commit/push/PR/merge, release, deployment, rollback, and
write-capable agent permissions remain disabled.

External inspection was read-only. The Fusion Harness checkout remained clean
at `5170938c9858bebbe40c2360875bb6cd7d1422b0`. The Agent Workflow checkout
remained at `dd46eb827aeae5051133f946479ae9af7696be6d` with the same 16-entry
working-tree state observed at the first R2 external-repository inspection. No
SDD-Core candidate path writes to an external repository or machine-tier
configuration.

## Independent T020 reproduction

The caller's base Python 3.11 environment does not contain `jsonschema`.
Direct invocation therefore used only the script-controlled disposable cache
keyed by the exact requirements digest and platform:

```text
cache_key=3111bf58a268d82aaa52
python_exists=True
marker_matches=True
jsonschema=4.26.0
pyyaml=6.0.3

python scripts/validate-contracts.py
  PASS: adoption, authority, evidence, harness, workflow, template, static contract fixtures

git diff --check <authorized-base>
  exit 0

Git Bash: bash -n verify-layout.sh
  exit 0

Git Bash: bash verify-layout.sh
  RESULT: 100% compliance — all 118 deterministic checks pass.
```

The validator compiles the schemas with format assertion, reproduces every
catalog outcome, validates front matter and local links, parses repository
JSON/YAML/SVG, scans secret/personal-path and write-capable automation
surfaces, verifies adapter parity, recomputes migration closure, and checks
domain guidance. The disposable environment changes neither repository nor
machine-tier configuration.

## Required finding matrix

| Required T021 area | R2 result |
|---|---|
| Authority non-inference | **PASS** — policy, evidence schema, CI, Workflow, and mission verification keep evidence/state separate from human authority |
| Protected provisions | **PASS** — exact required set; omission, exclusion, and tailoring reject |
| GLOBAL / FRAMEWORK-DEFINITION / OPERATIONAL-GOVERNANCE | **PASS** — identity, live structure, ownership, and one-way dependency align |
| Adopter sovereignty | **PASS** — adopter owns repository, constitution, implementation, releases, and evidence; no implicit write authority |
| Readiness non-mutation | **PASS** — complete side-effect prohibition and disposable non-authoritative cache boundary |
| Agent Workflow degraded mission integrity | **PASS** — immutable binding plus full schema, digest, signature, time, state, policy, base, and scope validation |
| External-repository isolation | **PASS** — review operations were read-only; candidate scope remains inside SDD-Core |
| All 60 source dispositions | **PASS** — exact source set, blob IDs, SHA-256 values, dispositions, and targets |
| CentCom 15-file preservation | **PASS** — 15/15 target blob IDs match the authorized-base source blobs |
| CI/CD remediation disabled | **PASS** — read-only workflow and zero write-capable action matches |
| Deterministic local validation | **PASS** — direct validator and full 118/118 verifier reproduced |
| Rollback atomicity | **PASS** — newest-first, both `--no-commit`, one rollback commit |

## Non-blocking notes

1. Remote Linux and Windows CI plus completed advisory CodeRabbit review remain
   intentionally pending until T023, after T022 creates the immutable atomic
   migration commit. Their pending state creates no authority and is not a
   T021 waiver.
2. Compatible immutable Fusion Harness and Agent Workflow releases and the
   machine-tier independent-repository conversation-routing update remain
   declared external dependencies. The current profiles correctly report
   missing runtime compatibility as `BLOCKED` rather than simulated readiness.

## Next authority boundary

T021 is accepted. T022 may stage the complete authorized implementation
surface and create the one atomic migration commit, then rerun the full
verifier on that commit. Do not merge, release, deploy, update adopters, modify
external repositories or machine-tier state, or enable remediation without
the next exact authority.
