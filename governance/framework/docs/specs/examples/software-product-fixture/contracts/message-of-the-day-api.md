> SYNTHETIC EXAMPLE — completed for illustration only. Not a governed artifact; grants no authority; never cite as precedent or evidence.

# Contract: Message-of-the-Day API (Phase 1)

## `get_message(date) -> str`

- **Input**: a valid calendar date.
- **Output**: the catalog message for that date's day-of-year; byte-identical on every call with the same date (FR-001).
- **Errors**: invalid date → `ValueError` with a descriptive message (FR-003); never a silent fallback.

**Contract test scenario** (fails until implemented): calling twice with 2026-01-01 returns identical strings; calling with an invalid date raises `ValueError` naming the input.

## `get_message_today(clock) -> str`

- **Input**: an application-injected clock exposing `today() -> date`; the clock is a REQUIRED application-level input — end users supply no date, and the library never reads system time (FR-002).
- **Output**: `get_message(clock.today())`.
- **Errors**: propagates `get_message` errors; a clock returning an invalid date raises the same `ValueError`.

**Contract test scenario** (fails until implemented): with a fixed clock pinned to the ISO date 2026-03-01, the returned string equals `get_message(date(2026, 3, 1))`.
