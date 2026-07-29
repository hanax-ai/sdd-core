# Standard Specification: [STANDARD / DEFINITIONAL ARTIFACT NAME]

**Feature Folder**: `[###-standard-name]` <!-- e.g., 001-record-citation-standard -->

**Created**: [DATE]

**Status**: Draft <!-- Progression: Draft -> Clarified -> Ready for Planning -->

**Artifact Class**: governance-definition (normative standard, policy, principle, or framework-definition spec — see the domain scope document's Definitional-Artifact Test)

**Input**: Description: "[One- or two-sentence description of the standard or definitional artifact as provided by the requester]"

## Execution Flow (agent instructions)

```text
1. Start a new feature by COPYING this template folder:
   governance/framework/docs/specs/template/  ->  governance/framework/docs/specs/[###-standard-name]/
   (Use the next available zero-padded number, e.g., 001, 002, 003.)
2. Fill in the metadata block above (Feature Folder, Created, Input).
3. Read the governing context BEFORE writing any content:
   -> Global constitution: ../../../../../.specify/memory/constitution.md
   -> Global grounding registry: ../../../../../knowledge/instructions.md
   -> Domain scope constitution: ../../../constitution.md
   -> Domain grounding registry: ../../../knowledge/instructions.md
   -> Active feature folder: ./ (this spec; plan.md/tasks.md only at their stages)
4. Fill Intent & Scope, Governed Audience & Affected Surfaces, Normative
   Requirements, Conformance Criteria, and Assumptions from the description.
   -> Mark every uncertainty inline with [NEEDS CLARIFICATION: specific question].
5. Copy every [NEEDS CLARIFICATION] marker into the
   "Ambiguities & Clarifications (Clarify Phase)" table as a Q-### row (Status: Open).
6. Resolve each row with the requester or the domain owner; record Answer,
   set Status to Resolved, add Date, and update the spec text it refers to.
7. When ALL rows are Resolved: set Status above to "Clarified".
8. Complete the Review & Acceptance Checklist. If any item fails: fix and repeat.
9. When the checklist passes AND all clarifications are Resolved:
   set Status to "Ready for Planning". Only then may plan.md be started.
10. This spec is complete when it defines WHAT the standard requires and WHY,
    without HOW its text will be authored or wired in (that is plan.md's job).
```

---

## Quick Guidelines

- Focus on **WHAT** the standard must require and **WHY**; avoid **HOW** the artifact text will be structured or integrated (that belongs in `plan.md`).
- Written for the humans and agents who must CONFORM to the standard, not only its authors.
- Do not guess: any ambiguity MUST become a `[NEEDS CLARIFICATION: ...]` marker and a row in the Clarify table below.
- This workflow is file-and-agent only — no command-line tools or scripts are required at any step; agents read and write these Markdown files directly.

---

## Intent & Scope *(mandatory)*

**Intent (WHAT and WHY)**: [What this standard/definitional artifact establishes and the problem it solves, e.g., "Every register row must be traceable to the standard that governs it, so registers cannot silently drift from their standards"]

**In scope**: [The artifacts, behaviors, or surfaces this standard governs]

**Explicit exclusions (OUT of scope)**:

- [Excluded surface or behavior, e.g., "Machine-local registries — governed by the registry-logging skill, not this standard"]
- [Excluded surface or behavior]

## Governed Audience & Affected Surfaces *(mandatory)*

**Who must conform**: [Roles/agents bound by this standard, e.g., "any root-scoped session editing a register; reviewers approving register changes"]

**Affected surfaces** (which standards, registers, templates, or skills change or must newly conform):

| Surface | Effect |
|---------|--------|
| [e.g., `standards/[standard-file].md`] | [created / amended] |
| [e.g., `registers/[register-file].md`] | [must newly conform / row schema change] |

## Normative Requirements *(mandatory)*

<!--
  Each requirement is a testable MUST/MUST NOT statement about the governed
  surfaces, in governance-domain terms.
-->

- **FR-001**: [e.g., "The register MUST cite its owning standard by ID and version in its header"]
- **FR-002**: [e.g., "Every register row MUST carry an owner and a review date"]
- **FR-003**: [e.g., "The standard MUST NOT be amended without a version bump recorded in its Amendments list"]
- **FR-004**: [e.g., "Cross-references between the standard and its register MUST resolve in both directions"]

*Example of marking unclear requirements (each marker MUST also appear as a Q-### row in the Clarify table below):*

- **FR-005**: The register MUST be reviewed every [NEEDS CLARIFICATION: review cadence not specified — quarterly, semi-annually?]

## Conformance Criteria *(mandatory)*

<!--
  Measurable, file-native criteria a reviewer (human or agent) can check by
  reading files — no runtime. These become the Validation-First checks in
  tasks.md.
-->

- **CC-001**: [e.g., "Every cross-reference in the standard resolves to an existing file/anchor"]
- **CC-002**: [e.g., "The register header contains the sentinel `Governed by: [standard-ID]`"]
- **CC-003**: [e.g., "grep for the standard ID over `registers/` returns at least one citing row"]

## Assumptions

- [Assumption about existing artifacts, e.g., "The deliverables register already exists and follows ST-001's column schema"]
- [Assumption about scope boundaries]
- [Dependency on an existing standard/skill, e.g., "Relies on the governed-change skill for commit discipline"]

## Ambiguities & Clarifications (Clarify Phase) *(mandatory)*

<!--
  This section merges the Clarify phase into the spec itself — no separate step,
  tool, or session is required. Every [NEEDS CLARIFICATION: ...] marker anywhere
  in this document MUST have a matching Q-### row here.

  Workflow (file-and-agent only):
  1. While drafting, add a row for each ambiguity with Status = Open.
  2. Obtain the answer from the requester or domain owner (recorded in this file).
  3. Write the Answer, set Status = Resolved, add the Date, and update the
     related spec text (remove the inline marker once resolved).

  GATE: This spec CANNOT advance to "Ready for Planning" while ANY row has
  Status = Open. An empty table (no ambiguities found) also satisfies the gate.
-->

| ID    | Question / [NEEDS CLARIFICATION: ...] marker | Answer | Status (Open/Resolved) | Date |
|-------|----------------------------------------------|--------|------------------------|------|
| Q-001 | [e.g., NEEDS CLARIFICATION: review cadence not specified] | [Answer or blank while Open] | Open | [DATE] |
| Q-002 | [Question text] | [Answer] | Open | [DATE] |

## Review & Acceptance Checklist

<!--
  GATE: The authoring agent completes this checklist before marking the spec
  "Ready for Planning". Check items only when genuinely true.
-->

### Content Quality

- [ ] No authoring/integration details (artifact file structure, wiring order — those belong in plan.md)
- [ ] Focused on what conformance means and why the standard exists
- [ ] Written for the governed audience, not only the authors
- [ ] All mandatory sections completed

### Requirement Completeness

- [ ] No [NEEDS CLARIFICATION] markers remain in the spec body
- [ ] Every row in the Ambiguities & Clarifications table has Status = Resolved
- [ ] Every Normative Requirement is a testable MUST/MUST NOT statement
- [ ] Every Conformance Criterion is checkable by reading files (file-native)
- [ ] Scope and explicit exclusions are clearly bounded
- [ ] Assumptions and dependencies identified

### Consistency

- [ ] Spec conforms to the domain scope document (`../../../constitution.md`)
- [ ] Spec conforms to the global constitution (`../../../../../.specify/memory/constitution.md`)
- [ ] Domain instructions were consulted (`../../../knowledge/instructions.md`)
- [ ] Artifact class confirmed against the Definitional-Artifact Test (framework owns the what/why)

---

*Next step (after Status = Ready for Planning): fill in `plan.md` in this feature folder, then `tasks.md`.*
