# Capability Plan: [OPERATIONAL CAPABILITY NAME]

**Feature Directory**: `governance/operations/docs/specs/[###-capability-name]/` | **Date**: [DATE] | **Spec**: [spec.md](./spec.md)

**Input**: Capability specification from `governance/operations/docs/specs/[###-capability-name]/spec.md`

**Note**: This template is filled in directly by the planning agent after `spec.md` is complete. No command, script, or runtime is involved — the agent reads and writes the named Markdown files below.

## Execution Flow (planning agent)

```text
1. Read spec.md from this feature directory
   → If missing or incomplete: ERROR "Complete spec.md before planning"
2. Fill Design Context below
   → Mark every unknown as NEEDS CLARIFICATION
3. Read BOTH constitutions:
   → Root:    .specify/memory/constitution.md (workspace root)
   → Domain:  governance/operations/constitution.md
4. Evaluate the Constitution Check section (initial gate)
   → If violations exist: document them in Complexity Tracking
   → If a violation cannot be justified: ERROR "Simplify approach first"
5. Execute Phase 0 → write research.md in this feature directory
   → If NEEDS CLARIFICATION items remain: ERROR "Resolve unknowns first"
6. Execute Phase 1 → outline the runbook, design record templates and
   register rows the capability needs (data-model.md / contracts/ ONLY if
   the class genuinely needs them)
7. Re-evaluate the Constitution Check (post-design gate)
   → If new violations: refactor the design, return to step 6
8. Describe the Phase 2 task-planning approach below
   → Do NOT create tasks.md during planning
9. Update Progress & Gate Tracking and STOP — ready for tasks.md
```

**IMPORTANT**: Planning ends at step 9. `tasks.md` is authored in a separate pass, using the approach described in Phase 2 of this plan.

## Summary

[Extract from spec: operational outcome + the runbook/evidence approach chosen in research]

## Design Context

<!--
  ACTION REQUIRED: Replace the placeholders with the design facts for this
  operational capability.
-->

**Artifact Class**: governance-operations — [runbook / cadence / evidence capability]

**Affected Files**: [every file this feature creates or modifies, exact repository paths inside governance/operations/ — runbooks, registers, record templates]

**Dependent Registers / Records / Released Standards**: [what this capability consumes or updates, e.g., "registers/deliverables.md rows; consumes released ST-001 read-only under the one-way dependency contract"]

