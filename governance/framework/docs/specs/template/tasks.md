# Tasks: [STANDARD / DEFINITIONAL ARTIFACT NAME]

**Branch / Folder**: `[###-standard-name]` | **Date**: [DATE]
**Input**: Design documents from `governance/framework/docs/specs/[###-standard-name]/`
**Prerequisites**: `spec.md` (required), `plan.md` (required — tasks are derived from it)
**Validation Mode** (inherited from plan.md): `file-native` — acceptance is mechanical file checks plus named review gates; no runtime anywhere in this package

## Execution Flow (agent instructions)

```text
1. Read plan.md in this feature folder
   → If not found: STOP with "plan.md required before tasks can be authored"
   → Extract: authoring approach, affected files, declared Validation Mode
2. Read spec.md
   → Extract: normative requirements, conformance criteria, governed surfaces
3. Consult context (files only — no tools required):
   → Root constitution: .specify/memory/constitution.md
   → Domain scope constitution: governance/framework/constitution.md
   → Grounding-check instructions: knowledge/instructions.md (before any
     framework-dependent task, confirm a registered grounding source per
     root Article IV — this workspace's mechanism: mirrors under reference/repos/)
4. Generate tasks by phase (Setup → Validation First → Core Authoring →
   Integration & Cross-references → Review & Polish):
   → Every Normative Requirement in spec.md maps to at least one task
   → Every Conformance Criterion maps to a Validation-First check task
   → Every task cites the exact repository file path(s) it touches
   → Every cited path is inside governance/framework/ (see Scope Rule)
5. Apply task rules:
   → Different files, no shared dependency = mark [P] for parallel
   → Same file or dependent output = sequential (no [P])
   → Validation checks are enumerated BEFORE the authoring they gate
6. Number tasks sequentially (T001, T002, ...)
7. Fill Dependencies section and Validation Checklist
8. Return: SUCCESS (tasks ready for agent execution)
```

## Format: `[ID] [P?] Description — file path(s)`

- **[P]**: Can run in parallel — touches different files than every other [P] task in its phase and has no dependency on an incomplete task
- **File paths are mandatory**: every task MUST name the exact repository file(s) it creates or modifies; a task with no path, or a vague path, is invalid

## Scope Rule (Isolated Agent Scopes)

Per the *Isolated Agent Scopes* article of the root constitution
([`../../../../../.specify/memory/constitution.md`](../../../../../.specify/memory/constitution.md)):

- Every file path cited by a task MUST resolve inside the owning project tree, `governance/framework/`
- Tasks MUST NOT create, modify, or delete files in the workspace root, in other projects, or in global `docs/`, `knowledge/`, or `reference/`
- Global context files may be **read** for guidance but never written by feature tasks
- If a task appears to require an out-of-scope change, STOP and escalate it in `plan.md` rather than authoring the task

## Path Conventions

- All paths below are relative to the repository root and MUST begin with `governance/framework/`
- Feature documents live in `governance/framework/docs/specs/[###-standard-name]/`
- Authored artifacts land at the target paths defined in `plan.md` (Structure Decision)

---

## Phase 3.1: Setup

- [ ] T001 [Confirm target paths per plan.md Structure Decision] — `governance/framework/[path]`
- [ ] T002 [Scaffold the standard/artifact file with metadata + section skeleton] — `governance/framework/standards/[standard-file].md`

## Phase 3.2: Validation First — enumerate checks BEFORE authoring

**Enumerate every mechanical check and review gate this package must pass, derived from spec.md Conformance Criteria. These checks gate the phases below; they are file checks and review gates, not runtime tests.**

- [ ] T003 [Define check: cross-references resolve both directions (CC-###)] — `governance/framework/docs/specs/[###-standard-name]/tasks.md`
- [ ] T004 [Define check: required sentinel present in governed register (CC-###)] — `governance/framework/docs/specs/[###-standard-name]/tasks.md`
- [ ] T005 [Name the review gate(s): who reviews, against what checklist (CC-###)] — `governance/framework/docs/specs/[###-standard-name]/tasks.md`

## Phase 3.3: Core Authoring

- [ ] T006 [Author the normative sections mapped from FR-### rows] — `governance/framework/standards/[standard-file].md`
- [ ] T007 [Author version/amendment block and provenance] — `governance/framework/standards/[standard-file].md`
- [ ] T008 [P] [Author/update register schema or record template if plan.md requires] — `governance/framework/[path]`

## Phase 3.4: Integration & Cross-references

- [ ] T009 [Wire citations FROM the standard TO its governed surfaces (exact anchors)] — `governance/framework/standards/[standard-file].md`
- [ ] T010 [Wire citations FROM governed surfaces BACK to the standard] — `governance/framework/[register/template path]`
- [ ] T011 [Update project indexes/instructions if plan.md requires] — `governance/framework/knowledge/instructions.md`

## Phase 3.5: Review & Polish

- [ ] T012 [Run every Validation-First mechanical check; record results inline] — `governance/framework/docs/specs/[###-standard-name]/tasks.md`
- [ ] T013 [Named review gate: reviewer verifies conformance criteria + constitutions] — `governance/framework/docs/specs/[###-standard-name]/spec.md`
- [ ] T014 [Resolve every deviation or record it in plan.md Complexity Tracking] — `governance/framework/docs/specs/[###-standard-name]/plan.md`

---

## Dependencies

- Setup (T001–T002) before everything else
- Validation First (T003–T005, sequential — same output file) before Core Authoring (T006–T008) — checks are defined before the work they gate
- Core Authoring before Integration & Cross-references (T009–T011)
- Everything before Review & Polish (T012–T014)
- [List any additional feature-specific ordering constraints here]

## Parallel Example

```text
# [P] applies ONLY to tasks that touch DIFFERENT files and share no
# dependency. Checks T003–T005 share this tasks.md and are therefore
# SEQUENTIAL, never [P]. A valid parallel pair touches distinct files:
Agent A → T008: [register schema or record template] — governance/framework/[path A]
Agent B → [an independent authoring task] — governance/framework/[different path B]
```

## Notes

- [P] tasks = different files, no dependencies; never mark two tasks [P] if they modify the same file
- Validation Mode is declared once in plan.md and inherited here; do not mix modes within one package
- Record completion by checking the task box in this file; note deviations inline
- Framework-dependent tasks require a prior grounding-check per [`../../../../../knowledge/instructions.md`](../../../../../knowledge/instructions.md) (root Article IV, Authoritative-Source Grounding) — a registered grounding source must exist before content that depends on it is proposed
- Avoid: vague tasks, missing file paths, same-file [P] conflicts, out-of-scope paths

## Validation Checklist

*GATE: All items must pass before this task list is considered execution-ready*

- [ ] Every Normative Requirement in spec.md is covered by at least one task
- [ ] Every Conformance Criterion in spec.md maps to a Validation-First check task
- [ ] Validation-First checks are enumerated before the authoring tasks they gate
- [ ] Every task cites at least one exact repository file path
- [ ] Every cited path is inside `governance/framework/` (Scope Rule satisfied)
- [ ] No [P] task modifies the same file as another [P] task
- [ ] Parallel [P] tasks are truly independent (no hidden ordering)
- [ ] Dependencies section reflects all ordering constraints
- [ ] Validation Mode is `file-native` and honored — file-native mode: no task requires a CLI tool, script, or runtime
