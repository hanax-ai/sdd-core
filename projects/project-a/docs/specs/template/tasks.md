# Tasks: [FEATURE NAME]

**Branch / Folder**: `[###-feature-name]` | **Date**: [DATE]
**Input**: Design documents from `projects/[project-name]/docs/specs/[###-feature-name]/`
**Prerequisites**: `spec.md` (required), `plan.md` (required — tasks are derived from it)

## Execution Flow (agent instructions)

```
1. Read plan.md in this feature folder
   → If not found: STOP with "plan.md required before tasks can be authored"
   → Extract: technical approach, project structure, affected files
2. Read spec.md
   → Extract: functional requirements, entities, acceptance scenarios
3. Consult context (files only — no tools required):
   → Root constitution: .specify/memory/constitution.md
   → Project constitution: projects/[project-name]/.specify/memory/constitution.md
   → Mirror-check instructions: knowledge/instructions.md (before any
     framework-dependent task, confirm the framework is mirrored under
     reference/repos/)
4. Generate tasks by phase (Setup → Tests First → Core → Integration → Polish):
   → Every requirement in spec.md maps to at least one task
   → Every task cites the exact repository file path(s) it touches
   → Every cited path is inside projects/[project-name]/ (see Scope Rule)
5. Apply task rules:
   → Different files, no shared dependency = mark [P] for parallel
   → Same file or dependent output = sequential (no [P])
   → Tests before the implementation they cover
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

- Every file path cited by a task MUST resolve inside the owning project tree, `projects/[project-name]/`
- Tasks MUST NOT create, modify, or delete files in the workspace root, in other projects, or in global `docs/`, `knowledge/`, or `reference/`
- Global context files may be **read** for guidance but never written by feature tasks
- If a task appears to require an out-of-scope change, STOP and escalate it in `plan.md` rather than authoring the task

## Path Conventions

- All paths below are relative to the repository root and MUST begin with `projects/[project-name]/`
- Feature documents live in `projects/[project-name]/docs/specs/[###-feature-name]/`
- Source and test layout follows the structure defined in `plan.md`

---

## Phase 3.1: Setup

- [ ] T001 [Create or confirm structure per plan.md] — `projects/[project-name]/[path]`
- [ ] T002 [Initialize / scaffold artifact] — `projects/[project-name]/[path]`
- [ ] T003 [P] [Configuration or conventions task] — `projects/[project-name]/[path]`

## Phase 3.2: Tests First (TDD) ⚠️ MUST COMPLETE BEFORE 3.3

**CRITICAL: These tests MUST be written and MUST FAIL before ANY implementation**

- [ ] T004 [P] [Contract/interface test for requirement] — `projects/[project-name]/[test path]`
- [ ] T005 [P] [Contract/interface test for requirement] — `projects/[project-name]/[test path]`
- [ ] T006 [P] [Integration test for acceptance scenario] — `projects/[project-name]/[test path]`
- [ ] T007 [P] [Integration test for acceptance scenario] — `projects/[project-name]/[test path]`

## Phase 3.3: Core Implementation (ONLY after tests are failing)

- [ ] T008 [P] [Entity/model from spec.md] — `projects/[project-name]/[path]`
- [ ] T009 [P] [Entity/model from spec.md] — `projects/[project-name]/[path]`
- [ ] T010 [Service/logic; depends on T008, T009] — `projects/[project-name]/[path]`
- [ ] T011 [Endpoint/feature surface] — `projects/[project-name]/[path]`
- [ ] T012 [Input validation] — `projects/[project-name]/[path]`
- [ ] T013 [Error handling and logging] — `projects/[project-name]/[path]`

## Phase 3.4: Integration

- [ ] T014 [Connect to data layer per plan.md] — `projects/[project-name]/[path]`
- [ ] T015 [Wire cross-component interaction] — `projects/[project-name]/[path]`
- [ ] T016 [External endpoint integration, if in scope] — `projects/[project-name]/[path]`

## Phase 3.5: Polish

- [ ] T017 [P] [Unit tests for edge cases] — `projects/[project-name]/[test path]`
- [ ] T018 [P] [Update project docs] — `projects/[project-name]/docs/[path]`
- [ ] T019 [Remove duplication / refactor] — `projects/[project-name]/[path]`
- [ ] T020 [Manual verification per acceptance scenarios in spec.md] — `projects/[project-name]/docs/specs/[###-feature-name]/spec.md`

---

## Dependencies

- Setup (T001–T003) before everything else
- Tests (T004–T007) before implementation (T008–T013)
- Models before services; services before endpoints ([e.g., T008/T009 block T010; T010 blocks T011])
- Core implementation (T008–T013) before integration (T014–T016)
- Everything before polish (T017–T020)
- [List any additional feature-specific ordering constraints here]

## Parallel Example

```
# T004–T007 touch different files and share no dependency, so separate
# agents (or one agent in any order) may execute them concurrently:
Agent A → T004: [Contract test ...] — projects/[project-name]/[test path]
Agent B → T005: [Contract test ...] — projects/[project-name]/[test path]
Agent C → T006: [Integration test ...] — projects/[project-name]/[test path]
Agent D → T007: [Integration test ...] — projects/[project-name]/[test path]
```

## Notes

- [P] tasks = different files, no dependencies; never mark two tasks [P] if they modify the same file
- Verify tests fail before implementing the code they cover
- Record completion by checking the task box in this file; note deviations inline
- Framework-dependent tasks require a prior mirror-check per [`../../../../../knowledge/instructions.md`](../../../../../knowledge/instructions.md) — the framework must exist under `reference/repos/` before code that depends on it is proposed
- Avoid: vague tasks, missing file paths, same-file [P] conflicts, out-of-scope paths

## Validation Checklist

*GATE: All items must pass before this task list is considered execution-ready*

- [ ] Every requirement in spec.md is covered by at least one task
- [ ] Every entity in spec.md has a model/creation task
- [ ] All tests come before their corresponding implementation tasks
- [ ] Every task cites at least one exact repository file path
- [ ] Every cited path is inside `projects/[project-name]/` (Scope Rule satisfied)
- [ ] No [P] task modifies the same file as another [P] task
- [ ] Parallel [P] tasks are truly independent (no hidden ordering)
- [ ] Dependencies section reflects all ordering constraints
- [ ] No task requires a CLI tool, script, or runtime — file-and-agent only
