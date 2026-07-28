---
id: SDD-RESET-001-PLAN
title: SDD-Core Reset Implementation Plan
artifact_type: implementation-plan
category: governance-architecture
authority_tier: root-global
status: ready-for-gate-2-review
version: 1.0.0-draft
created: 2026-07-28
updated: 2026-07-28
access_level: public
specification: spec.md
source_proposal: ../../proposals/sdd-core-reset-architecture.md
base_branch: release/sdd-core-v3.0.0-rc.1
base_commit: d3363238bb2d2f513f09b364926ff4146cc376ff
target_release: v4.0.0-rc.1
gate_2: not-granted
implementation_authority: none
---

# SDD-Core Reset Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use
> `superpowers:subagent-driven-development` (recommended) or
> `superpowers:executing-plans` to implement this plan task-by-task. Steps use
> checkbox (`- [ ]`) syntax for tracking.

**Goal:** Migrate SDD-Core from its legacy embedded-project workspace into the
approved source-framework architecture without losing valid governance
material, creating authority by inference, or activating external runtimes.

**Architecture:** Execute one contract-first, root-authority migration on an
isolated branch pinned to the approved base. Establish target contracts and
fixtures, relocate valid internal-domain material, amend every live authority
surface in the same atomic migration commit, then close with independent
verification and a detached evidence commit.

**Tech Stack:** Git-managed Markdown with YAML front matter; JSON Schema for
machine contracts; YAML for human-edited adoption and compatibility
configuration; Bash-based deterministic verification; pinned Python validation
dependencies only after Article IV grounding; GitHub Actions on Linux and
Windows; advisory CodeRabbit review.

## Global constraints

- Planning is authorized; implementation is not.
- The exact implementation base is
  `d3363238bb2d2f513f09b364926ff4146cc376ff`.
- The implementation branch must be created from
  `release/sdd-core-v3.0.0-rc.1`, not `main`.
- Gate 2 must name this plan at its reviewed revision or digest.
- The authority migration is one atomic commit; fixup commits may exist locally
  but must be folded before publication.
- The evidence-closure commit may follow the migration commit but may change
  evidence files only.
- Merge and release require separate Agent Zero authority.
- No external repository or machine-tier state may be mutated.
- Fusion Harness and Agent Workflow remain independent, read-only dependencies.
- CI remediation, Autofix, model calls, agent runtime execution, and autonomous
  mutation remain disabled.
- New Markdown uses YAML front matter, one primary topic per file, and relative
  cross-links.
- Schemas and fixtures contain no secrets, personal paths, or operational data.
- External validator behavior must be grounded in pinned authoritative sources
  before dependent implementation begins.

---

## 1. Baseline and release decision

The planning baseline was inspected on 2026-07-28:

- canonical repository: `https://github.com/hanax-ai/sdd-core.git`;
- authorized base branch: `release/sdd-core-v3.0.0-rc.1`;
- authorized base commit:
  `d3363238bb2d2f513f09b364926ff4146cc376ff`;
- baseline verifier: 181/181 checks passing;
- tracked legacy `projects/` artifacts: 60;
- Git tags: only `pre-rescope-sap-exemplar`;
- GitHub releases: none.

The reset changes repository jurisdiction, constitutional inheritance, and
directory semantics. The current constitution is already `3.0.0`; its SemVer
amendment rule therefore requires the next constitution to be `4.0.0`.
Repository release identity must align with that authority version, so the
planned candidate is `v4.0.0-rc.1`. It supersedes the unreleased v3 RC model; it
does not silently upgrade adopters.

## 2. Authority and commit model

### Planning commit

This package (`spec.md`, `plan.md`, and `tasks.md`) may be committed and reviewed
without Gate 2. It grants no implementation authority.

### Atomic migration commit

After exact Gate 2 authority, one commit must contain all state that would
otherwise make the repository internally contradictory:

- `projects/` disposition and target-domain moves;
- root and internal constitution/authority changes;
- ownership and context-routing changes;
- contracts, integration profiles, bootstrap, and project template;
- root adapters, documentation, registries, and lifecycle references;
- target verifier and Linux/Windows CI matrix.

No version of that commit may be merged while any deterministic or independent
review gate is failing.

### Evidence-closure commit

A second commit may update only:

- `docs/migrations/sdd-core-reset-v4/migration-evidence.md`;
- `docs/migrations/sdd-core-reset-v4/artifact-inventory.md`;
- `docs/migrations/sdd-core-reset-v4/rollback.md`;
- the planning package's execution-status fields.

It records the atomic migration commit, tree digest, checks, review results, and
unresolved dependencies. It cannot repair migration content; any repair returns
to the atomic migration commit and reruns all checks.

