> SYNTHETIC EXAMPLE — completed for illustration only. Not a governed artifact; grants no authority; never cite as precedent or evidence.

# Authoring Plan: Synthetic Glossary Citation Standard (SYN-ST-900)

**Feature Directory**: `governance/framework/docs/specs/examples/normative-standard-fixture/` | **Date**: 2026-07-25 | **Spec**: [spec.md](./spec.md)

**Input**: Standard specification from this fixture folder.

## Summary

SYN-ST-900 requires every synthetic-glossary entry to cite its defining standard with a resolvable ID. Approach: author the standard text with four normative sections mapped 1:1 from FR-001..FR-004, then wire bidirectional citations between the standard and the glossary, validated file-natively.

## Design Context

**Artifact Class**: governance-definition — normative standard

**Affected Files**: `governance/framework/standards/synthetic-glossary-citation.md` (created); `governance/framework/knowledge/synthetic-glossary.md` (every entry gains a citation; header gains the governing sentinel)

**Dependent Standards / Registers / Skills**: none — the synthetic glossary is the only governed surface; no register schema changes.

**Storage**: Git-managed files (typical for this class) — per the reviewed storage decision, root Article II.

**Validation Mode**: `file-native`

**Grounding**: none: workspace-internal artifact — no external-source-dependent claims.

**Constraints**: citation format must not break existing glossary anchor links.

## Constitution Check

### Root Constitution Gate — `.specify/memory/constitution.md` (workspace root)

- Isolated Agent Scopes: PASS — every affected path is inside `governance/framework/`.
- Persistence Governance (Article II): PASS — Git-managed files; no datastore introduced.
- Authoritative-Source Grounding (Article IV): PASS — no external-source-dependent claims.
- Spec-First Lifecycle (Article V): PASS — this plan follows a completed, clarified spec.

### Domain Scope Constitution Gate — `governance/framework/constitution.md`

- Definitional-Artifact Test: PASS — a citation standard is a what/why definitional artifact.
- Root GLOBAL supremacy: PASS — nothing here touches the global tier.

**Initial Check (pre-research)**: PASS

**Post-Design Check (after Phase 1)**: PASS

## Domain Structure

### Documentation (this feature)

```text
governance/framework/docs/specs/examples/normative-standard-fixture/
├── spec.md              # Completed (fixture)
├── plan.md              # This file (fixture)
└── tasks.md             # Completed (fixture)
```

(`research.md`, `data-model.md`, `contracts/` omitted: no unknowns survived the clarify gate and the class needs no schemas — recorded here as the Phase 0/1 outcome.)

### Authored / Modified Artifacts (domain tree)

```text
governance/framework/
├── standards/synthetic-glossary-citation.md   # created (synthetic)
└── knowledge/synthetic-glossary.md            # modified (synthetic)
```

**Structure Decision**: the standard lands in `standards/` beside existing standards; the glossary stays in domain knowledge. Both are the established homes for their classes.

## Phase 0: Outline & Research

Both Q-rows were resolved in the spec's clarify table; no unknowns remained, so no `research.md` was produced (recorded decision, not an omission).

## Phase 1: Design (standard text outline & schemas)

Standard text outline: 1. Purpose & Scope (from Intent) — 2. Citation Form (FR-001) — 3. Resolution Rule (FR-002) — 4. Supersession Rule (FR-003) — 5. Governing-Sentinel Rule (FR-004) — 6. Conformance (CC-001..CC-003) — 7. Amendments. No register schemas or contracts needed for this class.

Cross-reference wiring: standard §5 cites the glossary path; glossary header cites `Governed by: SYN-ST-900`.

## Phase 2: Task Planning Approach

**Task Generation Strategy**: each CC-### becomes a Validation-First check task; the standard file and the glossary update each become Core Authoring tasks; the two citation directions become Integration tasks.

**Ordering Strategy**: Validation First → standard text → glossary conformance → cross-reference wiring → review.

**Estimated Output**: 10 numbered tasks in `tasks.md` (matches the completed fixture tasks.md).

## Complexity Tracking

No violations — table intentionally empty.

## Progress & Gate Tracking

**Phase Status**:

- [x] Phase 0: Research complete (no unknowns; decision recorded above)
- [x] Phase 1: Design complete (outline + wiring recorded above)
- [x] Phase 2: Task planning approach described (this plan only)

**Gate Status**:

- [x] Initial Constitution Check: PASS (root **and** domain scope documents)
- [x] Post-Design Constitution Check: PASS (root **and** domain scope documents)
- [x] All NEEDS CLARIFICATION resolved
- [x] Validation Mode declared (`file-native`)
- [x] Complexity deviations documented (none required)

---

*Gated by `.specify/memory/constitution.md` (workspace root) and `governance/framework/constitution.md`.*
