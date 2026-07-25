> SYNTHETIC EXAMPLE — completed for illustration only. Not a governed artifact; grants no authority; never cite as precedent or evidence.

# Implementation Plan: Synthetic Message-of-the-Day Library

**Feature Directory**: `projects/[synthetic-product]/docs/specs/examples/software-product-fixture/` | **Date**: 2026-07-25 | **Spec**: [spec.md](./spec.md)

**Input**: Feature specification from this fixture folder.

## Summary

A pure-function library mapping dates to a fixed message catalog, with an injected clock for the no-argument path. Test-runtime validation: the full test suite is written first and fails until the implementation lands.

## Technical Context

**Language/Version**: Python 3.11 (synthetic choice for illustration)

**Primary Dependencies**: none — standard library only (grounding-registry check consulted; no external framework, so no registered grounding source required)

**Storage**: N/A — in-memory fixed catalog; per the reviewed storage decision (root Article II), no datastore is introduced

**Validation Mode**: `test-runtime` <!-- pinned by the software/product template: classic TDD — tests are written and fail before the implementation they cover -->

**Testing**: pytest (synthetic choice)

**Target Platform**: any Python 3.11 host (library)

**Project Type**: library

**Performance Goals**: message lookup under 1 ms (in-memory dictionary access)

**Constraints**: deterministic output; no system-clock reads; no network; no user data

**Scale/Scope**: 366 catalog entries; 2 public functions

## Constitution Check

### Root Constitution Gate — `.specify/memory/constitution.md` (workspace root)

- Isolated Agent Scopes: PASS — all paths inside the owning synthetic project tree.
- Persistence Governance (Article II): PASS — no datastore; storage decision recorded above.
- Authoritative-Source Grounding (Article IV): PASS — standard-library only; no external-framework claims.
- Spec-First Lifecycle (Article V): PASS — plan follows the completed, clarified spec.

### Project Constitution Gate — (synthetic product project)

- PASS — fixture illustrates the gate; a real product project lists its own principles here.

**Initial Check (pre-research)**: PASS

**Post-Design Check (after Phase 1)**: PASS

## Project Structure

### Documentation (this feature)

```text
examples/software-product-fixture/
├── spec.md              # Completed (fixture)
├── plan.md              # This file (fixture)
└── tasks.md             # Completed (fixture)
```

(`research.md`, `data-model.md`, `contracts/`, `quickstart.md` summarized inline: one unknown resolved in the clarify table; entities and contracts small enough to record here for a fixture.)

### Source Code (project root)

```text
src/
├── motd/
│   ├── catalog.py       # MessageCatalog (fixed mapping)
│   └── api.py           # get_message(date), get_message_today(clock)

tests/
├── unit/
│   ├── test_catalog.py
│   └── test_api.py
└── integration/
    └── test_quickstart.py
```

**Structure Decision**: single-project library layout (Option 1); no frontend/backend split needed.

## Phase 0: Outline & Research

Single unknown (timezone) resolved at the clarify gate: injected clock, no system time. **Decision**: pure functions + injected clock. **Rationale**: determinism and testability. **Alternatives considered**: reading system time (rejected: untestable, violates FR-001 determinism guarantees under test).

## Phase 1: Design & Contracts

- **data-model**: `MessageCatalog` = dict[day-of-year → str], 366 entries, leap-day explicit (FR edge case).
- **contracts**: `get_message(date) -> str` (raises `ValueError` on invalid date, FR-003); `get_message_today(clock) -> str` (FR-002). Contract test scenarios recorded in tasks T004–T007 and failing until implementation.
- **quickstart**: import, call with a date, call with a clock — three lines, verified by the integration test.

## Phase 2: Task Planning Approach

**Task Generation Strategy**: base = `projects/governance-framework/docs/specs/template-software/tasks.md`; each contract → a contract test task; the catalog entity → a model task; each user story → an integration test task; implementation tasks follow their failing tests.

**Ordering Strategy**: tests before implementation (TDD order); catalog before api; mark [P] for independent files.

**Estimated Output**: 12 numbered tasks (matches the completed fixture tasks.md).

## Complexity Tracking

No violations — table intentionally empty.

## Progress Tracking

**Phase Status**:

- [x] Phase 0: Research complete (recorded inline)
- [x] Phase 1: Design complete (recorded inline)
- [x] Phase 2: Task planning approach described (this plan only)

**Gate Status**:

- [x] Initial Constitution Check: PASS (root **and** project constitutions)
- [x] Post-Design Constitution Check: PASS (root **and** project constitutions)
- [x] All NEEDS CLARIFICATION resolved
- [x] Complexity deviations documented (none required)

---

*Gated by the root constitution and the owning product project's constitution — see the Constitution Check above.*
