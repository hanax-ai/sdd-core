> SYNTHETIC EXAMPLE — completed for illustration only. Not a governed artifact; grants no authority; never cite as precedent or evidence.

# Tasks: Synthetic Glossary Citation Standard (SYN-ST-900)

**Branch / Folder**: `examples/normative-standard-fixture` | **Date**: 2026-07-25
**Input**: Design documents from this fixture folder
**Prerequisites**: `spec.md` (completed), `plan.md` (completed)
**Validation Mode** (inherited from plan.md): `file-native` — acceptance is mechanical file checks plus named review gates; no runtime anywhere in this package

## Phase 3.1: Setup

- [x] T001 Confirm target paths per plan.md Structure Decision — `projects/governance-framework/standards/`, `projects/governance-framework/knowledge/`
- [x] T002 Scaffold `synthetic-glossary-citation.md` with metadata + section skeleton — `projects/governance-framework/standards/synthetic-glossary-citation.md`

## Phase 3.2: Validation First — enumerate checks BEFORE authoring

- [x] T003 [P] Define check CC-001: entry count equals `(defined by:` citation count in the glossary — recorded in this file
- [x] T004 [P] Define check CC-002: every cited `SYN-ST-###` resolves to a file in `standards/` — recorded in this file
- [x] T005 [P] Name the review gate: project owner reviews against the spec's Review & Acceptance Checklist and both constitutions — recorded in this file

## Phase 3.3: Core Authoring

- [x] T006 Author normative sections 1–5 mapped from FR-001..FR-004 — `projects/governance-framework/standards/synthetic-glossary-citation.md`
- [x] T007 Author Conformance (CC-001..CC-003) and Amendments sections — `projects/governance-framework/standards/synthetic-glossary-citation.md`
- [x] T008 Add `(defined by: …)` citations to every glossary entry — `projects/governance-framework/knowledge/synthetic-glossary.md`

## Phase 3.4: Integration & Cross-references

- [x] T009 Wire standard §5 citation TO the glossary path; add `Governed by: SYN-ST-900` sentinel to the glossary header — `projects/governance-framework/standards/synthetic-glossary-citation.md`, `projects/governance-framework/knowledge/synthetic-glossary.md`

## Phase 3.5: Review & Polish

- [x] T010 Run CC-001..CC-003 checks; results: CC-001 12/12 entries cited; CC-002 all IDs resolve; CC-003 sentinel present. Review gate passed by project owner — recorded inline in this file

---

## Dependencies

- Setup (T001–T002) before everything else
- Validation First (T003–T005) before Core Authoring (T006–T008)
- Core Authoring before Integration (T009); everything before Review (T010)

## Notes

- All paths inside `projects/governance-framework/` — Scope Rule satisfied.
- No external frameworks involved — no grounding-check required (root Article IV consulted; no registered source needed).

## Validation Checklist

- [x] Every Normative Requirement in spec.md is covered by at least one task
- [x] Every Conformance Criterion in spec.md maps to a Validation-First check task
- [x] Validation-First checks are enumerated before the authoring tasks they gate
- [x] Every task cites at least one exact repository file path
- [x] Every cited path is inside `projects/governance-framework/` (Scope Rule satisfied)
- [x] No [P] task modifies the same file as another [P] task
- [x] Parallel [P] tasks are truly independent (no hidden ordering)
- [x] Dependencies section reflects all ordering constraints
- [x] Validation Mode is `file-native` and honored — file-native mode: no task requires a CLI tool, script, or runtime
