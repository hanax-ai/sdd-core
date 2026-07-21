# Implementation Plan: [FEATURE]

**Feature Directory**: `projects/[project]/docs/specs/[###-feature-name]/` | **Date**: [DATE] | **Spec**: [spec.md](./spec.md)

**Input**: Feature specification from `projects/[project]/docs/specs/[###-feature-name]/spec.md`

**Note**: This template is filled in directly by the planning agent after `spec.md` is complete. No command, script, or runtime is involved — the agent reads and writes the named Markdown files below.

## Execution Flow (planning agent)

```text
1. Read spec.md from this feature directory
   → If missing or incomplete: ERROR "Complete spec.md before planning"
2. Fill Technical Context below
   → Mark every unknown as NEEDS CLARIFICATION
3. Read BOTH constitutions:
   → Root:    .specify/memory/constitution.md (workspace root)
   → Project: projects/[project]/.specify/memory/constitution.md
4. Evaluate the Constitution Check section (initial gate)
   → If violations exist: document them in Complexity Tracking
   → If a violation cannot be justified: ERROR "Simplify approach first"
5. Execute Phase 0 → write research.md in this feature directory
   → If NEEDS CLARIFICATION items remain: ERROR "Resolve unknowns first"
6. Execute Phase 1 → write data-model.md, contracts/, quickstart.md
7. Re-evaluate the Constitution Check (post-design gate)
   → If new violations: refactor the design, return to step 6
8. Describe the Phase 2 task-planning approach below
   → Do NOT create tasks.md during planning
9. Update Progress Tracking and STOP — ready for tasks.md
```

**IMPORTANT**: Planning ends at step 9. `tasks.md` is authored in a separate pass, using the approach described in Phase 2 of this plan.

## Summary

[Extract from feature spec: primary requirement + technical approach from research]

## Technical Context

<!--
  ACTION REQUIRED: Replace the content in this section with the technical details
  for the feature. The structure here is presented in advisory capacity to guide
  the iteration process.
-->

**Language/Version**: [e.g., Python 3.11, TypeScript 5.x or NEEDS CLARIFICATION]

**Primary Dependencies**: [e.g., FastAPI, LangGraph or NEEDS CLARIFICATION — confirm framework availability via the mirror-check in `knowledge/instructions.md` before committing to any framework]

**Storage**: [if applicable, e.g., PostgreSQL (relational), Qdrant (vector), files or N/A]

**Testing**: [e.g., pytest, vitest or NEEDS CLARIFICATION]

**Target Platform**: [e.g., Linux server, containerized service or NEEDS CLARIFICATION]

**Project Type**: [e.g., library/service/agent-pipeline/web-app or NEEDS CLARIFICATION]

**Performance Goals**: [domain-specific, e.g., 1000 req/s, <1s inference or NEEDS CLARIFICATION]

**Constraints**: [domain-specific, e.g., <200ms p95, offline-capable or NEEDS CLARIFICATION]

**Scale/Scope**: [domain-specific, e.g., 10k users, 50 endpoints or NEEDS CLARIFICATION]

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

This workspace has **two constitutions**, and this gate requires reading both — the root constitution governs every project; the owning project's constitution adds project-specific principles. A design must satisfy both, both **before** research begins and **after** design artifacts are produced.

### Root Constitution Gate — `.specify/memory/constitution.md` (workspace root)

[List each root principle relevant to this feature and state PASS / VIOLATION with a one-line rationale]

- [Principle]: [PASS / VIOLATION — rationale]

### Project Constitution Gate — `projects/[project]/.specify/memory/constitution.md`

[List each project principle relevant to this feature and state PASS / VIOLATION with a one-line rationale]

- [Principle]: [PASS / VIOLATION — rationale]

**Initial Check (pre-research)**: [PASS / VIOLATIONS DOCUMENTED — see Complexity Tracking]

**Post-Design Check (after Phase 1)**: [PASS / VIOLATIONS DOCUMENTED — see Complexity Tracking]

## Project Structure

### Documentation (this feature)

```text
projects/[project]/docs/specs/[###-feature-name]/
├── spec.md              # Feature specification (input to this plan)
├── plan.md              # This file (planning agent output)
├── research.md          # Phase 0 output (planning agent)
├── data-model.md        # Phase 1 output (planning agent)
├── quickstart.md        # Phase 1 output (planning agent)
├── contracts/           # Phase 1 output (planning agent)
└── tasks.md             # Phase 2 output (task-planning agent — NOT created during planning)
```

