# Feature Specification: [FEATURE NAME]

**Feature Folder**: `[###-feature-name]` <!-- e.g., 001-user-onboarding -->

**Created**: [DATE]

**Status**: Draft <!-- Progression: Draft -> Clarified -> Ready for Planning -->

**Input**: Feature description: "[One- or two-sentence description of the feature as provided by the requester]"

## Execution Flow (agent instructions)

```
1. Start a new feature by COPYING this template folder:
   projects/<project>/docs/specs/template/  ->  projects/<project>/docs/specs/[###-feature-name]/
   (Use the next available zero-padded number, e.g., 001, 002, 003.)
2. Fill in the metadata block above (Feature Folder, Created, Input).
3. Read the governing context BEFORE writing any content:
   -> Project constitution: ../../../.specify/memory/constitution.md
   -> Project instructions: ../../../knowledge/instructions.md
   -> Global constitution: ../../../../../.specify/memory/constitution.md
4. Fill User Scenarios & Testing, Requirements, Key Entities, Success Criteria,
   and Assumptions from the feature description.
   -> Mark every uncertainty inline with [NEEDS CLARIFICATION: specific question].
5. Copy every [NEEDS CLARIFICATION] marker into the
   "Ambiguities & Clarifications (Clarify Phase)" table as a Q-### row (Status: Open).
6. Resolve each row with the requester or the project owner; record Answer,
   set Status to Resolved, add Date, and update the spec text it refers to.
7. When ALL rows are Resolved: set Status above to "Clarified".
8. Complete the Review & Acceptance Checklist. If any item fails: fix and repeat.
9. When the checklist passes AND all clarifications are Resolved:
   set Status to "Ready for Planning". Only then may plan.md be started.
10. This spec is complete when it describes WHAT and WHY without HOW.
```

---

## Quick Guidelines

- Focus on **WHAT** users need and **WHY**; avoid **HOW** to implement (no tech stack, APIs, code structure).
- Written for business stakeholders, not developers.
- Do not guess: any ambiguity MUST become a `[NEEDS CLARIFICATION: ...]` marker and a row in the Clarify table below.
- This workflow is file-and-agent only — no command-line tools or scripts are required at any step; agents read and write these Markdown files directly.

---

## User Scenarios & Testing *(mandatory)*

<!--
  IMPORTANT: User stories should be PRIORITIZED as user journeys ordered by importance.
  Each user story/journey must be INDEPENDENTLY TESTABLE - meaning if you implement just ONE of them,
  you should still have a viable MVP (Minimum Viable Product) that delivers value.

  Assign priorities (P1, P2, P3, etc.) to each story, where P1 is the most critical.
  Think of each story as a standalone slice of functionality that can be:
  - Developed independently
  - Tested independently
  - Deployed independently
  - Demonstrated to users independently
-->

### User Story 1 - [Brief Title] (Priority: P1)

[Describe this user journey in plain language]

**Why this priority**: [Explain the value and why it has this priority level]

**Independent Test**: [Describe how this can be tested independently - e.g., "Can be fully tested by [specific action] and delivers [specific value]"]

**Acceptance Scenarios**:

1. **Given** [initial state], **When** [action], **Then** [expected outcome]
2. **Given** [initial state], **When** [action], **Then** [expected outcome]

---

### User Story 2 - [Brief Title] (Priority: P2)

[Describe this user journey in plain language]

**Why this priority**: [Explain the value and why it has this priority level]

**Independent Test**: [Describe how this can be tested independently]

**Acceptance Scenarios**:

1. **Given** [initial state], **When** [action], **Then** [expected outcome]

---

### User Story 3 - [Brief Title] (Priority: P3)

[Describe this user journey in plain language]

**Why this priority**: [Explain the value and why it has this priority level]

**Independent Test**: [Describe how this can be tested independently]

**Acceptance Scenarios**:

1. **Given** [initial state], **When** [action], **Then** [expected outcome]