## 3. Target file structure

```text
sdd-core/
├── .specify/memory/constitution.md
├── governance/
│   ├── framework/
│   │   ├── constitution.md
│   │   ├── README.md
│   │   ├── docs/
│   │   ├── knowledge/
│   │   ├── reference/
│   │   ├── skills/
│   │   └── standards/
│   └── operations/
│       ├── constitution.md
│       ├── README.md
│       ├── docs/
│       ├── knowledge/
│       ├── records/
│       ├── reference/
│       └── runbooks/
├── contracts/
│   ├── adoption/
│   │   ├── README.md
│   │   ├── project-adoption.schema.json
│   │   └── fixtures/
│   ├── authority/
│   │   ├── README.md
│   │   ├── mission-envelope.schema.json
│   │   └── fixtures/
│   └── evidence/
│       ├── README.md
│       ├── evidence-envelope.schema.json
│       └── fixtures/
├── integrations/
│   ├── fusion-harness/
│   │   ├── README.md
│   │   ├── binding.schema.json
│   │   ├── compatibility.yaml
│   │   └── fixtures/
│   ├── agent-workflow/
│   │   ├── README.md
│   │   ├── registration.schema.json
│   │   ├── status.schema.json
│   │   └── fixtures/
│   └── ci-cd/README.md
├── bootstrap/new-project.md
├── templates/project/
│   ├── .sdd-core/adoption.yaml
│   ├── .specify/memory/constitution.md
│   ├── conversations/SYNC-POLICY.md
│   ├── knowledge/instructions.md
│   ├── wip/README.md
│   ├── AGENTS.md
│   ├── CLAUDE.md
│   └── README.md
├── docs/
│   ├── migrations/sdd-core-reset-v4/
│   │   ├── path-map.yaml
│   │   ├── artifact-inventory.md
│   │   ├── migration-evidence.md
│   │   └── rollback.md
│   ├── proposals/
│   └── specs/001-sdd-core-reset/
├── scripts/validate-contracts.py
├── requirements-validation.txt
├── conversations/
├── knowledge/
├── reference/
├── wip/
├── .claude/
├── .agents/
├── .codex/
└── verify-layout.sh
```

`projects/` must not exist in the target tree.

## 4. Legacy disposition strategy

The implementation must generate
`docs/migrations/sdd-core-reset-v4/path-map.yaml` from the exact 60-file base
inventory before moving anything. Every row contains the fields:

```yaml
required_fields:
  - source
  - source_blob
  - source_sha256
  - disposition
  - target
  - rationale
  - authority
```

Implementation must compute `source_blob` and `source_sha256` from the
authorized base and must stop if the source path or content differs.

### Primary moves

| Source | Target | Treatment |
|---|---|---|
| `projects/governance-framework/README.md` | `governance/framework/README.md` | Move and rewrite project identity as domain identity |
| `projects/governance-framework/.specify/memory/constitution.md` | `governance/framework/constitution.md` | Move and amend as subordinate internal-domain authority |
| `projects/governance-framework/docs/` | `governance/framework/docs/` | Move; update live paths and template scope rules |
| `projects/governance-framework/knowledge/` | `governance/framework/knowledge/` | Move; update routing and source paths |
| `projects/governance-framework/reference/` | `governance/framework/reference/` | Move; preserve as domain grounding guidance |
| `projects/governance-framework/standards/` | `governance/framework/standards/` | Move; retain normative authority |
| `projects/governance-framework/.claude/skills/` | `governance/framework/skills/` | Move canonical skill content; root assistant surfaces remain adapters |
| `projects/governance-ops/README.md` | `governance/operations/README.md` | Move and rewrite project identity as domain identity |
| `projects/governance-ops/.specify/memory/constitution.md` | `governance/operations/constitution.md` | Move and amend as subordinate internal-domain authority |
| `projects/governance-ops/docs/specs/template/` | `governance/operations/docs/specs/template/` | Move and update scope rules |
| `projects/governance-ops/docs/specs/examples/` | `governance/operations/docs/specs/examples/` | Move valid synthetic examples |
| `projects/governance-ops/knowledge/` | `governance/operations/knowledge/` | Move and update routing |
| `projects/governance-ops/records/` | `governance/operations/records/` | Move operational evidence definitions/templates |
| `projects/governance-ops/reference/` | `governance/operations/reference/` | Move domain grounding guidance |

### Merge or supersede

