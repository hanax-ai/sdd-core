# Authoring Plan: [STANDARD / DEFINITIONAL ARTIFACT NAME]

**Feature Directory**: `governance/framework/docs/specs/[###-standard-name]/` | **Date**: [DATE] | **Spec**: [spec.md](./spec.md)

**Input**: Standard specification from `governance/framework/docs/specs/[###-standard-name]/spec.md`

**Note**: This template is filled in directly by the planning agent after `spec.md` is complete. No command, script, or runtime is involved — the agent reads and writes the named Markdown files below.

## Execution Flow (planning agent)

```text
1. Read spec.md from this feature directory
   → If missing or incomplete: ERROR "Complete spec.md before planning"
2. Fill Design Context below
   → Mark every unknown as NEEDS CLARIFICATION
3. Read BOTH constitutions:
   → Root:    .specify/memory/constitution.md (workspace root)
   → Domain:  governance/framework/constitution.md
4. Evaluate the Constitution Check section (initial gate)
   → If violations exist: document them in Complexity Tracking
   → If a violation cannot be justified: ERROR "Simplify approach first"
5. Execute Phase 0 → write research.md in this feature directory
   → If NEEDS CLARIFICATION items remain: ERROR "Resolve unknowns first"
6. Execute Phase 1 → outline the standard text and any register schemas /
   record templates the class needs (data-model.md and contracts/ ONLY if
   the artifact class genuinely needs them)
7. Re-evaluate the Constitution Check (post-design gate)
   → If new violations: refactor the design, return to step 6
8. Describe the Phase 2 task-planning approach below
   → Do NOT create tasks.md during planning
9. Update Progress & Gate Tracking and STOP — ready for tasks.md
```

**IMPORTANT**: Planning ends at step 9. `tasks.md` is authored in a separate pass, using the approach described in Phase 2 of this plan.

## Summary

[Extract from spec: primary normative intent + the authoring/integration approach chosen in research]

## Design Context

<!--
  ACTION REQUIRED: Replace the placeholders with the design facts for this
  definitional artifact.
-->

**Artifact Class**: governance-definition — [standard / policy / principle / framework-definition spec]

**Affected Files**: [every file this feature creates or modifies, exact repository paths inside governance/framework/]

**Dependent Standards / Registers / Skills**: [what must stay consistent with this artifact, e.g., "registers/deliverables.md (ops) consumes released text read-only — impact assessment required on release"]

