> SYNTHETIC EXAMPLE — completed for illustration only. Not a governed artifact; grants no authority; never cite as precedent or evidence.

# Research: Synthetic Quarterly Glossary-Audit Cadence (Phase 0)

**Input**: Design Context unknowns from [plan.md](./plan.md) | **Date**: 2026-07-25

## R-001 — Does an on-demand run reset the quarterly clock? (from spec Q-001)

- **Decision**: no — calendar quarters are fixed; on-demand runs are additional executions that never move the quarterly window.
- **Rationale**: predictable audit windows make missed-window detection mechanical (FR-002) and keep the register's cadence column meaningful.
- **Alternatives considered**: rolling window measured from the last run (rejected: each on-demand run silently stretches the cadence, so drift detection degrades exactly when activity is highest); dual-clock hybrid (rejected: two overlapping windows complicate deviation records for no operational gain).

**Output**: all NEEDS CLARIFICATION items resolved; Phase 1 design may begin.
