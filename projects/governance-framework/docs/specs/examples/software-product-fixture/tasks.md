> SYNTHETIC EXAMPLE — completed for illustration only. Not a governed artifact; grants no authority; never cite as precedent or evidence.

# Tasks: Synthetic Message-of-the-Day Library

**Branch / Folder**: `examples/software-product-fixture` | **Date**: 2026-07-25
**Input**: Design documents from this fixture folder
**Prerequisites**: `spec.md` (completed), `plan.md` (completed)
**Validation Mode** (inherited from plan.md): `test-runtime` — classic TDD; tests are written and fail before the implementation they cover

## Phase 3.1: Setup

- [x] T001 Create library structure per plan.md — `src/motd/`, `tests/unit/`, `tests/integration/`
- [x] T002 Initialize pytest configuration — `pyproject.toml`
- [x] T003 Add lint configuration — `pyproject.toml` (same file as T002: sequential)

## Phase 3.2: Tests First (TDD) ⚠️ MUST COMPLETE BEFORE 3.3

**CRITICAL: These tests MUST be written and MUST FAIL before ANY implementation**

- [x] T004 Contract test: `get_message` deterministic per date (FR-001) — `tests/unit/test_api.py` *(written; failed as required before T008)*
- [x] T005 Contract test: invalid date raises descriptive error (FR-003) — `tests/unit/test_api.py::test_invalid` *(failed before implementation; same file as T004: sequential)*
- [x] T006 Contract test: injected-clock current-day path (FR-002) — `tests/unit/test_api.py::test_today` *(failed before implementation; same file as T004: sequential)*
- [x] T007 [P] Integration test: quickstart walkthrough (SC-003) — `tests/integration/test_quickstart.py` *(failed before implementation)*

## Phase 3.3: Core Implementation (ONLY after tests are failing)

- [x] T008 MessageCatalog with 366 entries incl. leap day — `src/motd/catalog.py` (blocks T009–T010: sequential)
- [x] T009 `get_message(date)` with validation — `src/motd/api.py`
- [x] T010 `get_message_today(clock)` — `src/motd/api.py`

## Phase 3.4: Integration

- [x] T011 Wire quickstart example to the public API; README quickstart section — `README.md`

## Phase 3.5: Polish

- [x] T012 Edge-case unit tests (leap day, year boundaries); full suite green — `tests/unit/test_catalog.py` (depends on the completed implementation: sequential)

---

## Dependencies

- Setup (T001–T003) before everything else
- Tests (T004–T007) before implementation (T008–T010); each was observed FAILING first; T004–T006 share `test_api.py` and run sequentially ([P] only on T007, a distinct file)
- Catalog (T008) blocks api (T009–T010); implementation before integration (T011); everything before polish (T012)

## Notes

- Test-runtime evidence: suite run recorded red (4 failures) after T004–T007, green (12 passed) after T012.
- No external frameworks — grounding-registry check consulted; no registered source required (root Article IV).

## Validation Checklist

- [x] Every requirement in spec.md is covered by at least one task
- [x] Every entity in spec.md has a model/creation task
- [x] All tests come before their corresponding implementation tasks
- [x] Every task cites at least one exact repository file path
- [x] Every cited path is inside the owning project tree (Scope Rule satisfied)
- [x] No [P] task modifies the same file as another [P] task (T003–T006 made sequential for this reason)
- [x] Parallel [P] tasks are truly independent (no hidden ordering)
- [x] Dependencies section reflects all ordering constraints
- [x] Validation Mode is `test-runtime` and honored — every test task was written and failing before the implementation task it covers