| Source | Disposition |
|---|---|
| Both legacy `conversations/SYNC-POLICY.md` files | Merge their valid domain-routing rules into root `conversations/SYNC-POLICY.md`; remove project-local copies and `.gitkeep` files |
| `projects/governance-ops/registers/README.md` | Move reusable register-definition guidance to `governance/operations/records/README.md` only if non-duplicative; otherwise mark superseded |
| `projects/governance-ops/registers/deliverables.md` | Do not migrate as a live portfolio register; record its blob/digest and supersession in the migration inventory |
| `projects/governance-ops/docs/specs/002-centcom-phase-2-live-github-ingestion/` | Do not migrate as live SDD-Core authority; verify the independent project's canonical copy or stop. Record hashes and external/superseded disposition without writing the external repository |

No content may be deleted merely because it is inconvenient. An ambiguous
classification activates the stop condition and returns to Agent Zero.

## 5. Contract architecture

### Canonical identifiers and versioning

- JSON Schemas use JSON Schema draft 2020-12.
- `$id` values are:
  - `https://schemas.hana-x.ai/sdd-core/v4/project-adoption.schema.json`;
  - `https://schemas.hana-x.ai/sdd-core/v4/mission-envelope.schema.json`;
  - `https://schemas.hana-x.ai/sdd-core/v4/evidence-envelope.schema.json`;
  - `https://schemas.hana-x.ai/sdd-core/v4/fusion-harness-binding.schema.json`;
  - `https://schemas.hana-x.ai/sdd-core/v4/agent-workflow-registration.schema.json`;
  - `https://schemas.hana-x.ai/sdd-core/v4/agent-workflow-status.schema.json`.
- Every top-level object requires `schemaVersion`.
- Every object uses `additionalProperties: false`.
- Timestamps use UTC RFC 3339 values with format assertion enabled.
- Digests match `^sha256:[0-9a-f]{64}$`.
- Repository identity uses canonical HTTPS Git remote plus immutable commit.
- Contract schemas, fixtures, and validator dependency pins change together.

### Grounding precondition

Before schema-dependent code is authored:

1. mirror and register the official
   `json-schema-org/json-schema-spec` source at an immutable commit;
2. mirror and register the official `python-jsonschema/jsonschema` validator
   and `yaml/pyyaml` parser sources at immutable commits;
3. record source paths, commits, and digests in `knowledge/instructions.md`;
4. create `requirements-validation.txt` with exact versions and hashes;
5. stop if the local mirrors, registry, dependency pins, and installed
   validator cannot be reconciled.

No validator API or option may be recalled from training data.

### Adoption schema

The schema must define:

- repository/project identity;
- SDD-Core source, version, commit, and digest;
- local constitution path/digest;
- authority reference and effective date;
- `required`, `tailored`, and `excluded` provision records;
- protected-provision enforcement;
- Harness, Workflow, and CI profile bindings;
- supersession history.

Invalid fixtures must cover protected exclusion/tailoring, missing authority,
unknown fields, secret-like keys, and absolute personal paths.

### Mission-envelope schema

The schema must define immutable identity and authorization, scope, resources,
validation, evidence, expiry, revocation, supersession, replay, frozen policy,
base commit, and next boundary. Semantic validation must reject digest/signature
mismatch, replay, expiration, revocation, scope widening, and base mismatch.

Schema validation alone is insufficient for cryptographic and stateful checks;
`scripts/validate-contracts.py` must run explicit semantic fixtures after
structural validation.

### Evidence schema

The schema must distinguish:

- evidence identity and content digest;
- producer and observation time;
- deterministic validation result;
- advisory review coverage;
- integration/workflow state;
- project-owned durable location;
- immutable references.

It must not contain an authority-granted field or a transition that can mint
authority.

## 6. Operationalization and integration design

`bootstrap/new-project.md` defines a deterministic state machine:

```text
UNINITIALIZED
  -> INSPECTING
  -> BLOCKED | READY_READ_ONLY
READY_READ_ONLY
  -> AUTHORIZED_MISSION_REQUIRED
AUTHORIZED_MISSION_REQUIRED
  -> EXECUTION_ELIGIBLE only after external mission-envelope verification
```

The document describes outcomes and evidence, not an SDD-Core runtime.

Harness and Workflow profiles are compatibility contracts only. Their fixtures
must prove:

- compatible immutable versions produce `READY`;
- missing/incompatible releases produce `BLOCKED`;
- Workflow outage with a valid adopted degraded policy and valid pre-issued
  envelope produces `DEGRADED`;
- outage without that envelope produces `BLOCKED`;
- no profile claims model invocation, agent execution, or project mutation.

## 7. Constitution and documentation migration

The root constitution amendment must:

