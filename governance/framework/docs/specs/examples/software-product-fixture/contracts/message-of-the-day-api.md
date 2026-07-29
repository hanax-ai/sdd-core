> SYNTHETIC EXAMPLE — completed for illustration only. Not a governed artifact; grants no authority; never cite as precedent or evidence.

# Contract: Message-of-the-Day API (Phase 1)

## `get_message(month, day) -> str`

- **Input**: integer `month` and `day` forming a valid calendar day.
- **Output**: the catalog message for `(month, day)`; byte-identical on every call with the same pair (FR-001).
- **Errors**: invalid month/day pair → `ValueError` with a descriptive message (FR-003); never a silent fallback.

**Contract test scenario** (fails until implemented): calling twice with
`(1, 1)` returns identical strings; calling with an invalid month/day pair
raises `ValueError` naming the input.

## `get_message_today(clock) -> str`

- **Input**: an application-injected clock exposing `today() -> date`; the clock is a REQUIRED application-level input — end users supply no calendar day, and the library never reads system time (FR-002).
- **Output**: `get_message(clock.today().month, clock.today().day)`.
- **Errors**: propagates `get_message` errors; a clock returning an invalid calendar day raises the same `ValueError`.

**Contract test scenario** (fails until implemented): with a fixed clock pinned
to the ISO date 2026-03-01, the returned string equals `get_message(3, 1)`.
