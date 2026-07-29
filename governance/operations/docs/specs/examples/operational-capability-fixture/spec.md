> SYNTHETIC EXAMPLE — completed for illustration only. Not a governed artifact; grants no authority; never cite as precedent or evidence.

# Capability Specification: Synthetic Quarterly Glossary-Audit Cadence

**Feature Folder**: `examples/operational-capability-fixture` (fixture — outside numbered feature folders)

**Created**: 2026-07-25

**Status**: Ready for Planning

**Artifact Class**: governance-operations (cadence + evidence capability)

**Input**: Description: "Audit the synthetic glossary quarterly against its citation standard, producing an auditable evidence record per run."

## Operational Outcome & Scope

**Outcome (WHAT and WHY)**: every quarter, the synthetic glossary is audited against SYN-ST-900 and one evidence record proves the audit ran and what it found — conformance drift is caught within one quarter.

**In scope**: the synthetic glossary audit: citation presence, ID resolution, header sentinel.

**Explicit exclusions (OUT of scope)**:

- Amending SYN-ST-900 itself (FRAMEWORK-DEFINITION owns the standard).
- Auditing any surface other than the synthetic glossary.

## Triggers & Cadence

- **Trigger(s)**: calendar — first week of each quarter; or on-demand maintainer directive after a bulk glossary edit.
- **Cadence**: quarterly.
- **Deadline/window behavior**: audit completes within 14 days of quarter start; a missed window is recorded as a deviation, never skipped silently.

## Roles & Authority

- **Executes**: ops-scoped session (synthetic role) under standing cadence.
- **Approves**: Workspace Maintainer reviews the quarterly record (no gate required — execution of a ratified cadence).
- **Consulted / informed**: FRAMEWORK-DEFINITION domain owner on any nonconformance touching SYN-ST-900.

## Operational Requirements

- **FR-001**: Each audit run MUST produce one class-2 execution record instantiated from the committed class-1 synthetic-audit record template (machine-local, per the evidence policy).
- **FR-002**: A missed cadence window MUST be recorded as a deviation record.
- **FR-003**: Every nonconforming glossary entry MUST be listed in the record with its exact line reference.
- **FR-004**: The audit MUST NOT modify the glossary — findings only; fixes are separate governed changes.

## Evidence & Records

- **Evidence class**: Class 1 for the committed synthetic template; Class 2 (machine-local) for real run records — per the domain scope document's evidence classes.
- **Record template**: `records/templates/synthetic-glossary-audit.template.md` (added by this capability).
- **Retention**: next-review + 30 days (records policy default).
- **Register wiring**: the synthetic-capability register row cites the latest audit record by date.

## Success / Verification Criteria

- **SC-001**: after one execution, exactly one class-2 execution record instantiated from the template exists, and the register row cites it.
- **SC-002**: the runbook names every step's executor and evidence output — no step lacks either.
- **SC-003**: a simulated missed window produces a deviation record per FR-002.

## Assumptions

- SYN-ST-900 and the synthetic glossary exist (see the FRAMEWORK-DEFINITION normative-standard fixture).
- The records policy and class definitions are unchanged.

## Ambiguities & Clarifications (Clarify Phase)

| ID    | Question / [NEEDS CLARIFICATION: ...] marker | Answer | Status (Open/Resolved) | Date |
|-------|----------------------------------------------|--------|------------------------|------|
| Q-001 | NEEDS CLARIFICATION: does an on-demand run reset the quarterly clock? | No — calendar quarters are fixed; on-demand runs are additional. | Resolved | 2026-07-25 |

## Review & Acceptance Checklist

### Content Quality

- [x] No runbook-authoring details (step text, record file structure — those belong in plan.md)
- [x] Focused on operational outcome, authority, and evidence
- [x] Written for the operators and approving authorities
- [x] All mandatory sections completed

### Requirement Completeness

- [x] No [NEEDS CLARIFICATION] markers remain in the spec body
- [x] Every row in the Ambiguities & Clarifications table has Status = Resolved
- [x] Every Operational Requirement is a testable MUST/MUST NOT statement
- [x] Evidence & Records binds every execution to an evidence class and record template
- [x] Every Success/Verification Criterion is checkable by reading files (file-native)
- [x] Scope and explicit exclusions are clearly bounded
- [x] Assumptions and dependencies identified

### Consistency

- [x] Spec conforms to the domain scope document (`../../../../constitution.md`)
- [x] Spec conforms to the global constitution (`../../../../../../.specify/memory/constitution.md`)
- [x] Domain instructions were consulted (`../../../../knowledge/instructions.md`)
- [x] Artifact class confirmed against the Execution-Evidence Test (ops owns the how/when)

---

*Next step: `plan.md` in this fixture folder (completed).*
