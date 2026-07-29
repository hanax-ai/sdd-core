> SYNTHETIC EXAMPLE — completed for illustration only. Not a governed artifact; grants no authority; never cite as precedent or evidence.

# Research: Synthetic Message-of-the-Day Library (Phase 0)

**Input**: Design Context unknowns from [plan.md](./plan.md) | **Date**: 2026-07-25

## R-001 — "Current day" source (from spec Q-001)

- **Decision**: pure functions plus an application-injected clock; the library never reads system time.
- **Rationale**: determinism is FR-001's core guarantee; an injected clock makes FR-002 testable with a fixed date and keeps every test byte-reproducible (SC-001).
- **Alternatives considered**: reading system time directly (rejected: untestable, breaks determinism under test); an optional clock defaulting to system time (rejected: hides a nondeterministic path behind a convenience default).

## R-002 — Catalog storage shape

- **Decision**: in-memory fixed dictionary keyed by calendar day `(month, day)` → message, 366 entries with an explicit `(2, 29)` entry — the same calendar date maps to the same message in every year, leap or not.
- **Rationale**: no datastore is introduced (root Article II: reviewed storage decision = N/A); lookup stays under the 1 ms performance goal; `(month, day)` keying avoids the day-of-year shift that would give one calendar date different messages in leap versus non-leap years.
- **Alternatives considered**: day-of-year keying (rejected: dates after February shift by one in leap years, breaking FR-001 determinism across years); external JSON catalog file (rejected: adds a load path and a mutable surface for no benefit at this size).

**Output**: all NEEDS CLARIFICATION items resolved; Phase 1 design may begin.
