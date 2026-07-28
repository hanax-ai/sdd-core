---
id: SDD-RESET-001
title: SDD-Core Reset Implementation Specification
artifact_type: specification
category: governance-architecture
authority_tier: root-global
status: ready-for-planning
version: 1.0.0-draft
created: 2026-07-28
updated: 2026-07-28
access_level: public
source_proposal: ../../proposals/sdd-core-reset-architecture.md
source_proposal_commit: d3363238bb2d2f513f09b364926ff4146cc376ff
gate_1: approved
gate_2: not-granted
implementation_authority: none
---

# SDD-Core Reset Implementation Specification

## Authority and lifecycle status

This specification converts the approved
[SDD-Core Reset Architecture proposal](../../proposals/sdd-core-reset-architecture.md)
into testable implementation requirements.

The approved authoring instruction is:

> proceed to author the reset specification, implementation plan, and tasks
> from the merged Gate 1 proposal.

That instruction authorizes planning artifacts only. It does not authorize the
repository migration, constitution amendment, schema creation, integration
changes, merge, release, or deployment. Implementation requires Agent Zero to
issue:

`Approved for implementation: docs/specs/001-sdd-core-reset/plan.md`

The directive must identify the reviewed revision or digest. Until then,
`implementation_authority` remains `none`.

## 1. Intent

SDD-Core must become a file-native methodology and governance source repository
for independently owned adopter repositories. It must stop acting as a
multi-project application workspace while preserving valid framework-definition
and operational-governance material as internal domains.

The reset must deliver one coherent authority model across structure,
constitutions, contracts, templates, adapters, integrations, documentation, and
verification. No intermediate published state may describe a structure that the
repository does not actually have.

## 2. Scope

### In scope

- Replace the embedded `projects/` model with the approved
  `governance/`, `contracts/`, `integrations/`, `bootstrap/`, and
  `templates/` model.
- Preserve and reclassify valid framework-definition and
  operational-governance history.
- Reframe the root constitution and internal authority boundaries.
- Establish portable adoption, authority, evidence, Harness binding, Workflow
  registration, and status contracts.
- Establish project operationalization and automatic read-only readiness.
- Establish the review-only CI/CD baseline while keeping remediation dormant.
- Update root adapters, templates, registries, documentation, conversation
  routing, and deterministic verification.
- Produce migration, rollback, compatibility, and validation evidence.
- Prepare a `v4.0.0-rc.1` release candidate; release remains separately
  authorized.

### Explicit exclusions

- No changes to the Fusion Harness repository.
- No changes to the Agent Workflow repository or its database choice.
- No machine-tier `conversation-sync` change.
- No CentCom implementation or authority.
- No runtime language selection for Harness or Workflow.
- No model calls, agent teams, Autofix, autonomous remediation, or
  state-changing MCP operations as part of readiness.
- No automatic commits, pushes, pull requests, merges, releases, deployments,
  or cross-repository writes.
- No application source, portfolio operational state, shared datastore, or
  execution runtime inside SDD-Core.

## 3. Governing decisions

| Decision | Binding result | Evidence |
|---|---|---|
| Planning home | Root-global `docs/specs/001-sdd-core-reset/` | The change spans root and both legacy project trees; neither legacy subproject can authorize root edits |
| Target structure | `governance/`, `contracts/`, `integrations/`, `bootstrap/`, `templates/`; no tracked `projects/` | Approved proposal Sections 3–4 |
| Release line | `v4.0.0-rc.1` | No stable or prerelease GitHub release exists; only the historical `pre-rescope-sap-exemplar` tag exists as observed 2026-07-28 |
| Constitution version | `4.0.0` | The reset is a backward-incompatible jurisdiction and structure redefinition; the current constitution is already `3.0.0` |
| Validation mode | File-native authority plus deterministic cross-platform verification | Root Constitution Articles II and V; approved proposal R23 |
| Contract formats | Markdown for human knowledge, JSON Schema for machine contracts and tool calling, YAML for concise human-edited configuration | Approved roadmap decision and proposal target structure |
| Integration posture | Installed/bound readiness may be automatic; execution requires a valid mission envelope | Approved proposal R11–R18 |
| CI posture | Deterministic validation required; AI review advisory; remediation disabled | Approved proposal R19–R20 |

