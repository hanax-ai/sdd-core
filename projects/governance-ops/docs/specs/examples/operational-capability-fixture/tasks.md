> SYNTHETIC EXAMPLE — completed for illustration only. Not a governed artifact; grants no authority; never cite as precedent or evidence.

# Tasks: Synthetic Quarterly Glossary-Audit Cadence

**Branch / Folder**: `examples/operational-capability-fixture` | **Date**: 2026-07-25
**Input**: Design documents from this fixture folder
**Prerequisites**: `spec.md` (completed), `plan.md` (completed)
**Validation Mode** (inherited from plan.md): `file-native` — acceptance is mechanical file checks plus named review gates; no runtime anywhere in this package

## Phase 3.1: Setup

- [x] T001 Confirm target paths per plan.md Structure Decision — `projects/governance-ops/knowledge/`, `projects/governance-ops/records/templates/`, `projects/governance-ops/registers/`
- [x] T002 Scaffold the record template skeleton — `projects/governance-ops/records/templates/synthetic-glossary-audit.template.md`

## Phase 3.2: Validation First — enumerate checks BEFORE authoring

- [x] T003 [P] Define check SC-001: exactly one template-conformant record per run; register row cites it — recorded in this file
- [x] T004 [P] Define check SC-002: every runbook step names executor + evidence output — recorded in this file
- [x] T005 [P] Define check SC-003: simulated missed window yields a deviation record; review gate = Workspace Maintainer quarterly review — recorded in this file

## Phase 3.3: Core Authoring

- [x] T006 Author runbook steps 1–5 with executor + evidence per step and deviation path — `projects/governance-ops/knowledge/instructions.md`
- [x] T007 [P] Author class-1 synthetic record template (run date, window, checks, findings, deviations, reviewer) — `projects/governance-ops/records/templates/synthetic-glossary-audit.template.md`
- [x] T008 [P] Add/refresh the synthetic register row — `projects/governance-ops/registers/synthetic-capability-register.md`

## Phase 3.4: Integration & Cross-references

- [x] T009 Wire citations: register row ↔ latest record ↔ runbook step 4 (both directions) — `projects/governance-ops/registers/synthetic-capability-register.md`, `projects/governance-ops/knowledge/instructions.md`

## Phase 3.5: Review & Polish

- [x] T010 Run SC-001..SC-003 checks; results: one conformant record, all steps carry executor+evidence, deviation path verified on the simulated miss — recorded inline
- [x] T011 Review gate passed: Workspace Maintainer reviewed record + register wiring against both constitutions and the evidence classes — recorded inline

---

## Dependencies

- Setup (T001–T002) before everything else
- Validation First (T003–T005) before Core Authoring (T006–T008)
- Core Authoring before Integration (T009); everything before Review (T010–T011)

## Notes

- All written paths inside `projects/governance-ops/` — Scope Rule satisfied; glossary read-only per FR-004.
- Evidence discipline honored: only the synthetic class-1 template is committed; real run records are class-2 machine-local.
- No external frameworks — grounding-registry check consulted; no registered source required (root Article IV).

## Validation Checklist

- [x] Every Operational Requirement in spec.md is covered by at least one task
- [x] Every Success/Verification Criterion in spec.md maps to a Validation-First check task
- [x] Validation-First checks are enumerated before the authoring tasks they gate
- [x] Evidence outputs bind to a declared evidence class and record template
- [x] Every task cites at least one exact repository file path
- [x] Every cited path is inside `projects/governance-ops/` (Scope Rule satisfied)
- [x] No [P] task modifies the same file as another [P] task
- [x] Parallel [P] tasks are truly independent (no hidden ordering)
- [x] Dependencies section reflects all ordering constraints
- [x] Validation Mode is `file-native` and honored — file-native mode: no task requires a CLI tool, script, or runtime
