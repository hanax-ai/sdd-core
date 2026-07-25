> SYNTHETIC EXAMPLE — completed for illustration only. Not a governed artifact; grants no authority; never cite as precedent or evidence.

# Capability Plan: Synthetic Quarterly Glossary-Audit Cadence

**Feature Directory**: `projects/governance-ops/docs/specs/examples/operational-capability-fixture/` | **Date**: 2026-07-25 | **Spec**: [spec.md](./spec.md)

**Input**: Capability specification from this fixture folder.

## Summary

A quarterly audit runbook checking the synthetic glossary against SYN-ST-900, producing one evidence record per run with deviation handling for missed windows. File-native validation throughout.

## Design Context

**Artifact Class**: governance-operations — cadence + evidence capability

**Affected Files**: `projects/governance-ops/knowledge/instructions.md` (runbook entry, synthetic); `projects/governance-ops/records/templates/synthetic-glossary-audit.template.md` (created); `projects/governance-ops/registers/synthetic-capability-register.md` (row updated)

**Dependent Registers / Records / Released Standards**: consumes SYN-ST-900 read-only under the one-way dependency contract; records policy unchanged.

**Storage**: Git-managed files for the template and register (class 1); real run records class-2 machine-local — per the reviewed storage decision, root Article II.

**Validation Mode**: `file-native`

**Grounding**: none: workspace-internal capability — no external-source-dependent claims.

**Constraints**: audit is read-only against the glossary (FR-004); Endpoint Discipline in all records.

## Constitution Check

### Root Constitution Gate — `.specify/memory/constitution.md` (workspace root)

- Isolated Agent Scopes: PASS — all written paths inside `projects/governance-ops/`; glossary read-only.
- Persistence Governance (Article II): PASS — Git files + class-2 machine-local records; no datastore.
- Authoritative-Source Grounding (Article IV): PASS — no external-source-dependent claims.
- Spec-First Lifecycle (Article V): PASS — plan follows the completed, clarified spec.

### Project Constitution Gate — `projects/governance-ops/.specify/memory/constitution.md`

- Execution-Evidence Test: PASS — a cadence producing evidence records is squarely operational.
- Evidence classes: PASS — synthetic class-1 template committed; real records class-2, never auto-committed.
- One-way dependency contract: PASS — consumes the released synthetic standard read-only.

**Initial Check (pre-research)**: PASS

**Post-Design Check (after Phase 1)**: PASS

## Project Structure

### Documentation (this feature)

```text
projects/governance-ops/docs/specs/examples/operational-capability-fixture/
├── spec.md              # Completed (fixture)
├── plan.md              # This file (fixture)
└── tasks.md             # Completed (fixture)
```

(`research.md`, `data-model.md`, `contracts/` omitted: single unknown resolved at the clarify gate; no schemas beyond the record template — recorded here as the Phase 0/1 outcome.)

### Authored / Modified Artifacts (project tree)

```text
projects/governance-ops/
├── knowledge/instructions.md                                  # runbook entry (synthetic)
├── records/templates/synthetic-glossary-audit.template.md     # created (class-1 synthetic)
└── registers/synthetic-capability-register.md                 # row updated (synthetic)
```

**Structure Decision**: runbook joins the project playbook; record template joins `records/templates/`; register row in the synthetic register — each the established home for its class.

## Rollback / Recovery Considerations

- **Rollback**: git revert of the capability commit; register rows corrected by a follow-up row, never edited in place.
- **Evidence of aborted runs**: deviation record retained per FR-002; no evidence deleted.

## Phase 0: Outline & Research

Single unknown (on-demand clock reset) resolved at the clarify gate. **Decision**: fixed calendar quarters. **Rationale**: predictable audit windows. **Alternatives considered**: rolling window from last run (rejected: silently stretches cadence).

## Phase 1: Design (runbook outline, record templates, register rows)

Runbook outline: 1. Open window (executor: ops session; evidence: record header) — 2. Run CC-001..CC-003 checks from SYN-ST-900 (evidence: findings table) — 3. List nonconformances with line refs (FR-003) — 4. File record; cite from register row (SC-001) — 5. Deviation path for missed window (FR-002). Record template fields: run date, window, checks run, findings, deviations, reviewer. Register wiring: row cites latest record by date, both directions.

## Phase 2: Task Planning Approach

**Task Generation Strategy**: each SC-### → a Validation-First check task; runbook, record template, register row → Core Authoring tasks; citation directions → Integration tasks.

**Ordering Strategy**: Validation First → runbook → template → register wiring → review.

**Estimated Output**: 11 numbered tasks in `tasks.md` (matches the completed fixture tasks.md).

## Complexity Tracking

No violations — table intentionally empty.

## Progress & Gate Tracking

**Phase Status**:

- [x] Phase 0: Research complete (no unknowns; decision recorded above)
- [x] Phase 1: Design complete (runbook outline + record/register designs above)
- [x] Phase 2: Task planning approach described (this plan only)

**Gate Status**:

- [x] Initial Constitution Check: PASS (root **and** project constitutions)
- [x] Post-Design Constitution Check: PASS (root **and** project constitutions)
- [x] All NEEDS CLARIFICATION resolved
- [x] Validation Mode declared (`file-native`)
- [x] Rollback / Recovery considerations recorded
- [x] Complexity deviations documented (none required)

---

*Gated by `.specify/memory/constitution.md` (workspace root) and `projects/governance-ops/.specify/memory/constitution.md`.*