## 4. Governed audience and surfaces

This specification binds any root-scoped agent or human implementing or
reviewing the reset.

| Surface | Required effect |
|---|---|
| Root constitution and adapters | Replace multi-project jurisdiction with source-framework and internal-domain semantics |
| `projects/governance-framework/` | Move to `governance/framework/` and remove application-project identity |
| `projects/governance-ops/` | Move to `governance/operations/` and remove application-project identity |
| Contracts | Add closed, versioned, mechanically validatable schemas and fixtures |
| Integrations | Add versioned compatibility and registration profiles without embedding runtimes |
| Project template | Provide governance/adoption only; remain architecture-neutral |
| Bootstrap | Define deterministic operationalization and blocked/degraded states |
| Conversations and WIP | Route internal domains through root systems with domain metadata |
| CI and verifier | Enforce the target tree, contract fixtures, legacy-reference rules, and Linux/Windows parity |
| Release evidence | Record migration provenance, rollback, compatibility, and unresolved external dependencies |

## 5. Normative requirements

### Structure and preservation

- **FR-001 — Target model:** The implementation MUST create the approved
  `governance/`, `contracts/`, `integrations/`, `bootstrap/`, and
  `templates/` trees and MUST leave no tracked `projects/` content.
- **FR-002 — Complete path map:** Before any move, the implementation MUST
  inventory every tracked artifact under `projects/` and assign exactly one
  disposition: moved, merged, superseded, or removed, with rationale and target
  path.
- **FR-003 — History preservation:** Valid material MUST use Git-aware moves.
  Removal or merging MUST be justified in the path map and MUST NOT discard
  unique authoritative content.
- **FR-004 — Domain semantics:** Relocated framework and operations content MUST
  identify as internal SDD-Core domains, not application projects, adopters, or
  repositories.
- **FR-005 — Atomic authority migration:** Directory moves, root and internal
  authority changes, ownership updates, context routing, and verifier changes
  MUST form one atomic migration commit. That commit MUST NOT be merged until
  every required check passes.

### Constitution and authority

- **FR-006 — Root constitution:** The constitution MUST be amended to version
  `4.0.0`, remove live `projects/<name>` inheritance, and preserve Gate 1,
  Gate 2, WIP non-authority, human authority, source grounding, no-silent-bypass,
  scope isolation, cross-repository boundaries, adopter ownership, and tooling
  governance.
- **FR-007 — Internal scopes:** Root GLOBAL, FRAMEWORK-DEFINITION, and
  OPERATIONAL-GOVERNANCE scopes MUST have explicit write boundaries and an
  ownership rule. Operations MUST NOT redefine framework policy.
- **FR-008 — Adopter sovereignty:** Adoption MUST grant no implicit permission
  to write, approve, merge, release, deploy, access operational data, or widen
  authority in an adopter repository.
- **FR-009 — Authority non-inference:** Tests, reviews, workflow state, commits,
  merges, and evidence MUST remain evidence only and MUST NOT create authority.

### Portable contracts and templates

- **FR-010 — Adoption contract:** Every adopter MUST use
  `.sdd-core/adoption.yaml` validated against
  `contracts/adoption/project-adoption.schema.json`. Undeclared properties and
  secret-bearing or machine-local values MUST be rejected.
- **FR-011 — Protected provisions:** Gate 2, WIP non-authority, scope isolation,
  and cross-repository authority boundaries MUST remain `required`; the schema
  MUST reject their omission, exclusion, or tailoring.
- **FR-012 — Mission envelope:** The authority schema MUST require authenticated
  issuer identity, authority reference, unique mission ID and nonce, issue and
  expiry times, revocation/supersession and replay state, canonical digest,
  verifiable signature, frozen policy and base commit, bounded resources,
  prohibited actions, validation/evidence requirements, and the next authority
  boundary.
- **FR-013 — Evidence envelope:** The evidence schema MUST be versioned,
  content-addressable, project-owned, and unable to represent itself as
  authority. Workflow MAY retain immutable references, never evidence ownership.