- change identity from multi-project workspace to source-framework repository;
- replace `projects/<name>` inheritance with adopter-owned local adoption;
- define internal domain scopes;
- preserve the protected authority core;
- update the Sync Impact Report and version to `4.0.0`;
- enumerate every dependent adapter/template/verifier changed in the same
  atomic commit.

The two internal-domain constitutions must become subordinate scope documents,
not adopter constitutions. All root and domain documentation must use the same
terms: SDD-Core, FRAMEWORK-DEFINITION, OPERATIONAL-GOVERNANCE, adopter
repository, Fusion Harness, and Agent Workflow.

Live path references must be updated in:

- `README.md`, `AGENTS.md`, `CONTRIBUTING.md`, `SECURITY.md`, `CHANGELOG.md`;
- `docs/README.md`, `docs/deliverables-index.md`,
  `docs/assets/process_flow.svg`;
- `knowledge/instructions.md`, `knowledge/tooling.md`;
- `conversations/README.md`, `conversations/SYNC-POLICY.md`,
  `conversations/TEMPLATE.md`;
- `wip/README.md`, `wip/TEMPLATE.md`, `wip/COLLABORATION.md`, `wip/_index.md`;
- root `.claude/`, `.agents/`, and `.codex/` instruction-bearing files;
- `.github/` workflow, issue, and pull-request templates.

Historical references may remain only when labeled superseded in the path map
or changelog.

## 8. Verification design

`verify-layout.sh` remains the canonical verifier and must run unchanged on
`ubuntu-latest` and `windows-latest` through Git Bash. It must:

1. require every target directory and required file;
2. fail if `git ls-files projects` returns content;
3. fail on prohibited live `projects/` references outside approved historical
   files;
4. verify constitution and contract version sentinels;
5. execute `scripts/validate-contracts.py`;
6. validate all valid fixtures and reject every invalid fixture;
7. check Markdown links and YAML front matter for new authoritative files;
8. check mirrored assistant-surface invariants;
9. check that remediation permissions/workflows are absent;
10. emit a deterministic total and nonzero exit on any failure.

`.github/workflows/verify-layout.yml` must use one matrix with:

- `ubuntu-latest`;
- `windows-latest`;
- the same checkout commit;
- the same `bash verify-layout.sh` command;
- pinned validation dependencies installed from
  `requirements-validation.txt`.

CodeRabbit remains advisory. A skipped review is not equivalent to a clean
review; the implementation PR must obtain a completed review or record the
tool outage separately.

## 9. Rollback and release

Rollback before merge resets the implementation branch to the authorized base.
Rollback after merge requires a separately authorized revert of both the
evidence closure and atomic migration commits. Partial directory restoration is
forbidden.

The implementation cycle stops at a merge-ready pull request. It does not:

- merge the PR;
- create `v4.0.0-rc.1`;
- publish a release;
- update any adopter;
- publish Harness or Workflow compatibility releases.

Those are distinct authority boundaries.

## 10. Requirement-to-task map

| Requirement group | Tasks |
|---|---|
| FR-001, FR-002, FR-003, FR-004, FR-005 | T001, T003–T006, T018 |
| FR-006, FR-007, FR-008, FR-009 | T007–T009, T018 |
| FR-010, FR-011, FR-012, FR-013, FR-014, FR-015, FR-016 | T002, T010–T013, T018 |
| FR-017, FR-018, FR-019 | T014, T018 |
| FR-020, FR-021, FR-022, FR-023, FR-024 | T015–T016, T018 |
| FR-025, FR-026, FR-027, FR-028, FR-029, FR-030 | T008, T017–T023 |
| CC-001, CC-002, CC-003, CC-004, CC-005, CC-006, CC-007, CC-008, CC-009, CC-010, CC-011, CC-012, CC-013, CC-014, CC-015 | T003, T018–T023 |

## 11. Gate checklist

- [x] Approved Gate 1 proposal is linked and pinned.
- [x] Base repository, branch, and commit are explicit.
- [x] Release and constitution versions are explicit.
- [x] Target paths and legacy dispositions are defined.
- [x] Contract, readiness, integration, and CI boundaries are defined.
- [x] External repositories and machine-tier changes are excluded.
- [x] Rollback and evidence closure are defined.
- [x] Every specification requirement maps to tasks.
- [x] No unresolved clarification marker or implementation placeholder remains.
- [ ] Exact Gate 2 directive names this plan revision.

## 12. Related artifacts

- [Specification](spec.md)
- [Execution tasks](tasks.md)
- [Approved architecture proposal](../../proposals/sdd-core-reset-architecture.md)
- [Root constitution](../../../.specify/memory/constitution.md)
- [Global grounding instructions](../../../knowledge/instructions.md)
