# Hana-X-Subsystem — Project Playbook

Project-local operating instructions for agents working inside
`projects/project-a/` (Hana-X-Subsystem: SAP S/4 HANA endpoint integration).
This file supplements — never replaces — the global playbook at
[`../../../knowledge/instructions.md`](../../../knowledge/instructions.md) and
the constitutions listed in [Section 3](#3-token-boundary-handling). Where this
file and the global playbook conflict on project-scoped matters, this file
wins.

---

## 1. Subsystem Edge Case Register

Known edge cases at the SAP S/4 HANA boundary. Every entry MUST link to the
feature spec under [`../docs/specs/`](../docs/specs/) that owns its handling
rule. Add a row the moment an edge case is discovered — even before a handling
rule exists (use `TBD` and file it in the next spec revision).

> The `EC-001` row below is an **illustrative example** — its Linked Spec cell
> uses the placeholder feature folder `001-feature-name/`, which does not exist
> until a real feature is provisioned. Replace it with your first live entry.

| ID | Scenario | Affected Endpoint/Interface | Detection | Handling Rule | Linked Spec |
|----|----------|-----------------------------|-----------|---------------|-------------|
| EC-001 | OData `$batch` request returns partial failure wrapped in an HTTP 200 envelope; some changesets succeeded, others carry per-part 4xx/5xx status codes | `POST /sap/opu/odata/sap/API_SALES_ORDER_SRV/$batch` | Parse every `multipart/mixed` sub-response; treat any part with status >= 400 as a failure regardless of the outer 200 | Roll back or compensate the succeeded changesets in the same logical unit; never report overall success unless all parts are 2xx; log failed part IDs for replay | `../docs/specs/001-feature-name/spec.md` (placeholder) |

**Template row (copy, fill, append above):**

| ID | Scenario | Affected Endpoint/Interface | Detection | Handling Rule | Linked Spec |
|----|----------|-----------------------------|-----------|---------------|-------------|
| EC-0NN |  |  |  |  |  |

---

## 2. File Slicing Constraints for Long Reference Documents

Oversized reference material (SAP schema/metadata exports, API contract dumps,
integration guides) stored under [`../reference/`](../reference/) MUST be split
into ordered slices before agents may consume it.

> These slicing rules are operationalized by the `mirror-sync` skill
> ([`../.claude/skills/mirror-sync/SKILL.md`](../.claude/skills/mirror-sync/SKILL.md)),
> whose validation gates (d)/(e) stop work on a sliced document with a missing
> `_index.md` or a manifest listing nonexistent slices. The skill is an
> implementation aid — this section remains the normative slicing regime.

**Rules:**

1. **Naming convention:** slices are named `<doc-name>.part-NN.md` with
   zero-padded, ordered numbering (`part-01`, `part-02`, ...).
2. **Hard cap:** roughly **400 lines (~4,000 tokens) per slice**. Split at a
   natural boundary (entity set, section heading) at or before the cap — never
   mid-table or mid-definition.
3. **Mandatory manifest:** every sliced document gets an `_index.md` manifest
   in the same directory listing **every** slice with a one-line scope note.
4. **Manifest-first reading:** agents MUST read `_index.md` first and load
   **only** the slices relevant to the task at hand — never the full slice set
   by default.

**Illustrative example** — `../reference/sap-odata-metadata/_index.md` for a
sliced SAP OData `$metadata` export:

```markdown
# Manifest: sap-odata-metadata (sliced document)

Source: API_SALES_ORDER_SRV $metadata export, retrieved 2026-07-10.

| Slice | Scope |
|-------|-------|
| sap-odata-metadata.part-01.md | Entity types: SalesOrder header — keys, fields, annotations |
| sap-odata-metadata.part-02.md | Entity types: SalesOrderItem and schedule lines |
| sap-odata-metadata.part-03.md | Navigation properties and association sets |
| sap-odata-metadata.part-04.md | Function imports, deep-insert payload shapes |
```

**Template manifest (copy into the sliced document's directory as `_index.md`):**

```markdown
# Manifest: <doc-name> (sliced document)

Source: <origin, retrieval date, version/commit if applicable>.

| Slice | Scope |
|-------|-------|
| <doc-name>.part-01.md | <one-line scope note> |
| <doc-name>.part-02.md | <one-line scope note> |
```

---

## 3. Token Boundary Handling

Context budgeting rules for all agents operating in this project.

**Prescribed load order** — the canonical five-step CONTEXT-LOADING order established
in the workspace [`README.md`](../../../README.md), restated here verbatim (stop as soon
as the task is fully specified). This playbook itself IS canonical step 4 (the project
registry/playbook file), so it is not listed twice:

1. **Root constitution** — [`../../../.specify/memory/constitution.md`](../../../.specify/memory/constitution.md)
2. **Root mirror registry** — [`../../../knowledge/instructions.md`](../../../knowledge/instructions.md)
3. **Project constitution** — [`../.specify/memory/constitution.md`](../.specify/memory/constitution.md)
4. **Project mirror registry** — this playbook (`projects/project-a/knowledge/instructions.md`)
5. **Active feature folder** — `../docs/specs/<NNN-feature-name>/` (`spec.md`, and its
   `plan.md` / `tasks.md` only when working those stages)

**Project-local refinement (labeled as such — an addition to, not a change of, the
canonical order):** after step 5, load only the reference slices selected via the
relevant `_index.md` manifest
([Section 2](#2-file-slicing-constraints-for-long-reference-documents)).

**Hard rules:**

- **Never load an entire mirrored repository** (global
  [`../../../reference/repos/`](../../../reference/repos/) or project-local
  [`../reference/`](../reference/) mirrors). Navigate via manifests and
  registry scope notes; load individual files only.
- **Summarize-then-cite:** for any document exceeding the slice cap in
  Section 2, produce a short summary with precise citations
  (file + slice + heading) and work from the summary — do not carry the full
  text forward in context.
- **Write findings back:** when a distilled finding will recur across
  features, record it in this playbook (typically as an edge-case row in
  Section 1 or a note in the relevant section) so future agents inherit it
  without re-reading the source.

**Illustrative example** — a distilled finding written back after a
summarize-then-cite pass:

> **Finding (2026-07-12):** SAP OData V2 `Edm.DateTime` fields in
> `API_SALES_ORDER_SRV` serialize as `/Date(ms)/` epoch strings, not ISO 8601.
> Source: `../reference/sap-odata-metadata/_index.md` →
> `sap-odata-metadata.part-01.md`, "SalesOrder header — annotations".
> Recurs in every date-bearing payload; mapping rule captured in
> `../docs/specs/001-feature-name/spec.md` (placeholder feature folder).

**Template finding (copy, fill, append above):**

> **Finding (YYYY-MM-DD):** `<one-paragraph distilled fact>`.
> Source: `<manifest path>` → `<slice file>`, `<heading>`.
> Recurs in: `<where this will matter again>`; captured in `<linked spec, if any>`.

---

## 4. Local Mirror Overrides

Registry of **project-specific mirrors** stored under
[`../reference/`](../reference/). Columns are identical to the global mirror
registry in [`../../../knowledge/instructions.md`](../../../knowledge/instructions.md).
Every project-local mirror MUST be registered here before agents may cite it,
and every long document inside a mirror follows the slicing rules in
[Section 2](#2-file-slicing-constraints-for-long-reference-documents).

> **Precedence:** within Hana-X-Subsystem, entries in this table **override**
> any same-named entry in the global registry. Agents resolve mirrors here
> first and fall back to the global registry only when no local entry matches.
> This is the MIRROR-LOOKUP precedence rule (an Article IV resolution order
> applied during work), distinct from the context-loading order in Section 3.
> Lookups through this table are operationalized by the `mirror-sync` skill
> ([`../.claude/skills/mirror-sync/SKILL.md`](../.claude/skills/mirror-sync/SKILL.md)):
> it resolves this table first, then the global registry, and stops — never
> guesses — on its validation gates (absent framework, missing mirror path,
> `placeholder` pin). The skill is an implementation aid; this table and the
> global registry remain the sources of truth.

> The seed row below is an **illustrative example** — the mirror directory does
> not exist yet. Register it for real once the export lands under
> `../reference/`. Per the project constitution's Endpoint Discipline article,
> source systems are identified by **environment alias only** — hostnames and
> tenant identifiers MUST NOT appear in this file.

| Framework | Local Mirror Path | Upstream URL | Pinned Version/Commit | Notes |
|-----------|-------------------|--------------|-----------------------|-------|
| SAP S/4 HANA `API_SALES_ORDER_SRV` OData `$metadata` export *(illustrative)* | `../reference/sap-odata-metadata/` | OData `$metadata` service of environment alias `S4-DEV` (resolve via the environment alias registry) | Export of 2026-07-10, service version 0002 | Cite only entity types, navigation properties, and function imports for sales-order integration features. Sliced per Section 2 — read `_index.md` first. Last verified 2026-07-10. |

**Template row (copy, fill, append above):**

| Framework | Local Mirror Path | Upstream URL | Pinned Version/Commit | Notes |
|-----------|-------------------|--------------|-----------------------|-------|
| `<mirror-name>` | `../reference/<mirror-name>/` | `<upstream-url-or-source-system>` | `<commit-hash, tag, or export date/version>` | `<what agents may cite; entry-point files to read first; last-verified date>` |