**Storage**: [per the governing plan's reviewed storage decision (root Article II), e.g., Git-managed files (typical for this class) or N/A]

**Validation Mode**: `file-native` <!-- default for this internal domain; acceptance = mechanical file checks + named review gates; no runtime anywhere in the package. Changing modes is a deliberate, recorded plan decision. -->

**Grounding**: [external-source-dependent claims, if any, cite registered grounding sources per root Article IV (this workspace's mechanism: mirrors under `reference/repos/`, registries in `knowledge/instructions.md`) — or "none: workspace-internal artifact"]

**Constraints**: [domain-specific, e.g., "must not contradict ST-001 column schema", "release requires ops impact assessment"]

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

This workspace has **two constitutions**, and this gate requires reading both — the root constitution governs every project; the owning project's constitution adds project-specific principles. A design must satisfy both, both **before** research begins and **after** design artifacts are produced.

### Root Constitution Gate — `.specify/memory/constitution.md` (workspace root)

[List each root principle relevant to this feature and state PASS / VIOLATION with a one-line rationale]

- [Principle]: [PASS / VIOLATION — rationale]

### Domain Scope Constitution Gate — `governance/framework/constitution.md`

[List each project principle relevant to this feature and state PASS / VIOLATION with a one-line rationale]

- [Principle]: [PASS / VIOLATION — rationale]

**Initial Check (pre-research)**: [PASS / VIOLATIONS DOCUMENTED — see Complexity Tracking]

**Post-Design Check (after Phase 1)**: [PASS / VIOLATIONS DOCUMENTED — see Complexity Tracking]

## Project Structure

### Documentation (this feature)

```text
governance/framework/docs/specs/[###-standard-name]/
├── spec.md              # Standard specification (input to this plan)
├── plan.md              # This file (planning agent output)
├── research.md          # Phase 0 output (planning agent)
├── data-model.md        # Phase 1 output — ONLY if the class needs schemas
├── contracts/           # Phase 1 output — ONLY if the class needs interface contracts
└── tasks.md             # Phase 2 output (task-planning agent — NOT created during planning)
```

### Authored / Modified Artifacts (project tree)

<!--
  ACTION REQUIRED: Replace with the REAL target paths this feature writes,
  e.g., the standard file, register files, record templates. Every path is
  inside governance/framework/.
-->

```text
governance/framework/
├── standards/[standard-file].md        # [created / amended]
└── [other affected project paths]
```

**Structure Decision**: [Document the selected target paths and why they are the right home for this artifact class]

## Phase 0: Outline & Research

1. **Extract unknowns from Design Context** above:
   - Each NEEDS CLARIFICATION → a research task
   - Each dependent standard/register/skill → a consistency-review task

2. **Resolve each unknown by reading workspace knowledge first**:
   - Global guidance: `knowledge/instructions.md`, `docs/`, `reference/` (workspace root)
   - Project guidance: `governance/framework/knowledge/instructions.md`, `governance/framework/reference/`
   - Framework grounding-check: before proposing any external-source-dependent text, verify a registered grounding source per `knowledge/instructions.md` (root Article IV, Authoritative-Source Grounding; this workspace's mechanism: mirrors under `reference/repos/`)

3. **Write findings to `research.md`** in this feature directory, one entry per unknown:
   - **Decision**: [what was chosen]
   - **Rationale**: [why chosen]
   - **Alternatives considered**: [what else was evaluated]

**Output**: `research.md` with all NEEDS CLARIFICATION items resolved

## Phase 1: Design (standard text outline & schemas)

*Prerequisite: `research.md` complete*

1. **Outline the standard text**: section structure, normative-statement inventory (which FR-### lands in which section), version/amendment block shape
2. **Design register schemas / record templates** the class needs → `data-model.md` (ONLY if needed): column definitions, row invariants, citation directions
3. **Define cross-reference wiring**: which files must cite this artifact and which files it must cite — both directions, exact anchors (→ `contracts/` ONLY if formal interface contracts are genuinely involved)
4. **Derive conformance checks from the spec's Conformance Criteria**: each CC-### becomes a mechanical file check or a named review gate in tasks.md
5. **Record new agent context in project knowledge**: if design introduces conventions future agents must know, append them to `governance/framework/knowledge/instructions.md` directly — keep additions incremental and preserve existing content

**Output**: standard text outline (in this plan or `research.md`), `data-model.md` / `contracts/` only if needed, updated project instructions

## Phase 2: Task Planning Approach

*This section describes what the task-planning agent will do — do NOT create `tasks.md` during planning*

**Task Generation Strategy**:

- Use `governance/framework/docs/specs/template/tasks.md` as the structural base
- Generate tasks from Phase 1 artifacts: each Conformance Criterion → a Validation-First check task; each authored/modified file → a Core Authoring task; each cross-reference direction → an Integration task

**Ordering Strategy**:

- Validation First: enumerate the mechanical checks and review gates BEFORE authoring begins
- Dependency order: standard text → dependent register/template updates → cross-reference wiring
- Mark [P] for tasks that touch independent files and can proceed in parallel

**Estimated Output**: [e.g., 10–18] numbered, ordered tasks in `tasks.md`

## Complexity Tracking

> **Fill ONLY if the Constitution Check has violations that must be justified**

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| [e.g., new register] | [current need] | [why existing registers insufficient] |
| [e.g., new datastore] | [specific problem] | [why the storage decision recorded in this plan and its invariants do not cover it] |

## Progress & Gate Tracking

*Updated by the planning agent as execution proceeds*

**Phase Status**:

- [ ] Phase 0: Research complete (`research.md` written)
- [ ] Phase 1: Design complete (outline + any needed schemas written)
- [ ] Phase 2: Task planning approach described (this plan only)

**Gate Status**:

- [ ] Initial Constitution Check: PASS (root **and** domain scope documents)
- [ ] Post-Design Constitution Check: PASS (root **and** domain scope documents)
- [ ] All NEEDS CLARIFICATION resolved
- [ ] Validation Mode declared (`file-native` unless deliberately changed and recorded)
- [ ] Complexity deviations documented (or none required)

---

*Gated by `.specify/memory/constitution.md` (workspace root) and `governance/framework/constitution.md` — see the Constitution Check above.*
