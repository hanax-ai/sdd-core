> SYNTHETIC EXAMPLE — completed for illustration only. Not a governed artifact; grants no authority; never cite as precedent or evidence.

# Implementation Plan: Synthetic Message-of-the-Day Library

**Feature Directory**: `[adopter-root]/docs/specs/examples/software-product-fixture/` | **Date**: 2026-07-25 | **Spec**: [spec.md](./spec.md)

**Input**: Feature specification from this fixture folder.

## Summary

A pure-function library mapping `(month, day)` pairs to a fixed message catalog, with an injected clock for the no-argument path. Test-runtime validation: the full test suite is written first and fails until the implementation lands.

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
├── research.md          # Completed (fixture) — Phase 0 output
├── data-model.md        # Completed (fixture) — Phase 1 output
├── contracts/
│   └── message-of-the-day-api.md   # Completed (fixture) — Phase 1 output
├── quickstart.md        # Completed (fixture) — Phase 1 output
└── tasks.md             # Completed (fixture)
```

### Source Code (project root)

```text
src/
├── motd/
│   ├── catalog.py       # MessageCatalog (fixed mapping)
│   └── api.py           # get_message(month, day), get_message_today(clock)

tests/
├── unit/
│   ├── test_catalog.py
│   └── test_api.py
└── integration/
    └── test_quickstart.py
```

**Structure Decision**: single-project library layout (Option 1); no frontend/backend split needed.

## Phase 0: Outline & Research

Single unknown (timezone) resolved at the clarify gate; the decisions, rationale, and rejected alternatives are recorded in [`research.md`](./research.md) (R-001 injected clock, R-002 catalog shape).

## Phase 1: Design & Contracts

- **data-model**: recorded in [`data-model.md`](./data-model.md) — `MessageCatalog` dict keyed by calendar day `(month, day)`, 366 entries incl. `(2, 29)`; application-supplied Clock value object.
- **contracts**: recorded in [`contracts/message-of-the-day-api.md`](./contracts/message-of-the-day-api.md) — `get_message(month, day) -> str` (raises `ValueError` on an invalid pair, FR-003); `get_message_today(clock) -> str` with the application-injected clock (FR-002). Contract test scenarios fail until implementation (tasks T004–T007).
- **quickstart**: recorded in [`quickstart.md`](./quickstart.md) — import, call with an explicit `(month, day)` pair, call with the injected clock; verified by the integration test.

## Phase 2: Task Planning Approach

**Task Generation Strategy**: base = `governance/framework/docs/specs/template-software/tasks.md`; each contract → a contract test task; the catalog entity → a model task; each user story → an integration test task; implementation tasks follow their failing tests.

**Ordering Strategy**: tests before implementation (TDD order); catalog before api; mark [P] for independent files.

**Estimated Output**: 12 numbered tasks (matches the completed fixture tasks.md).

## Complexity Tracking

No violations — table intentionally empty.

## Progress Tracking

**Phase Status**:

- [x] Phase 0: Research complete (`research.md` written)
- [x] Phase 1: Design complete (`data-model.md`, `contracts/`, `quickstart.md` written)
- [x] Phase 2: Task planning approach described (this plan only)

**Gate Status**:

- [x] Initial Constitution Check: PASS (root **and** project constitutions)
- [x] Post-Design Constitution Check: PASS (root **and** project constitutions)
- [x] All NEEDS CLARIFICATION resolved
- [x] Complexity deviations documented (none required)

---

*Gated by the root constitution and the owning product project's constitution — see the Constitution Check above.*