**Storage**: [per the governing plan's reviewed storage decision (root Article II), e.g., Git-managed files for policy/templates; class-2 records machine-local per the evidence classes; or N/A]

**Validation Mode**: `file-native` <!-- default for this internal domain; acceptance = mechanical file checks + named review gates; no runtime anywhere in the package. Changing modes is a deliberate, recorded plan decision. -->

**Grounding**: [external-source-dependent claims, if any, cite registered grounding sources per root Article IV (this workspace's mechanism: mirrors under `reference/repos/`, registries in `knowledge/instructions.md`) — or "none: workspace-internal capability"]

**Constraints**: [domain-specific, e.g., "hard calendar date binds regardless of framework progress", "Endpoint Discipline: evidence uses aliases only"]

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

This repository has a GLOBAL constitution and an OPERATIONAL-GOVERNANCE
domain constitution. The domain constitution adds domain-specific principles
without overriding GLOBAL authority. A design must satisfy both before
research begins and after design artifacts are produced.

### Root Constitution Gate — `.specify/memory/constitution.md` (workspace root)

[List each root principle relevant to this feature and state PASS / VIOLATION with a one-line rationale]

- [Principle]: [PASS / VIOLATION — rationale]

### Domain Scope Constitution Gate — `governance/operations/constitution.md`

[List each OPERATIONAL-GOVERNANCE domain principle relevant to this feature
and state PASS / VIOLATION with a one-line rationale — include the evidence
classes and the one-way dependency contract]

- [Principle]: [PASS / VIOLATION — rationale]

**Initial Check (pre-research)**: [PASS / VIOLATIONS DOCUMENTED — see Complexity Tracking]

**Post-Design Check (after Phase 1)**: [PASS / VIOLATIONS DOCUMENTED — see Complexity Tracking]

## Domain Structure

### Documentation (this feature)

```text
governance/operations/docs/specs/[###-capability-name]/
├── spec.md              # Capability specification (input to this plan)
├── plan.md              # This file (planning agent output)
├── research.md          # Phase 0 output (planning agent)
├── data-model.md        # Phase 1 output — ONLY if the class needs schemas
├── contracts/           # Phase 1 output — ONLY if formal contracts are involved
└── tasks.md             # Phase 2 output (task-planning agent — NOT created during planning)
```

### Authored / Modified Artifacts (domain tree)

<!--
  ACTION REQUIRED: Replace with the REAL target paths this feature writes,
  e.g., the runbook, record templates, register rows. Every path is inside
  governance/operations/.
-->

```text
governance/operations/
├── knowledge/[runbook or playbook entry]      # [created / amended]
├── records/templates/[record].template.md     # [created — class-1 synthetic template only]
└── registers/[register-file].md               # [rows updated]
```

**Structure Decision**: [Document the selected target paths and why they are the right home for this capability]

## Rollback / Recovery Considerations

<!--
  Operational changes need an exit path. State what "undo" means for this
  capability: which artifacts revert cleanly by git revert, which records are
  retained as evidence of the aborted run, and any register rows to correct.
-->

- **Rollback**: [e.g., "git revert of the capability commit; register rows corrected by a follow-up row, never edited in place"]
- **Evidence of aborted runs**: [e.g., "a deviation record is retained per FR-###; no evidence is deleted"]

## Phase 0: Outline & Research

1. **Extract unknowns from Design Context** above:
   - Each NEEDS CLARIFICATION → a research task
   - Each dependent register/record/standard → a consistency-review task

2. **Resolve each unknown by reading workspace knowledge first**:
   - Global guidance: `knowledge/instructions.md`, `docs/`, `reference/` (workspace root)
   - Domain guidance: `governance/operations/knowledge/instructions.md`, `governance/operations/reference/`
   - Framework grounding-check: before proposing any external-source-dependent content, verify a registered grounding source per `knowledge/instructions.md` (root Article IV, Authoritative-Source Grounding; this workspace's mechanism: mirrors under `reference/repos/`)

3. **Write findings to `research.md`** in this feature directory, one entry per unknown:
   - **Decision**: [what was chosen]
   - **Rationale**: [why chosen]
   - **Alternatives considered**: [what else was evaluated]

**Output**: `research.md` with all NEEDS CLARIFICATION items resolved

## Phase 1: Design (runbook outline, record templates, register rows)

*Prerequisite: `research.md` complete*

1. **Outline the runbook**: ordered steps, each with executor role and evidence output; deviation handling per the spec's requirements
2. **Design record templates** the capability instantiates → `records/templates/` shapes (synthetic, class-1) — schema in `data-model.md` ONLY if the class needs one
3. **Design register wiring**: which rows are added/updated, citation directions between rows and evidence records
4. **Derive verification checks from the spec's Success/Verification Criteria**: each SC-### becomes a mechanical file check or a named review gate in tasks.md
5. **Record new agent context in domain knowledge**: if design introduces conventions future agents must know, append them to `governance/operations/knowledge/instructions.md` directly — keep additions incremental and preserve existing content

**Output**: runbook outline (in this plan or `research.md`), record-template designs, register wiring, updated domain instructions

## Phase 2: Task Planning Approach

*This section describes what the task-planning agent will do — do NOT create `tasks.md` during planning*

**Task Generation Strategy**:

- Use `governance/operations/docs/specs/template/tasks.md` as the structural base
- Generate tasks from Phase 1 artifacts: each Success/Verification Criterion → a Validation-First check task; the runbook and each record template/register change → Core Authoring tasks; each citation direction → an Integration task

**Ordering Strategy**:

- Validation First: enumerate the mechanical checks, evidence expectations, and review gates BEFORE authoring begins
- Dependency order: runbook → record templates → register wiring
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
- [ ] Phase 1: Design complete (runbook outline + record/register designs written)
- [ ] Phase 2: Task planning approach described (this plan only)

**Gate Status**:

- [ ] Initial Constitution Check: PASS (root **and** domain scope documents)
- [ ] Post-Design Constitution Check: PASS (root **and** domain scope documents)
- [ ] All NEEDS CLARIFICATION resolved
- [ ] Validation Mode declared (`file-native` unless deliberately changed and recorded)
- [ ] Rollback / Recovery considerations recorded
- [ ] Complexity deviations documented (or none required)

---

*Gated by `.specify/memory/constitution.md` (workspace root) and `governance/operations/constitution.md` — see the Constitution Check above.*
