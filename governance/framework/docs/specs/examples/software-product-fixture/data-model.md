> SYNTHETIC EXAMPLE — completed for illustration only. Not a governed artifact; grants no authority; never cite as precedent or evidence.

# Data Model: Synthetic Message-of-the-Day Library (Phase 1)

## Entity: MessageCatalog

| Field | Type | Rules |
|---|---|---|
| entries | dict[tuple[int, int], str] | keys are calendar days `(month, day)` — all 366 including `(2, 29)`; values non-empty plain-text messages |

- **Validation rules**: every calendar day present exactly once (366 keys incl. `(2, 29)`); every value non-empty, no user data, no external content (FR-004); a given calendar date returns the same message in every year (FR-001, R-002).
- **Relationships**: consumed read-only by the API functions; never mutated at runtime.
- **State transitions**: none — the catalog is immutable after module load.

## Value object: Clock (application-supplied)

| Field | Type | Rules |
|---|---|---|
| today() | () -> date | supplied by the APPLICATION, never by the end user and never read from system time inside the library (FR-002, R-001) |
