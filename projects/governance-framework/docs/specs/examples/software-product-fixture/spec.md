> SYNTHETIC EXAMPLE — completed for illustration only. Not a governed artifact; grants no authority; never cite as precedent or evidence.

# Feature Specification: Synthetic Message-of-the-Day Library

**Feature Folder**: `examples/software-product-fixture` (fixture — outside numbered feature folders)

**Created**: 2026-07-25

**Status**: Ready for Planning

**Input**: Feature description: "A tiny library that returns a deterministic message of the day for a given date, so demo applications can show stable, testable greeting text."

## User Scenarios & Testing

### User Story 1 - Deterministic message per date (Priority: P1)

A demo-application developer calls the library with a date and always receives the same message for that date.

**Why this priority**: determinism is the product — without it nothing else matters.

**Independent Test**: call the function twice with the same date; assert identical output.

**Acceptance Scenarios**:

1. **Given** the date 2026-01-01, **When** the developer requests the message, **Then** the same string is returned on every call.
2. **Given** two different dates, **When** messages are requested, **Then** the messages may differ but each is stable for its date.

### User Story 2 - Friendly default for missing date (Priority: P2)

A developer calling without a date receives the message for the current day rather than an error.

**Why this priority**: convenience path; builds on P1.

**Independent Test**: call without arguments; assert a non-empty string is returned.

**Acceptance Scenarios**:

1. **Given** no date argument, **When** the message is requested, **Then** the current-day message is returned.

### Edge Cases

- Invalid date input returns a clear error, never a silent fallback message.
- Leap-day (Feb 29) has its own stable message.

## Requirements

### Functional Requirements

- **FR-001**: The library MUST return a deterministic message for any valid date.
- **FR-002**: The library MUST return the current-day message when no date is supplied.
- **FR-003**: The library MUST reject invalid dates with a descriptive error.
- **FR-004**: Messages MUST be plain text with no user data or external content.

### Key Entities

- **MessageCatalog**: the fixed mapping from day-of-year to message text; no external storage.

## Success Criteria

### Measurable Outcomes

- **SC-001**: 100% of repeated same-date calls return byte-identical messages in the test suite.
- **SC-002**: Invalid-date inputs produce the documented error in 100% of test cases.
- **SC-003**: A demo developer integrates the library by reading only its README quickstart.

## Assumptions

- Synthetic demo context only; no localization, no persistence, no network.
- Host application supplies its own clock for "current day" (injected, testable).

## Ambiguities & Clarifications (Clarify Phase)

| ID    | Question / [NEEDS CLARIFICATION: ...] marker | Answer | Status (Open/Resolved) | Date |
|-------|----------------------------------------------|--------|------------------------|------|
| Q-001 | NEEDS CLARIFICATION: timezone for "current day"? | The injected clock's local date; the library never reads system time directly. | Resolved | 2026-07-25 |

## Review & Acceptance Checklist

### Content Quality

- [x] No implementation details (languages, frameworks, APIs, code structure)
- [x] Focused on user value and business needs
- [x] Written for non-technical stakeholders
- [x] All mandatory sections completed

### Requirement Completeness

- [x] No [NEEDS CLARIFICATION] markers remain in the spec body
- [x] Every row in the Ambiguities & Clarifications table has Status = Resolved
- [x] Requirements are testable and unambiguous
- [x] Success criteria are measurable and technology-agnostic
- [x] Scope is clearly bounded
- [x] Assumptions and dependencies identified

### Consistency

- [x] Spec conforms to the project constitution (`../../../.specify/memory/constitution.md`)
- [x] Spec conforms to the global constitution (`../../../../../.specify/memory/constitution.md`)
- [x] Project instructions were consulted (`../../../knowledge/instructions.md`)

---

*Next step: `plan.md` in this fixture folder (completed).*
