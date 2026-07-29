---
title: SDD-Core Reset v4 Independent Governance and Preservation Review
status: completed
topic: independent-reset-review
scope: GLOBAL
reviewed_on: 2026-07-29
reviewer_role: independent-codex-reviewer
review_round: R9
verdict: ACCEPT
base_commit: d3363238bb2d2f513f09b364926ff4146cc376ff
planning_commit: cc4f4b17ccca428334689cc5ab381741470168c0
plan_sha256: C83198CE8CDAA85E27696273A2DE13F543D8CB1B45C2AD91FA753ECE4735354D
---

# SDD-Core Reset v4 Independent Governance and Preservation Review

> **Historical review notice (PR #7 remediation):** R1-R7 below are preserved
> as the review history of earlier candidate trees. The front matter identifies
> R9 as the current review. R8 was rejected before a review-record edit; the R9
> section records verification of its correction. The earlier rounds'
> repository-local `.validation-venv` assessment is superseded and is not a
> current validation-environment claim. The review-remediation tree uses a
> private, unpredictable, process-scoped temporary environment outside the
> repository. The PR #7 remediation tree requires a fresh T021 review whose
> reviewer appends and owns the final review metadata before the atomic commit.

## Final verdict

ACCEPT

The security-rebuild candidate satisfies the T021 independent governance and
preservation gate. Every R1 blocking finding remains resolved, the T020 local
gate is independently reproducible, and the shared-temporary-environment
finding is resolved. T022 may create the atomic migration commit. This verdict
grants no merge, release, deployment, adopter-update, external-repository, or
remediation authority.

## R5 validation-environment security review

R5 independently reviewed the security-rebuilt, staged candidate before this
review record was edited. The candidate was based on the exact approved
planning commit `cc4f4b17ccca428334689cc5ab381741470168c0`; the approved
[`plan.md`](../../specs/001-sdd-core-reset/plan.md) recomputed to SHA-256
`C83198CE8CDAA85E27696273A2DE13F543D8CB1B45C2AD91FA753ECE4735354D`.
Pre-record-edit state was 174 staged files, zero unstaged files, and zero
untracked files.

Compared with the R4 atomic commit
`718a121db714bce0043215387a01e09af561217a`, the security rebuild changed only
`.gitignore` and `scripts/validate-contracts.py`. It removes `tempfile`, moves
the deterministic environment from the shared temporary directory to
`ROOT / ".validation-venv" / cache_key`, creates only that repository-local
parent, and ignores `.validation-venv/`. Both earlier workflow corrections,
`cache-dependency-path: requirements-validation.txt` and `fetch-depth: 0`,
remain present.

The critical pre-planting path is closed for users outside the worktree trust
boundary: the validator no longer discovers or executes an interpreter from a
shared temporary namespace. A principal able to modify the worktree already
has repository-content mutation capability; the ignored environment introduces
no broader principal or location trust. The reviewed cache directory and
interpreter were owned under the worktree, were not reparse points, and were
ignored by Git.

The dependency-missing bootstrap had created cache key
`3111bf58a268d82aaa52`. Its `.requirements-sha256` marker exactly matched the
current hash-locked requirements digest
`4f2d2d47e67d62676e476f8de6f4b4584883aac1304a2f1d503ee3bfc0b1f9f1`;
the isolated interpreter contained `jsonschema==4.26.0` and `PyYAML==6.0.3`.
R5 independently exercised reuse: the authority slice exited zero without a
new bootstrap, the environment remained ignored, and Git remained at zero
unstaged and zero untracked paths. These ignored disposable cache writes are
non-authoritative local validation state, not tracked or governed repository
state.

Fresh R5 verification produced:

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
missing moved/merged targets, or unique authoritative removals. Fifteen
CentCom preservation rows remain mapped, and no `projects/` path remains
tracked.

R5 confirmed all six R1 blockers remain resolved: mechanically authenticated
and bounded mission authority; immutable full-envelope validation for Workflow
`DEGRADED`; internal-domain identity; adoption tailoring authority and nested
secret/path safety; directly reproducible deterministic validation; and
whole-migration rollback atomicity.

The R5 reviewer performed no authority-expanding action and made no external
repository or machine-tier change. Other than this explicitly requested durable
review record and exercising the ignored disposable validation cache, the
reviewer did not edit, stage, commit, push, comment, merge, release, deploy, or
mutate governed repository state.

## R4 complete-history CI review

R4 independently reviewed the second rebuilt, staged candidate before this
review record was edited. The candidate was based on the exact approved
planning commit `cc4f4b17ccca428334689cc5ab381741470168c0`; the approved
[`plan.md`](../../specs/001-sdd-core-reset/plan.md) recomputed to SHA-256
`C83198CE8CDAA85E27696273A2DE13F543D8CB1B45C2AD91FA753ECE4735354D`.

Pre-record-edit state was 174 staged files, zero unstaged files, and zero
untracked files. Compared with the R3 atomic commit
`9d1d839a112598570a37a71524830436f1691c63`, the second rebuilt candidate
differed only in `.github/workflows/verify-layout.yml`: it added
`fetch-depth: 0` to the pinned checkout step. The exact pinned
`actions/checkout` action at
`b4ffde65f46336ab88eb53be808477a3936bae11` defines `fetch-depth: 0` as
fetching all history for all branches and tags. That makes authorized base
commit `d3363238bb2d2f513f09b364926ff4146cc376ff` available to the migration
closure checks while preserving `persist-credentials: false` and
`contents: read`.

The previously accepted correction also remains present:
`cache-dependency-path: requirements-validation.txt`. The exact pinned
`actions/setup-python` action at
`a26af69be951a213d495a4c3e4e4022e16d87065` declares that input for a
dependency-file path, and the referenced hash-locked requirements file remains
tracked at the repository root.

Fresh R4 verification produced:

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
missing moved/merged targets, or unique authoritative removals. Fifteen
CentCom preservation rows remain mapped, and no `projects/` path remains
tracked.

R4 confirmed all six R1 blockers remain resolved: mechanically authenticated
and bounded mission authority; immutable full-envelope validation for Workflow
`DEGRADED`; internal-domain identity; adoption tailoring authority and nested
secret/path safety; directly reproducible deterministic validation; and
whole-migration rollback atomicity.

The checkout-depth correction restores required read-only Git history; it does
not add repository credentials, write permission, mutation behavior, or
authority. The R4 reviewer performed no authority-expanding action and made no
external repository or machine-tier change. Other than this explicitly
requested durable review record, the reviewer did not edit, stage, commit,
push, comment, merge, release, deploy, or mutate repository state.

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

## R6 review-remediation rebuild

R6 is a fresh T021 review of the staged review-remediation rebuild. It does not
rely on the historical R1-R5 verdicts for the current tree.

### Exact review baseline

```text
git rev-parse HEAD
  cc4f4b17ccca428334689cc5ab381741470168c0

git rev-parse HEAD^
  d3363238bb2d2f513f09b364926ff4146cc376ff

git write-tree
  b0a30102dfdf282ca54689810e3922b1e8087f9b

git status --short
  180 staged paths; zero unstaged paths; zero untracked paths
```

The staged rebuild is based directly on the exact planning commit. The
prepared tree matched the implementation report before R6 made its one
permitted review-evidence edit.

### Review-remediation dispositions

R6 inspected the full staged change set and the focused 62-path delta from the
prior candidate. The required dispositions are satisfied:

| Review-remediation area | R6 result |
|---|---|
| Governance-evidence ownership in mirrored skills | **PASS** — adopter evidence and governing SDD-Core evidence are separated |
| Session-capture dependencies | **PASS** — all conversation dependencies and the machine-local `conversations/_index.md` path are explicit |
| Workflow outage state | **PASS** — missing policy or mission is `BLOCKED`; both permit only bounded `DEGRADED` operation |
| Adoption semantic conflicts | **PASS** — duplicate tailored IDs and tailored/excluded overlap reject |
| Evidence-path traversal | **PASS** — slash and backslash `..` segments reject |
| Human gate authority | **PASS** — recognized human authority must be recorded by Agent Zero |
| Copied software-template links | **PASS** — links resolve from `docs/specs/<feature>/` |
| Framework task context | **PASS** — GLOBAL and domain constitutions and registries load before plan/spec |
| Deliverables ownership | **PASS** — live inventories are explicitly adopter-side |
| Operations terminology | **PASS** — OPERATIONAL-GOVERNANCE uses domain constitution/principle terminology |
| Knowledge precedence | **PASS** — GLOBAL, then domain, then adopter; narrower sources cannot override GLOBAL authority |
| Fusion Harness boundary | **PASS** — separately authorized operationalization keeps automatic mandatory installation/binding while SDD-Core performs no machine-tier installation |
| WIP index schema | **PASS** — required YAML front matter is preserved and included in the canonical schema |

The bounded terminology, hook, fixture-isolation, constitution, security,
README-link, Gate-language, and synthetic-date cleanups also match the review
brief. The protected `prohibited-action.json` fixture remains unchanged from
the prior candidate because no signing key or authority to replace its signed
evidence was introduced.

### Frozen authority and preservation

```text
docs/specs/001-sdd-core-reset/plan.md
  HEAD/index/worktree blob: e58e7b6d3bc464b9e0012ad5454aacce30189bad
  SHA-256: C83198CE8CDAA85E27696273A2DE13F543D8CB1B45C2AD91FA753ECE4735354D

docs/specs/001-sdd-core-reset/spec.md
  HEAD/index/worktree blob: 4e828d515df0ce7884bb178a789e2d46cd0197ad
  SHA-256: FD879701164A7CA6A2CD1C4502CD8C7B86E4AA9E7EB76535F967A5AA11FC5FF7

docs/specs/001-sdd-core-reset/tasks.md
  HEAD/index/worktree blob: 9542fbb4217d11aa30b84baf5b5f77f0bf67aa21
  SHA-256: 5ABADE413453836D49E0FAF80A6E7D3378466479086D329BF29AA8ECA0C6F914

read-only Git object and SHA-256 recomputation
  base_paths=60
  map_rows=60
  unique_sources=60
  source_sets_exact=True
  disposition_counts={'moved': 39, 'removed': 2, 'merged': 3, 'superseded': 16}
  source_blob_sha_or_target_failures=0
  moved_target_hash_rows=39
  moved_target_hash_mismatches=0
  tracked_projects_in_index=0
```

Read-only GitHub inspection of immutable CentCom commit
`201dde50268650e6ad489f483d5c57d3eeef2f3f` produced:

```text
centcom_map_rows=15
centcom_remote_files=15
centcom_blob_mismatches=0
PR #20 state=open
PR #20 draft=True
PR #20 head=201dde50268650e6ad489f483d5c57d3eeef2f3f
```

All six `.agents`/`.claude` skill mirror pairs and the
`.claude`/`.codex` record-mining hook pair are byte-identical.

### Security and deterministic verification

The official PyPI 0.7.1 release metadata independently returned exactly the
two pinned `defusedxml` hashes recorded in `requirements-validation.txt`:

```text
wheel  a352e7e428770286cc899e2542b6cdaedb2b4953ff269a210103ec58f6198a61
sdist  1bb3032db185915b62d7c6209c5a8792be6a32ab2fedacc84e01b52c51aa3e69
```

Fresh verification produced:

```text
python scripts/validate-contracts.py
  PASS: adoption, authority, evidence, harness, workflow, template, static contract fixtures
  exit 0

python scripts/validate-contracts.py --slice static
  PASS: static contract fixtures
  exit 0

bash -n verify-layout.sh
  exit 0

bash ./verify-layout.sh
  RESULT: 100% compliance — all 118 deterministic checks pass.
  exit 0

git diff --cached --check
  exit 0

git diff --check
  exit 0
```

The dependency-missing path installed only exact hash-locked packages into an
unpredictable `sdd-core-validation-*` directory outside the repository, used
the 600-second installation timeout, rejected the hostile SVG DTD/entity
fixture without expansion, and created no repository-local validation
environment. On Windows one temporary directory remained visible briefly
after the full verifier process returned, then automatic cleanup completed;
a focused security rerun followed by a three-second post-process check found
zero matching temporary directories.

Literal personal-path, common private-key/token, and secret-assignment scans
returned zero findings. The only personal-path-shaped matches are validator
regular expressions. The staged workflow remains read-only.

### External isolation and verdict

Read-only checks found the Fusion Harness checkout clean at
`5170938c9858bebbe40c2360875bb6cd7d1422b0` and the Agent Workflow checkout at
`dd46eb827aeae5051133f946479ae9af7696be6d` with the same 16 pre-existing
working-tree entries recorded by the earlier review. R6 issued no external
write command and changed no external repository or machine-tier
configuration.

**R6 verdict: ACCEPT.** No blocking governance, preservation, security,
atomicity, or external-isolation finding remains in the prepared staged tree.
T022 may create the single atomic implementation commit with exact parent
`cc4f4b17ccca428334689cc5ab381741470168c0` and rerun verification. Merge,
release, deployment, adopter changes, external-repository mutation, and T023
evidence closure remain outside this verdict.

## R7 PR #7 finding-remediation review

R7 is a fresh T021 review of the complete staged tree after the 17 valid PR #7
review findings were remediated. It does not infer acceptance from R1-R6 or
from the implementation report.

### Exact staged baseline

```text
git rev-parse HEAD
  cc4f4b17ccca428334689cc5ab381741470168c0

git write-tree
  bdbacf53c4bd12424cfabb8082e44c159b9030db

git status --short
  192 staged paths; zero unstaged paths; zero untracked paths
```

The exact prepared tree and branch matched the remediation brief before R7
made its one permitted review-record edit. The focused remediation delta from
the prior PR #7 head contains 34 paths. R7 inspected the full staged change
set and the focused delta.

### Finding-remediation results

| Review area | R7 result |
|---|---|
| Record-mining hook parsing and routing | **PASS** — structured JSON decoding, root-relative and absolute normalization, direct root-record handling, and project-tier suppression all work in the real hook process |
| Degraded execution transition | **PASS** — only the same independently verified, valid pre-issued mission and its existing scope can cross to execution eligibility |
| Evidence path safety | **PASS** — leading backslash, UNC/device, drive-absolute, drive-relative, and both traversal forms reject |
| Software fixture lookup shape | **PASS** — the plan consistently uses `(month, day)` |
| Framework context order | **PASS** — root constitution, root registry, domain constitution, domain registry, then active feature folder |
| Framework reference terminology | **PASS** — the framework reference names `Domain-local Mirror Refinements` |
| Adopter mirror lookup | **PASS** — validated adopter registry is last and cannot override GLOBAL/domain identity, pins, digests, or authority |
| Operations synthetic register | **PASS** — the canonical `records/register-definitions/` path is consistent |
| Workflow outage semantics | **PASS** — `READY` rejects `outage`; the negative fixture is deterministic |
| Global no-mirror fallback | **PASS** — no-spec state reports to the operator and records only a blocked machine Install Registry event without granting authority |
| macOS personal-path detection | **PASS** — bare macOS user-home values reject while the isolated negative fixture does not poison the repository scan |
| Claude Action detector | **PASS** — true CR/LF exclusion rejects the `n` and backslash hostile names while ordinary read-only text passes |
| Adopter consequential-work gate | **PASS** — matching spec, reviewed plan, tasks, exact mission, and exact Gate 2 identity are required |
| Conversation provenance | **PASS** — exact ratifying path, immutable revision/digest, and directive/authority reference are required |
| Adoption-first grounding | **PASS** — adoption binding validates before pinned GLOBAL, domain, and adopter sources load |
| Adopter WIP gate shapes | **PASS** — Gate 1 and Gate 2 identify exact artifacts and immutable revision/digest identity |

The thread requesting restored legacy project-tier hook routing remains
correctly rejected because it conflicts with the frozen reset authority.
Relative-path normalization is independently satisfied by the root-only hook.

### Focused and full executable evidence

Fresh focused validation produced:

```text
python scripts/validate-contracts.py --slice adoption
  PASS: adoption contract fixtures

python scripts/validate-contracts.py --slice evidence
  PASS: evidence contract fixtures

python scripts/validate-contracts.py --slice workflow
  PASS: workflow contract fixtures

python scripts/validate-contracts.py --slice static
  PASS: static contract fixtures
```

Each focused invocation exercised the dependency-missing bootstrap and used an
exact hash-locked, process-scoped temporary environment outside the repository.
The static slice includes hostile SVG DTD/entity rejection, Claude Action
fixtures, ordinary read-only workflow acceptance, real hook execution,
personal-path/secret scanning, migration hashes, links, structured parsing,
and adapter equality.

Independent real-process hook cases produced:

```text
top-level-relative       exit 0; advisory true
dot-relative-nested-input exit 0; advisory true
windows-absolute         exit 0; advisory true
nested-conversation-dir  exit 0; advisory false
scaffold                 exit 0; advisory false
legacy-project-tier      exit 0; advisory false
malformed-json           exit 0; advisory false
Claude/Codex hook SHA-256 equality true
```

Fresh full verification produced:

```text
python scripts/validate-contracts.py
  PASS: adoption, authority, evidence, harness, workflow, template, static contract fixtures
  exit 0

bash -n verify-layout.sh
  exit 0

bash verify-layout.sh
  RESULT: 100% compliance — all 118 deterministic checks pass.
  exit 0

git diff --cached --check
  exit 0
```

### Frozen authority, preservation, and deferred evidence

```text
plan.md
  HEAD/index blob: e58e7b6d3bc464b9e0012ad5454aacce30189bad
  SHA-256: C83198CE8CDAA85E27696273A2DE13F543D8CB1B45C2AD91FA753ECE4735354D

spec.md
  HEAD/index blob: 4e828d515df0ce7884bb178a789e2d46cd0197ad
  SHA-256: FD879701164A7CA6A2CD1C4502CD8C7B86E4AA9E7EB76535F967A5AA11FC5FF7

tasks.md
  HEAD/index blob: 9542fbb4217d11aa30b84baf5b5f77f0bf67aa21
  SHA-256: 5ABADE413453836D49E0FAF80A6E7D3378466479086D329BF29AA8ECA0C6F914

base/path-map source rows=60
unique source rows=60
base project paths=60
source sets exact=True
dispositions=moved 39, merged 3, superseded 16, removed 2
source blob mismatches=0
source SHA-256 mismatches=0
moved-target hash rows=39
moved-target hash mismatches=0
tracked projects/ paths=0
```

The signed `prohibited-action.json` index blob remains exactly
`1223d827ea00a5977d8c333311552098c2b9303b`, matching the accepted predecessor.
The T023 migration commit/tree, draft PR, Linux/Windows CI, CodeRabbit,
independent-verdict, and evidence-closure fields remain in their required
not-yet-performed states.

Read-only inspection of immutable CentCom commit
`201dde50268650e6ad489f483d5c57d3eeef2f3f` produced:

```text
centcom_map_rows=15
centcom_remote_blob_count=128
centcom_blob_mismatches=0
PR #20 state=open
PR #20 draft=True
PR #20 head=201dde50268650e6ad489f483d5c57d3eeef2f3f
```

All six `.agents`/`.claude` skill pairs and the `.claude`/`.codex`
record-mining hook pair are byte-identical. No repository-local
`.validation-venv` or `sdd-core-validation-*` temporary directory remains.
The safety validator reports no non-fixture personal path, private key, token,
or secret-assignment payload. The only current user-name match is a negative
validator sentinel that forbids that historical path from the constitution;
it is not a stored personal path.

### External isolation and verdict

Read-only checks found the Fusion Harness checkout clean at
`5170938c9858bebbe40c2360875bb6cd7d1422b0` and the Agent Workflow checkout at
`dd46eb827aeae5051133f946479ae9af7696be6d` with the same 16 pre-existing
working-tree entries recorded by R6. R7 made no external repository,
machine-tier, pull-request, review-thread, merge, release, or deployment
change.

**R7 verdict: ACCEPT.** No blocking governance, contract, preservation,
security, atomicity, or external-isolation finding remains in the prepared
staged tree. T022 may create the single atomic implementation commit with
exact parent `cc4f4b17ccca428334689cc5ab381741470168c0` and rerun
verification. Merge, release, deployment, adopter changes, external-repository
mutation, review-thread resolution, and T023 evidence closure remain outside
this verdict.

## R9 final atomic-tree review

R9 is a fresh T021 review of the complete staged atomic candidate after the R8
mirror-routing blocker was remediated. It does not infer acceptance from prior
reviews or from deterministic checks alone.

### Exact pre-review baseline

```text
git rev-parse HEAD
  cc4f4b17ccca428334689cc5ab381741470168c0

git rev-parse HEAD^
  d3363238bb2d2f513f09b364926ff4146cc376ff

git write-tree
  53efc9e6f776e18a88ab8baddb4cfe17a64c5409

git status
  192 staged paths; zero unstaged paths; zero untracked paths
```

The staged candidate is based directly on the exact planning commit. Its final
remediation delta from the accepted R7 implementation tree contains exactly
eight paths: the two record-mining hooks, mirror-sync skill, adopter AGENTS and
WIP templates, deterministic validator, verifier, and migration evidence.

### R8 blocker and PR #10 findings

| Review area | R9 result |
|---|---|
| Applicable-domain no-mirror routing | **PASS** — failure evidence routes to the active FRAMEWORK-DEFINITION or OPERATIONAL-GOVERNANCE feature specification |
| Mirror scope | **PASS** — the two-location rule is scoped to FRAMEWORK-DEFINITION while the registered operations registry and reference tree remain valid |
| Portable hook normalization | **PASS** — both hooks use Python canonicalization, contain no GNU-only `realpath -m`, and remain byte-identical |
| Hook containment and routing | **PASS** — root-relative, absolute, parent-normalized, parent-escape, nested, legacy-project, and malformed-input cases produce the required outcomes |
| Gate 2 identity | **PASS** — the adopter directive binds the exact reviewed plan and immutable identity |
| Mission separation | **PASS** — specification and tasks remain lifecycle inputs while the exact mission envelope is independently verified as the execution boundary |

The R8 blocker is fully resolved. Mirror-sync names both applicable feature
specification paths, and deterministic validation requires both. No prior PR
#10 correction regressed.

### Deterministic verification

Fresh focused and full verification produced:

```text
python scripts/validate-contracts.py --slice static
  PASS: static contract fixtures
  exit 0

bash -n verify-layout.sh
  exit 0

bash verify-layout.sh
  PASS: adoption, authority, evidence, harness, workflow, template, static contract fixtures
  RESULT: 100% compliance — all 122 deterministic checks pass.
  exit 0

git diff --cached --check
  exit 0

git diff --check
  exit 0
```

The dependency-missing path used only the exact hash-locked requirements in an
unpredictable process-scoped temporary environment outside the repository.
Automatic cleanup left zero matching temporary directories and no
repository-local validation environment.

### Frozen authority, evidence, and atomic scope

```text
plan.md
  HEAD/index blob: e58e7b6d3bc464b9e0012ad5454aacce30189bad
  SHA-256: C83198CE8CDAA85E27696273A2DE13F543D8CB1B45C2AD91FA753ECE4735354D

spec.md
  HEAD/index blob: 4e828d515df0ce7884bb178a789e2d46cd0197ad
  SHA-256: FD879701164A7CA6A2CD1C4502CD8C7B86E4AA9E7EB76535F967A5AA11FC5FF7

tasks.md
  HEAD/index blob: 9542fbb4217d11aa30b84baf5b5f77f0bf67aa21
  SHA-256: 5ABADE413453836D49E0FAF80A6E7D3378466479086D329BF29AA8ECA0C6F914

mirror-sync actual and recorded SHA-256
  bc959b9b0fac7f64676f259fd1af4317b24a9469508c9a7ae1450a9224ba2084

tracked projects/ paths
  0
```

The complete migration-closure validation remains successful, including all
60 source dispositions and 39 moved-target hashes. The atomic migration
commit/tree, draft PR, Linux/Windows CI, CodeRabbit verdict, independent
verdict, and evidence-closure fields remain in their required T023-deferred
states. No implementation file outside the eight-path final remediation delta,
external repository, machine-tier state, pull request, review thread, merge,
release, or deployment was changed by R9.

**R9 verdict: ACCEPT.** No blocking governance, contract, portability,
preservation, security, scope, atomicity, or evidence-boundary finding remains
in the prepared staged tree. T022 may create the one atomic implementation
commit with exact parent
`cc4f4b17ccca428334689cc5ab381741470168c0` and rerun verification. Merge,
release, deployment, adopter changes, external-repository mutation,
review-thread resolution, and T023 evidence closure remain outside this
verdict.