### Source Code (project root)

<!--
  ACTION REQUIRED: Replace the placeholder tree below with the concrete layout
  for this feature. Delete unused options and expand the chosen structure with
  real paths. The delivered plan must not include Option labels.
-->

```text
# [REMOVE IF UNUSED] Option 1: Single project (DEFAULT)
src/
├── models/
├── services/
├── agents/
└── lib/

tests/
├── contract/
├── integration/
└── unit/

# [REMOVE IF UNUSED] Option 2: Web application (when "frontend" + "backend" detected)
backend/
├── src/
│   ├── models/
│   ├── services/
│   └── api/
└── tests/

frontend/
├── src/
│   ├── components/
│   ├── pages/
│   └── services/
└── tests/
```

**Structure Decision**: [Document the selected structure and reference the real directories captured above]

## Phase 0: Outline & Research

1. **Extract unknowns from Technical Context** above:
   - Each NEEDS CLARIFICATION → a research task
   - Each dependency → a best-practices task
   - Each integration → a patterns task

2. **Resolve each unknown by reading workspace knowledge first**:
   - Global guidance: `knowledge/instructions.md`, `docs/`, `reference/` (workspace root)
   - Project guidance: `projects/[project]/knowledge/instructions.md`, `projects/[project]/reference/`
   - Framework mirror-check: before proposing framework-dependent code, verify the framework is mirrored under `reference/repos/` as directed by `knowledge/instructions.md`

3. **Write findings to `research.md`** in this feature directory, one entry per unknown:
   - **Decision**: [what was chosen]
   - **Rationale**: [why chosen]
   - **Alternatives considered**: [what else was evaluated]

**Output**: `research.md` with all NEEDS CLARIFICATION items resolved

## Phase 1: Design & Contracts

*Prerequisite: `research.md` complete*

1. **Extract entities from the feature spec** → write `data-model.md`:
   - Entity name, fields, relationships
   - Validation rules from requirements
   - State transitions if applicable

2. **Derive contracts from functional requirements** → write one file per interface into `contracts/`:
   - Each user action → an interface or endpoint definition
   - Use standard schema notation (e.g., OpenAPI or JSON Schema) authored as plain files

3. **Derive contract test scenarios**:
   - One test scenario per contract, described in the contract file
   - Scenarios must fail until an implementation exists (they assert behavior, not placeholders)

4. **Extract validation scenarios from user stories** → write `quickstart.md`:
   - Step-by-step walkthrough that verifies the feature end to end

5. **Record new agent context in project knowledge**: if design introduces technologies or conventions future agents must know, append them to `projects/[project]/knowledge/instructions.md` directly — keep additions incremental and preserve existing content

**Output**: `data-model.md`, `contracts/`, `quickstart.md`, updated project instructions

## Phase 2: Task Planning Approach

*This section describes what the task-planning agent will do — do NOT create `tasks.md` during planning*

**Task Generation Strategy**:

- Use `projects/[project]/docs/specs/template/tasks.md` as the structural base
- Generate tasks from Phase 1 artifacts: each contract → a contract test task; each entity → a model task; each user story → an integration test task
- Implementation tasks follow their corresponding failing tests

**Ordering Strategy**:

- Tests before implementation (TDD order)
- Dependency order: models → services → interfaces
- Mark [P] for tasks that touch independent files and can proceed in parallel

**Estimated Output**: [e.g., 25–30] numbered, ordered tasks in `tasks.md`

## Complexity Tracking

> **Fill ONLY if the Constitution Check has violations that must be justified**

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| [e.g., 4th service] | [current need] | [why 3 services insufficient] |
| [e.g., new datastore] | [specific problem] | [why PostgreSQL/Qdrant insufficient] |

## Progress Tracking

*Updated by the planning agent as execution proceeds*

**Phase Status**:

- [ ] Phase 0: Research complete (`research.md` written)
- [ ] Phase 1: Design complete (`data-model.md`, `contracts/`, `quickstart.md` written)
- [ ] Phase 2: Task planning approach described (this plan only)

**Gate Status**:

- [ ] Initial Constitution Check: PASS (root **and** project constitutions)
- [ ] Post-Design Constitution Check: PASS (root **and** project constitutions)
- [ ] All NEEDS CLARIFICATION resolved
- [ ] Complexity deviations documented (or none required)

---

*Gated by `.specify/memory/constitution.md` (workspace root) and `projects/[project]/.specify/memory/constitution.md` — see the Constitution Check above.*