---

[Add more user stories as needed, each with an assigned priority]

### Edge Cases

<!--
  ACTION REQUIRED: The content in this section represents placeholders.
  Fill them out with the right edge cases.
-->

- What happens when [boundary condition]?
- How does system handle [error scenario]?

## Requirements *(mandatory)*

<!--
  ACTION REQUIRED: The content in this section represents placeholders.
  Fill them out with the right functional requirements.
-->

### Functional Requirements

- **FR-001**: System MUST [specific capability, e.g., "allow users to create accounts"]
- **FR-002**: System MUST [specific capability, e.g., "validate email addresses"]
- **FR-003**: Users MUST be able to [key interaction, e.g., "reset their password"]
- **FR-004**: System MUST [data requirement, e.g., "persist user preferences"]
- **FR-005**: System MUST [behavior, e.g., "log all security events"]

*Example of marking unclear requirements (each marker MUST also appear as a Q-### row in the Clarify table below):*

- **FR-006**: System MUST authenticate users via [NEEDS CLARIFICATION: auth method not specified - email/password, SSO, OAuth?]
- **FR-007**: System MUST retain user data for [NEEDS CLARIFICATION: retention period not specified]

### Key Entities *(include if feature involves data)*

- **[Entity 1]**: [What it represents, key attributes without implementation]
- **[Entity 2]**: [What it represents, relationships to other entities]

## Success Criteria *(mandatory)*

<!--
  ACTION REQUIRED: Define measurable success criteria.
  These must be technology-agnostic and measurable.
-->

### Measurable Outcomes

- **SC-001**: [Measurable metric, e.g., "Users can complete account creation in under 2 minutes"]
- **SC-002**: [Measurable metric, e.g., "System handles 1000 concurrent users without degradation"]
- **SC-003**: [User satisfaction metric, e.g., "90% of users successfully complete primary task on first attempt"]
- **SC-004**: [Business metric, e.g., "Reduce support tickets related to [X] by 50%"]

## Assumptions

<!--
  ACTION REQUIRED: The content in this section represents placeholders.
  Fill them out with the right assumptions based on reasonable defaults
  chosen when the feature description did not specify certain details.
-->

- [Assumption about target users, e.g., "Users have stable internet connectivity"]
- [Assumption about scope boundaries, e.g., "Mobile support is out of scope for v1"]
- [Assumption about data/environment, e.g., "Existing authentication system will be reused"]
- [Dependency on existing system/service, e.g., "Requires access to an existing user profile capability"]

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
| Q-001 | [e.g., NEEDS CLARIFICATION: auth method not specified - email/password, SSO, OAuth?] | [Answer or blank while Open] | Open | [DATE] |
| Q-002 | [Question text] | [Answer] | Open | [DATE] |

## Review & Acceptance Checklist

<!--
  GATE: The authoring agent completes this checklist before marking the spec
  "Ready for Planning". Check items only when genuinely true.
-->

### Content Quality

- [ ] No implementation details (languages, frameworks, APIs, code structure)
- [ ] Focused on user value and business needs
- [ ] Written for non-technical stakeholders
- [ ] All mandatory sections completed

### Requirement Completeness

- [ ] No [NEEDS CLARIFICATION] markers remain in the spec body
- [ ] Every row in the Ambiguities & Clarifications table has Status = Resolved
- [ ] Requirements are testable and unambiguous
- [ ] Success criteria are measurable and technology-agnostic
- [ ] Scope is clearly bounded
- [ ] Assumptions and dependencies identified

### Consistency

- [ ] Spec conforms to the project constitution (`../../../.specify/memory/constitution.md`)
- [ ] Spec conforms to the global constitution (`../../../../../.specify/memory/constitution.md`)
- [ ] Project instructions were consulted (`../../../knowledge/instructions.md`)

---

*Next step (after Status = Ready for Planning): fill in `plan.md` in this feature folder, then `tasks.md`.*
