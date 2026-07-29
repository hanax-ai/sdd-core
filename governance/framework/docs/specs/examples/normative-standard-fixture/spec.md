> SYNTHETIC EXAMPLE — completed for illustration only. Not a governed artifact; grants no authority; never cite as precedent or evidence.

# Standard Specification: Synthetic Glossary Citation Standard (SYN-ST-900)

**Feature Folder**: `examples/normative-standard-fixture` (fixture — outside numbered feature folders)

**Created**: 2026-07-25

**Status**: Ready for Planning

**Artifact Class**: governance-definition (normative standard)

**Input**: Description: "Every entry in the synthetic project glossary must cite the standard that defines its term, so glossary text cannot drift from its defining standards."

## Intent & Scope

**Intent (WHAT and WHY)**: Establish SYN-ST-900, requiring every synthetic-glossary entry to carry a resolvable citation to its defining standard, so a reader can always trace a term to the text that defines it and drift is mechanically detectable.

**In scope**: The synthetic glossary file and every standard that defines a glossary term.

**Explicit exclusions (OUT of scope)**:

- Informal term usage in conversation records — records are narrative, not governed definitional surfaces.
- Machine-local notes and scratch files.

## Governed Audience & Affected Surfaces

**Who must conform**: any agent or contributor editing the synthetic glossary; reviewers approving glossary changes.

**Affected surfaces**:

| Surface | Effect |
|---------|--------|
| `standards/synthetic-glossary-citation.md` | created (the standard itself) |
| `knowledge/synthetic-glossary.md` | must newly conform (every entry gains a citation) |

## Normative Requirements

- **FR-001**: Every glossary entry MUST end with a citation of the form `(defined by: <standard-ID> §<section>)`.
- **FR-002**: Every cited standard ID MUST resolve to an existing standard file in `standards/`.
- **FR-003**: A glossary entry whose defining standard is superseded MUST be updated in the same change that supersedes the standard.
- **FR-004**: The glossary header MUST cite SYN-ST-900 as its governing standard.

## Conformance Criteria

- **CC-001**: grep for `(defined by:` over the glossary returns one hit per entry (entry count = citation count).
- **CC-002**: Every cited standard ID resolves to a file in `standards/` (manual cross-check by reviewer).
- **CC-003**: The glossary header contains the sentinel `Governed by: SYN-ST-900`.

## Assumptions

- The synthetic glossary exists and has one entry per term, one term per line block.
- Standard IDs follow the existing `SYN-ST-###` convention.

## Ambiguities & Clarifications (Clarify Phase)

| ID    | Question / [NEEDS CLARIFICATION: ...] marker | Answer | Status (Open/Resolved) | Date |
|-------|----------------------------------------------|--------|------------------------|------|
| Q-001 | NEEDS CLARIFICATION: do multi-standard terms cite all defining standards or the primary one? | All defining standards, primary first. | Resolved | 2026-07-25 |
| Q-002 | NEEDS CLARIFICATION: does the rule apply to deprecated terms kept for history? | Yes — deprecated entries cite the superseding standard instead. | Resolved | 2026-07-25 |

## Review & Acceptance Checklist

### Content Quality

- [x] No authoring/integration details (artifact file structure, wiring order — those belong in plan.md)
- [x] Focused on what conformance means and why the standard exists
- [x] Written for the governed audience, not only the authors
- [x] All mandatory sections completed

### Requirement Completeness

- [x] No [NEEDS CLARIFICATION] markers remain in the spec body
- [x] Every row in the Ambiguities & Clarifications table has Status = Resolved
- [x] Every Normative Requirement is a testable MUST/MUST NOT statement
- [x] Every Conformance Criterion is checkable by reading files (file-native)
- [x] Scope and explicit exclusions are clearly bounded
- [x] Assumptions and dependencies identified

### Consistency

- [x] Spec conforms to the domain scope document (`../../../../constitution.md`)
- [x] Spec conforms to the global constitution (`../../../../../../.specify/memory/constitution.md`)
- [x] Project instructions were consulted (`../../../../knowledge/instructions.md`)
- [x] Artifact class confirmed against the Definitional-Artifact Test (framework owns the what/why)

---

*Next step: `plan.md` in this fixture folder (completed).*