- **FR-014 — Closed schemas:** Every contract object MUST reject undeclared
  properties and MUST include valid and invalid fixtures that prove the
  authorization and boundary rules.
- **FR-015 — Architecture-neutral template:** `templates/project/` MUST install
  governance, adoption, conversations, grounding, WIP, and assistant adapters
  without prescribing language, framework, datastore, cloud, deployment, or
  application directory choices.
- **FR-016 — Structured knowledge:** New Markdown files MUST use strict YAML
  front matter, one primary topic per file, and relative Markdown cross-links.
  JSON MUST be used for machine contract/tool-call payloads and YAML for
  human-edited configuration.

### Operationalization and readiness

- **FR-017 — Operationalization:** `bootstrap/new-project.md` MUST distinguish
  natural-language initiation from deterministic acceptance and MUST return
  `BLOCKED` when repository identity, immutable pins, contracts, compatible
  integration releases, or initialization evidence cannot be established.
- **FR-018 — Read-only readiness:** Project opening MAY inspect allowlisted
  manifest/configuration metadata and assemble context. It MUST NOT execute
  code, call models or networks, initialize connections, invoke hooks, read
  secrets, mutate repository/governed state, start agents, change gates, or use
  state-changing MCP operations.
- **FR-019 — Ephemeral cache:** Readiness MAY use only disposable,
  non-authoritative caching outside governed repositories and durable state.
  The cache MUST contain no secrets and MUST NOT become evidence, authority, or
  registration state.

### Integration boundaries

- **FR-020 — Fusion Harness profile:** The SDD-Core profile MUST bind canonical
  source, immutable version/digest, compatibility, installation verification,
  capability policy, readiness, rollback, and contract versions. Harness
  execution MUST require a valid mission envelope.
- **FR-021 — Agent Workflow profile:** The SDD-Core profile MUST define
  read-only registration, identities/digests, compatibility, status, authority
  and evidence references, outage/outbox/reconciliation behavior, and MUST
  forbid Workflow from executing agents or minting authority.
- **FR-022 — Degraded execution:** Workflow outage MAY permit only a pre-issued,
  authenticated, unexpired, unrevoked, unsuperseded, replay-safe mission
  envelope under adopted policy. Degraded mode MUST NOT create or refresh
  missions, widen authority, or change frozen policy/base commit.
- **FR-023 — Review-only CI/CD:** Deterministic validation MUST be required,
  advisory AI review MAY run, and validation, review coverage, integration
  health, workflow state, and authority MUST remain separate.
- **FR-024 — Dormant remediation:** Claude Action, Agent Workflow remediation
  scheduling, Fusion Harness remediation execution, Autofix, and automatic
  repository/release/deployment mutations MUST remain absent and disabled.

### Routing, validation, evidence, and release

- **FR-025 — Conversation routing:** Framework and operational domain
  conversations MUST use the root conversation system with explicit domain
  metadata. Machine-tier independent-repository routing remains a separately
  authorized dependency.
- **FR-026 — Target verification:** Deterministic checks MUST require target
  paths, reject tracked `projects/`, reject unmarked live legacy references,
  validate all schemas and fixtures, detect version/digest mismatches, preserve
  adapter/skill invariants, and run on Linux and Windows.
- **FR-027 — Migration evidence:** The evidence package MUST record origin,
  base branch/commit, baseline result, path map, disposition inventory,
  constitution and contract versions, cross-platform results, independent
  review, migration commit/tree digest, rollback, supersession, and unresolved
  external dependencies.
- **FR-028 — Release candidate:** The reset MUST target `v4.0.0-rc.1`, MUST
  declare that it supersedes the unreleased v3 RC architecture, MUST NOT
  silently upgrade adopters, and MUST require separate merge and release
  authority.
- **FR-029 — External boundaries:** The implementation MUST NOT modify Fusion
  Harness, Agent Workflow, CentCom, adopter repositories, or machine-tier
  configuration. Missing compatible external releases MUST produce `BLOCKED`,
  not simulated success.
- **FR-030 — Secret exclusion:** Committed artifacts, fixtures, logs, and
  evidence MUST contain no credentials, tokens, connection strings, personal
  machine paths, tenant identifiers, or non-public operational data.

