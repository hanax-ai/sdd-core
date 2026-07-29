> SYNTHETIC EXAMPLE — completed for illustration only. Not a governed artifact; grants no authority; never cite as precedent or evidence.

# Tasks: Synthetic Quarterly Glossary-Audit Cadence

**Branch / Folder**: `examples/operational-capability-fixture` | **Date**: 2026-07-25
**Input**: Design documents from this fixture folder
**Prerequisites**: `spec.md` (completed), `plan.md` (completed)
**Validation Mode** (inherited from plan.md): `file-native` — acceptance is mechanical file checks plus named review gates; no runtime anywhere in this package

## Phase 3.1: Setup

- [x] T001 Confirm target paths per plan.md Structure Decision — `governance/operations/knowledge/`, `governance/operations/records/templates/`, `governance/operations/records/register-definitions/`
- [x] T002 Scaffold the record template skeleton — `governance/operations/records/templates/synthetic-glossary-audit.template.md`

## Phase 3.2: Validation First — enumerate checks BEFORE authoring

- [x] T003 Define check SC-001: exactly one class-2 execution record instantiated from the template per run; register row cites it — `governance/operations/docs/specs/examples/operational-capability-fixture/tasks.md`
- [x] T004 Define check SC-002: every runbook step names executor + evidence output — `governance/operations/docs/specs/examples/operational-capability-fixture/tasks.md`
- [x] T005 Define check SC-003: simulated missed window yields a deviation record; review gate = Workspace Maintainer quarterly review — `governance/operations/docs/specs/examples/operational-capability-fixture/tasks.md`

## Phase 3.3: Core Authoring

- [x] T006 Author runbook steps 1–5 with executor + evidence per step and deviation path — `governance/operations/knowledge/instructions.md`
- [x] T007 [P] Author class-1 synthetic record template (run date, window, checks, findings, deviations, reviewer) — `governance/operations/records/templates/synthetic-glossary-audit.template.md`
- [x] T008 [P] Add/refresh the synthetic register definition — `governance/operations/records/register-definitions/synthetic-capability-register.md`

## Phase 3.4: Integration & Cross-references

- [x] T009 Wire citations: synthetic definition ↔ synthetic record ↔ runbook step 4 (both directions) — `governance/operations/records/register-definitions/synthetic-capability-register.md`, `governance/operations/knowledge/instructions.md`

## Phase 3.5: Review & Polish

- [x] T010 Run SC-001..SC-003 checks; results: one class-2 execution record instantiated from the template, all steps carry executor+evidence, deviation path verified on the simulated miss — `governance/operations/docs/specs/examples/operational-capability-fixture/tasks.md`
- [x] T011 Review gate passed: Workspace Maintainer reviewed record + register wiring against both constitutions and the evidence classes — `governance/operations/docs/specs/examples/operational-capability-fixture/tasks.md`

---

## Dependencies

- Setup (T001–T002) before everything else
- Validation First (T003–T005, sequential — same output file) before Core Authoring (T006–T008)
- Core Authoring before Integration (T009); everything before Review (T010–T011)

## Notes

- All written paths inside `governance/operations/` — Scope Rule satisfied; glossary read-only per FR-004.
- Evidence discipline honored: only the synthetic class-1 template is committed; real run records are class-2 machine-local.
- No external frameworks — grounding-registry check consulted; no registered source required (root Article IV).

## Validation Checklist

- [x] Every Operational Requirement in spec.md is covered by at least one task
- [x] Every Success/Verification Criterion in spec.md maps to a Validation-First check task
- [x] Validation-First checks are enumerated before the authoring tasks they gate
- [x] Evidence outputs bind to a declared evidence class and record template
- [x] Every task cites at least one exact repository file path
- [x] Every cited path is inside `governance/operations/` (Scope Rule satisfied)
- [x] No [P] task modifies the same file as another [P] task (T003–T005 are sequential for this reason)
- [x] Parallel [P] tasks are truly independent (no hidden ordering)
- [x] Dependencies section reflects all ordering constraints
- [x] Validation Mode is `file-native` and honored — file-native mode: no task requires a CLI tool, script, or runtime
