> SYNTHETIC EXAMPLE — completed for illustration only. Not a governed artifact; grants no authority; never cite as precedent or evidence.

# Research: Synthetic Message-of-the-Day Library (Phase 0)

**Input**: Design Context unknowns from [plan.md](./plan.md) | **Date**: 2026-07-25

## R-001 — "Current day" source (from spec Q-001)

- **Decision**: pure functions plus an application-injected clock; the library never reads system time.
- **Rationale**: determinism is FR-001's core guarantee; an injected clock makes FR-002 testable with a fixed date and keeps every test byte-reproducible (SC-001).
- **Alternatives considered**: reading system time directly (rejected: untestable, breaks determinism under test); an optional clock defaulting to system time (rejected: hides a nondeterministic path behind a convenience default).

## R-002 — Catalog storage shape

- **Decision**: in-memory fixed dictionary, day-of-year → message, 366 entries with an explicit leap-day entry.
- **Rationale**: no datastore is introduced (root Article II: reviewed storage decision = N/A); lookup stays under the 1 ms performance goal.
- **Alternatives considered**: external JSON catalog file (rejected: adds a load path and a mutable surface for no benefit at this size).

**Output**: all NEEDS CLARIFICATION items resolved; Phase 1 design may begin.
