# Capability Specification: [OPERATIONAL CAPABILITY NAME]

**Feature Folder**: `[###-capability-name]` <!-- e.g., 001-register-review-cadence -->

**Created**: [DATE]

**Status**: Draft <!-- Progression: Draft -> Clarified -> Ready for Planning -->

**Artifact Class**: governance-operations (runbook, cadence, evidence capability — see the domain scope document's Execution-Evidence Test)

**Input**: Description: "[One- or two-sentence description of the operational capability as provided by the requester]"

## Execution Flow (agent instructions)

```text
1. Start a new feature by COPYING this template folder:
   governance/operations/docs/specs/template/  ->  governance/operations/docs/specs/[###-capability-name]/
   (Use the next available zero-padded number, e.g., 001, 002, 003.)
2. Fill in the metadata block above (Feature Folder, Created, Input).
3. Read the governing context BEFORE writing any content:
   -> Domain scope constitution: ../../../constitution.md
   -> Project instructions: ../../../knowledge/instructions.md
   -> Global constitution: ../../../../../.specify/memory/constitution.md
4. Fill Operational Outcome & Scope, Triggers & Cadence, Roles & Authority,
   Operational Requirements, Evidence & Records, Success/Verification
   Criteria, and Assumptions from the description.
   -> Mark every uncertainty inline with [NEEDS CLARIFICATION: specific question].
5. Copy every [NEEDS CLARIFICATION] marker into the
   "Ambiguities & Clarifications (Clarify Phase)" table as a Q-### row (Status: Open).
6. Resolve each row with the requester or the project owner; record Answer,
   set Status to Resolved, add Date, and update the spec text it refers to.
7. When ALL rows are Resolved: set Status above to "Clarified".
8. Complete the Review & Acceptance Checklist. If any item fails: fix and repeat.
9. When the checklist passes AND all clarifications are Resolved:
   set Status to "Ready for Planning". Only then may plan.md be started.
10. This spec is complete when it defines WHAT the capability does, WHO runs
    it, and WHAT evidence it produces — without HOW the runbook text is
    structured (that is plan.md's job).
```

---

## Quick Guidelines

- Focus on **WHAT** the capability delivers operationally and **WHY**; avoid **HOW** the runbook/records will be authored (that belongs in `plan.md`).
- Written for the operators who execute it and the authorities who approve it.
- Do not guess: any ambiguity MUST become a `[NEEDS CLARIFICATION: ...]` marker and a row in the Clarify table below.
- This workflow is file-and-agent only — no command-line tools or scripts are required at any step; agents read and write these Markdown files directly.

---

## Operational Outcome & Scope *(mandatory)*

**Outcome (WHAT and WHY)**: [The operational result this capability produces and the need it serves, e.g., "every deliverables-register row is reviewed on schedule, producing auditable review evidence"]

**In scope**: [The operations, registers, records, or cadences this capability covers]

**Explicit exclusions (OUT of scope)**:

- [Excluded operation or surface]
- [Excluded operation or surface]

## Triggers & Cadence *(mandatory)*

- **Trigger(s)**: [what starts an execution — calendar date, event, maintainer directive, threshold]
- **Cadence**: [e.g., "quarterly", "on every register change", "on demand — no fixed cadence"]
- **Deadline/window behavior**: [e.g., "all rows due the same day; execution may start 14 days early"]

## Roles & Authority *(mandatory)*

- **Executes**: [role/agent that runs the capability, e.g., "root-scoped session under maintainer directive"]
- **Approves**: [the human authority; cite the gate if one applies — Gate 1/Gate 2 or maintainer directive per the root constitution's Maintenance Changes route]
- **Consulted / informed**: [other roles, if any]

## Operational Requirements *(mandatory)*

<!--
  Each requirement is a testable MUST/MUST NOT statement about the operation,
  in ops-domain terms.
-->

- **FR-001**: [e.g., "Each control execution MUST produce a class-2 execution record instantiated from the class-1 control-execution template"]
- **FR-002**: [e.g., "A missed cadence window MUST be recorded as a deviation, never silently skipped"]
- **FR-003**: [e.g., "The register row MUST be updated with the review date in the same change as the evidence record"]
- **FR-004**: [e.g., "Execution MUST NOT modify surfaces outside governance/operations/ (Scope Rule)"]

*Example of marking unclear requirements (each marker MUST also appear as a Q-### row in the Clarify table below):*

- **FR-005**: Evidence records MUST be retained for [NEEDS CLARIFICATION: retention period not specified]

## Evidence & Records *(mandatory)*

<!--
  Bind the capability to the ops evidence system (domain scope document's
  evidence classes).
-->

- **Evidence class**: [Class 1 committed policy/template · Class 2 machine-local record · Class 3 external safe-reference — per the domain scope document]
- **Record template**: [which template under `records/templates/` each execution instantiates, or the new template this capability adds]
- **Retention**: [per the records policy, e.g., "next-review + 30 days" or the capability-specific override this spec establishes]
- **Register wiring**: [which register rows cite the evidence, and how]

## Success / Verification Criteria *(mandatory)*

<!--
  Measurable, file-native criteria a reviewer (human or agent) can check by
  reading files — no runtime. These become the Validation-First checks in
  tasks.md.
-->

- **SC-001**: [e.g., "after one execution, exactly one class-2 execution record instantiated from the class-1 template exists and its register row cites it"]
- **SC-002**: [e.g., "the runbook names every step's executor and evidence output — no step lacks either"]
- **SC-003**: [e.g., "a simulated missed window produces a deviation record per FR-002"]

## Assumptions

- [Assumption about existing registers/records, e.g., "the deliverables register and its 14 rows exist per ST-001"]
- [Assumption about operational environment]
- [Dependency on a released framework standard, e.g., "consumes ST-001 read-only under the one-way dependency contract"]

## Ambiguities & Clarifications (Clarify Phase) *(mandatory)*

<!--
  This section merges the Clarify phase into the spec itself — no separate step,
  tool, or session is required. Every [NEEDS CLARIFICATION: ...] marker anywhere
  in this document MUST have a matching Q-### row here.

  Workflow (file-and-agent only):
  1. While drafting, add a row for each ambiguity with Status = Open.
  2. Obtain the answer from the requester or project owner (recorded in this file).
  3. Write the Answer, set Status = Resolved, add the Date, and update the
     related spec text (remove the inline marker once resolved).

  GATE: This spec CANNOT advance to "Ready for Planning" while ANY row has
  Status = Open. An empty table (no ambiguities found) also satisfies the gate.
-->

| ID    | Question / [NEEDS CLARIFICATION: ...] marker | Answer | Status (Open/Resolved) | Date |
|-------|----------------------------------------------|--------|------------------------|------|
| Q-001 | [e.g., NEEDS CLARIFICATION: retention period not specified] | [Answer or blank while Open] | Open | [DATE] |
| Q-002 | [Question text] | [Answer] | Open | [DATE] |

## Review & Acceptance Checklist

<!--
  GATE: The authoring agent completes this checklist before marking the spec
  "Ready for Planning". Check items only when genuinely true.
-->

### Content Quality

- [ ] No runbook-authoring details (step text, record file structure — those belong in plan.md)
- [ ] Focused on operational outcome, authority, and evidence
- [ ] Written for the operators and approving authorities
- [ ] All mandatory sections completed

### Requirement Completeness

- [ ] No [NEEDS CLARIFICATION] markers remain in the spec body
- [ ] Every row in the Ambiguities & Clarifications table has Status = Resolved
- [ ] Every Operational Requirement is a testable MUST/MUST NOT statement
- [ ] Evidence & Records binds every execution to an evidence class and record template
- [ ] Every Success/Verification Criterion is checkable by reading files (file-native)
- [ ] Scope and explicit exclusions are clearly bounded
- [ ] Assumptions and dependencies identified

### Consistency

- [ ] Spec conforms to the domain scope document (`../../../constitution.md`)
- [ ] Spec conforms to the global constitution (`../../../../../.specify/memory/constitution.md`)
- [ ] Project instructions were consulted (`../../../knowledge/instructions.md`)
- [ ] Artifact class confirmed against the Execution-Evidence Test (ops owns the how/when)

---

*Next step (after Status = Ready for Planning): fill in `plan.md` in this feature folder, then `tasks.md`.*
