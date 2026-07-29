# Governance-Ops — Domain Playbook

Domain-local operating instructions for agents working inside
`governance/operations/` (the workspace governance operational layer).
This file supplements — never replaces — the global playbook at
[`../../../knowledge/instructions.md`](../../../knowledge/instructions.md) and
the constitutions listed in [Section 3](#3-token-boundary-handling). This file
may refine guidance within the domain but never overrides GLOBAL authority; a
conflict is a stop condition and the GLOBAL source prevails.

---

## 1. Runbook & Cadence Register

The canonical index of operational artifacts this internal domain owns. Every runbook,
checklist, cadence, or workflow MUST have a row the moment it is created, and
every row MUST cite the FRAMEWORK-DEFINITION standard it operationalizes
(constitution Article III).

> No live entries yet — this internal domain's operational artifacts arrive through its
> first features (see `README.md`: `runbooks/` and `records/` are created
> spec-first, not pre-scaffolded).

| ID | Activity | Kind | Cadence | Operationalizes (framework citation) | Artifact Path | Status |
|----|----------|------|---------|--------------------------------------|---------------|--------|
| OP-0NN |  | runbook \| checklist \| cadence \| workflow \| dashboard |  |  |  | draft \| active \| retired |

Statuses move forward only (`draft` → `active` → `retired`); retired rows keep
their entry and name their replacement (if any) in the Activity cell.

## 2. Record Conventions

Shapes for control-execution evidence (constitution Article III):

- **Dated and append-oriented:** records carry their execution date; corrections
  append or supersede — never silently rewrite an execution record.
- **Traceable (one-way dependency contract):** every record identifies what it
  implements with at least: control ID; policy/standard version; effective
  date; execution date; responsible ROLE (never personal data beyond public
  maintainer roles); result; evidence location; exception or remediation
  status.
- **Alias-only:** no credentials, hostnames, tenant identifiers, or customer
  data — environment aliases only, per the root Endpoint Discipline controls.
- **Classed (public repo):** committed content = templates and synthetic
  examples ONLY. Real evidence is machine-local (git-ignored,
  retention-governed) or lives in an approved external system of record cited
  by safe reference. Never commit real evidence without explicit maintainer
  approval plus a secrets/identity scan. Operational policy, the
  safe-reference format, and the class-2 retention default live in
  [`../records/README.md`](../records/README.md); class-1 templates in
  [`../records/templates/`](../records/templates/).
- **Homed correctly:** the evidence policy home is `../records/` (system
  capabilities still arrive spec-first). Workspace conversation records,
  brainstorms, and the tooling-audit Install Registry stay at their
  root/machine homes (constitution Article II boundary table) — never
  duplicated here.

---

## 3. Token Boundary Handling

Context budgeting rules for all agents operating in this internal domain.

**Prescribed load order** — the canonical five-step CONTEXT-LOADING order established
in the workspace [`README.md`](../../../README.md), restated here verbatim (stop as soon
as the task is fully specified). This playbook itself IS canonical step 4 (the domain
registry/playbook file), so it is not listed twice:

1. **Root constitution** — [`../../../.specify/memory/constitution.md`](../../../.specify/memory/constitution.md)
2. **Root mirror registry** — [`../../../knowledge/instructions.md`](../../../knowledge/instructions.md)
3. **Domain scope constitution** — [`../constitution.md`](../constitution.md)
4. **Domain grounding registry** — this playbook (`governance/operations/knowledge/instructions.md`)
5. **Active feature folder** — `../docs/specs/<NNN-feature-name>/` (`spec.md`, and its
   `plan.md` / `tasks.md` only when working those stages)

**Hard rules:**

- **Never load an entire mirrored repository** (global
  [`../../../reference/repos/`](../../../reference/repos/) or domain-local
  [`../reference/`](../reference/) mirrors). Navigate via manifests and
  registry scope notes; load individual files only.
- **Summarize-then-cite:** for any document exceeding ~400 lines, produce a
  short summary with precise citations (file + heading) and work from the
  summary — do not carry the full text forward in context. Long reference
  documents follow the slicing regime defined in the FRAMEWORK-DEFINITION
  playbook ([Section 2 there](../../framework/knowledge/instructions.md));
  the same rules apply to material under this internal domain's `../reference/`.
- **Write findings back:** when a distilled finding will recur, record it in
  this playbook (typically as a register row in Section 1 or a note in
  Section 2) so future agents inherit it without re-reading the source.

---

## 4. Domain-local Mirror Refinements

Registry of **domain-specific mirrors** stored under
[`../reference/`](../reference/). Columns are identical to the global mirror
registry in [`../../../knowledge/instructions.md`](../../../knowledge/instructions.md).
Every domain-local mirror MUST be registered here before agents may cite it.

> **Precedence:** resolve the GLOBAL registry first, then this domain table.
> Domain entries may refine domain-local use but never replace or contradict a
> GLOBAL identity, pin, digest, or authority rule. Any conflict is a stop
> condition.

> No local mirrors are registered yet. Source systems are identified by
> **environment alias only** — hostnames and tenant identifiers MUST NOT
> appear in this file.

| Framework | Local Mirror Path | Upstream URL | Pinned Version/Commit | Notes |
|-----------|-------------------|--------------|-----------------------|-------|
| `<mirror-name>` | `../reference/<mirror-name>/` | `<upstream-url-or-source-system>` | `<commit-hash, tag, or export date/version>` | `<what agents may cite; entry-point files to read first; last-verified date>` |