## 6. Conformance criteria

- **CC-001:** `git ls-files projects` returns no tracked paths after migration.
- **CC-002:** Every one of the 60 tracked legacy `projects/` artifacts at base
  commit `d3363238bb2d2f513f09b364926ff4146cc376ff` has one path-map disposition.
- **CC-003:** `governance/framework/` and `governance/operations/` contain the
  preserved valid material and no live application-project identity.
- **CC-004:** The root constitution reports version `4.0.0` and contains the
  protected authority and adopter-sovereignty invariants.
- **CC-005:** Adoption fixtures reject protected-provision exclusion/tailoring,
  undeclared properties, secrets, and machine-local paths.
- **CC-006:** Mission-envelope fixtures reject unsigned, expired, revoked,
  superseded, replayed, scope-expanded, or base-mismatched missions.
- **CC-007:** Evidence fixtures cannot elevate evidence, review, execution, or
  workflow states into authority.
- **CC-008:** Harness and Workflow compatibility fixtures distinguish
  `READY`, `BLOCKED`, and `DEGRADED` without invoking either external runtime.
- **CC-009:** The project template contains no application technology or
  application runtime layout.
- **CC-010:** Readiness validation proves zero code execution, network access,
  secret access, hook invocation, governed mutation, model calls, or agent
  starts.
- **CC-011:** CI remediation surfaces and autonomous mutation permissions are
  absent or explicitly disabled.
- **CC-012:** All authoritative live links and structural references resolve to
  the target model; historical legacy references are marked as superseded.
- **CC-013:** Linux and Windows verification both pass against the same commit
  and contract fixture set.
- **CC-014:** Independent review confirms that evidence/workflow state cannot
  create authority and that external repositories remain untouched.
- **CC-015:** The migration evidence and rollback package identifies the exact
  base, migration commit, tree digest, release candidate, and unresolved
  dependencies.

## 7. Stop conditions

Planning or future implementation MUST stop and return to Agent Zero when:

- the exact Gate 2 artifact/revision is absent;
- the repository identity, authorized base, or release state differs;
- overlapping changes or claims touch the authorized edit set;
- any of the 60 legacy artifacts lacks an unambiguous disposition;
- valid history would be lost or silently merged;
- the constitutional version cannot be reconciled with the release line;
- authoritative validator grounding or deterministic schema validation cannot
  be established;
- a compatible immutable Harness release is unavailable;
- another repository or machine-tier mutation is required;
- remediation, merge, release, or deployment would exceed its separate
  authority.

## 8. Assumptions and resolved clarifications

- The canonical implementation base is merge commit
  `d3363238bb2d2f513f09b364926ff4146cc376ff` on
  `release/sdd-core-v3.0.0-rc.1`.
- The approved proposal is authoritative for reset scope; the originating WIP
  remains provenance only.
- Root-global planning is required because legacy project constitutions
  explicitly cannot authorize root or sibling-project writes.
- Contract validator selection is an implementation dependency subject to
  Article IV grounding. It does not alter the contract requirements and may not
  be guessed or used before a pinned authoritative source is registered.
- The external Harness and Workflow repositories are read-only dependencies
  during this SDD-Core cycle.
- No unresolved planning marker remains in this specification.

## 9. Acceptance checklist

- [x] Scope and exclusions match the merged Gate 1 proposal.
- [x] Every requirement is testable and uses MUST/MUST NOT language.
- [x] Root, framework, and operations authority boundaries are explicit.
- [x] The release and constitution version decision is recorded.
- [x] Markdown, JSON, and YAML roles are explicit.
- [x] All external-repository and machine-tier changes are excluded.
- [x] Gate 2 remains ungranted and implementation authority remains `none`.
- [x] No unresolved clarification markers or placeholders remain.

## 10. Related artifacts

- [Implementation plan](plan.md)
- [Execution tasks](tasks.md)
- [Approved architecture proposal](../../proposals/sdd-core-reset-architecture.md)
- [Root constitution](../../../.specify/memory/constitution.md)
- [Global grounding instructions](../../../knowledge/instructions.md)
