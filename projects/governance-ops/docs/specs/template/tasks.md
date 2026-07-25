# Tasks: [OPERATIONAL CAPABILITY NAME]

**Branch / Folder**: `[###-capability-name]` | **Date**: [DATE]
**Input**: Design documents from `projects/governance-ops/docs/specs/[###-capability-name]/`
**Prerequisites**: `spec.md` (required), `plan.md` (required — tasks are derived from it)
**Validation Mode** (inherited from plan.md): `file-native` — acceptance is mechanical file checks plus named review gates; no runtime anywhere in this package

## Execution Flow (agent instructions)

```
1. Read plan.md in this feature folder
   → If not found: STOP with "plan.md required before tasks can be authored"
   → Extract: runbook approach, affected files, declared Validation Mode
2. Read spec.md
   → Extract: operational requirements, evidence & records, verification criteria
3. Consult context (files only — no tools required):
   → Root constitution: .specify/memory/constitution.md
   → Project constitution: projects/governance-ops/.specify/memory/constitution.md
   → Grounding-check instructions: knowledge/instructions.md (before any
     framework-dependent task, confirm a registered grounding source per
     root Article IV — this workspace's mechanism: mirrors under reference/repos/)
4. Generate tasks by phase (Setup → Validation First → Core Authoring →
   Integration & Cross-references → Review & Polish):
   → Every Operational Requirement in spec.md maps to at least one task
   → Every Success/Verification Criterion maps to a Validation-First check task
   → Every task cites the exact repository file path(s) it touches
   → Every cited path is inside projects/governance-ops/ (see Scope Rule)
5. Apply task rules:
   → Different files, no shared dependency = mark [P] for parallel
   → Same file or dependent output = sequential (no [P])
   → Validation checks and evidence expectations are enumerated BEFORE the
     authoring they gate
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

- Every file path cited by a task MUST resolve inside the owning project tree, `projects/governance-ops/`
- Tasks MUST NOT create, modify, or delete files in the workspace root, in other projects, or in global `docs/`, `knowledge/`, or `reference/`
- Global context files may be **read** for guidance but never written by feature tasks
- If a task appears to require an out-of-scope change, STOP and escalate it in `plan.md` rather than authoring the task

## Path Conventions

- All paths below are relative to the repository root and MUST begin with `projects/governance-ops/`
- Feature documents live in `projects/governance-ops/docs/specs/[###-capability-name]/`
- Authored artifacts land at the target paths defined in `plan.md` (Structure Decision)

---

## Phase 3.1: Setup

- [ ] T001 [Confirm target paths per plan.md Structure Decision] — `projects/governance-ops/[path]`
- [ ] T002 [Scaffold the runbook entry / record template skeleton] — `projects/governance-ops/[path]`

## Phase 3.2: Validation First — enumerate checks BEFORE authoring

**Enumerate every mechanical check, evidence expectation, and review gate this package must pass, derived from spec.md Success/Verification Criteria. These checks gate the phases below; they are file checks and review gates, not runtime tests.**

- [ ] T003 [P] [Define check: evidence record conforms to its class-1 template (SC-###)] — recorded in this file / `projects/governance-ops/docs/specs/[###-capability-name]/tasks.md`
- [ ] T004 [P] [Define check: register row cites its evidence record (SC-###)] — recorded in this file
- [ ] T005 [P] [Name the review gate(s) and the approving authority (SC-###)] — recorded in this file

## Phase 3.3: Core Authoring

- [ ] T006 [Author the runbook steps: executor + evidence output per step, deviation handling] — `projects/governance-ops/[runbook path]`
- [ ] T007 [P] [Author/update the class-1 record template (synthetic content only)] — `projects/governance-ops/records/templates/[record].template.md`
- [ ] T008 [P] [Author/update register rows per plan.md] — `projects/governance-ops/registers/[register-file].md`

## Phase 3.4: Integration & Cross-references

- [ ] T009 [Wire citations: register rows ↔ evidence records ↔ runbook (both directions, exact anchors)] — `projects/governance-ops/[paths]`
- [ ] T010 [Update project indexes/instructions if plan.md requires] — `projects/governance-ops/knowledge/instructions.md`

## Phase 3.5: Review & Polish

- [ ] T011 [Run every Validation-First mechanical check; record results inline] — `projects/governance-ops/docs/specs/[###-capability-name]/tasks.md`
- [ ] T012 [Named review gate: approving authority verifies criteria + constitutions + evidence class conformance] — `projects/governance-ops/docs/specs/[###-capability-name]/spec.md`
- [ ] T013 [Resolve every deviation or record it in plan.md Complexity Tracking] — `projects/governance-ops/docs/specs/[###-capability-name]/plan.md`

---

## Dependencies

- Setup (T001–T002) before everything else
- Validation First (T003–T005) before Core Authoring (T006–T008) — checks and evidence expectations are defined before the work they gate
- Core Authoring before Integration & Cross-references (T009–T010)
- Everything before Review & Polish (T011–T013)
- [List any additional capability-specific ordering constraints here]

## Parallel Example

```
# T003–T005 record independent checks and share no dependency, so separate
# agents (or one agent in any order) may define them concurrently:
Agent A → T003: [record-conformance check] — .../tasks.md
Agent B → T004: [register-citation check] — .../tasks.md
Agent C → T005: [review gate naming] — .../tasks.md
```

## Notes

- [P] tasks = different files, no dependencies; never mark two tasks [P] if they modify the same file
- Validation Mode is declared once in plan.md and inherited here; do not mix modes within one package
- Evidence discipline: real execution evidence is class-2 machine-local; only synthetic class-1 templates are committed (project constitution evidence classes)
- Record completion by checking the task box in this file; note deviations inline
- Framework-dependent tasks require a prior grounding-check per [`../../../../../knowledge/instructions.md`](../../../../../knowledge/instructions.md) (root Article IV, Authoritative-Source Grounding) — a registered grounding source must exist before content that depends on it is proposed
- Avoid: vague tasks, missing file paths, same-file [P] conflicts, out-of-scope paths

## Validation Checklist

*GATE: All items must pass before this task list is considered execution-ready*

- [ ] Every Operational Requirement in spec.md is covered by at least one task
- [ ] Every Success/Verification Criterion in spec.md maps to a Validation-First check task
- [ ] Validation-First checks are enumerated before the authoring tasks they gate
- [ ] Evidence outputs bind to a declared evidence class and record template
- [ ] Every task cites at least one exact repository file path
- [ ] Every cited path is inside `projects/governance-ops/` (Scope Rule satisfied)
- [ ] No [P] task modifies the same file as another [P] task
- [ ] Parallel [P] tasks are truly independent (no hidden ordering)
- [ ] Dependencies section reflects all ordering constraints
- [ ] Validation Mode is `file-native` and honored — file-native mode: no task requires a CLI tool, script, or runtime
