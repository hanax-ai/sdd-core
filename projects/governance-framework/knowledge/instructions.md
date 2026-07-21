# Governance-Framework — Project Playbook

Project-local operating instructions for agents working inside
`projects/governance-framework/` (the workspace governance design layer).
This file supplements — never replaces — the global playbook at
[`../../../knowledge/instructions.md`](../../../knowledge/instructions.md) and
the constitutions listed in [Section 3](#3-token-boundary-handling). Where this
file and the global playbook conflict on project-scoped matters, this file
wins.

---

## 1. Standards & Policy Register

The canonical index of definitional artifacts this project owns. Every
standard, policy, model, or control definition authored here MUST have a row
the moment it is created — even before it stabilizes (use status `draft`).
Every row MUST link the owning spec under [`../docs/specs/`](../docs/specs/)
once one exists.

> No live entries yet — this project's first feature
> (`001-evidence-based-skill-lifecycle`, from the Gate-1-promoted proposal
> `../../../docs/proposals/evidence-based-skill-lifecycle.md`) begins at spec
> authoring. Register its standards here as they are defined.

| ID | Artifact | Kind | Version | Status | Owning Spec |
|----|----------|------|---------|--------|-------------|
| ST-0NN |  | standard \| policy \| model \| control | | draft \| active \| superseded | |

Statuses move forward only (`draft` → `active` → `superseded`); superseded
rows keep their entry and name their successor in the Artifact cell.

---

## 2. File Slicing Constraints for Long Reference Documents

Oversized reference material (framework exports, standards documents, external
methodology references) stored under [`../reference/`](../reference/) MUST be
split into ordered slices before agents may consume it.

> These slicing rules are operationalized by the `mirror-sync` skill
> ([`../.claude/skills/mirror-sync/SKILL.md`](../.claude/skills/mirror-sync/SKILL.md)),
> whose validation gates (d)/(e) stop work on a sliced document with a missing
> `_index.md` or a manifest listing nonexistent slices. The skill is an
> implementation aid — this section remains the normative slicing regime.

**Rules:**

1. **Naming convention:** slices are named `<doc-name>.part-NN.md` with
   zero-padded, ordered numbering (`part-01`, `part-02`, ...).
2. **Hard cap:** roughly **400 lines (~4,000 tokens) per slice**. Split at a
   natural boundary (section heading, control family, chapter) at or before
   the cap — never mid-table or mid-definition.
3. **Mandatory manifest:** every sliced document gets an `_index.md` manifest
   in the same directory listing **every** slice with a one-line scope note.
4. **Manifest-first reading:** agents MUST read `_index.md` first and load
   **only** the slices relevant to the task at hand — never the full slice set
   by default.

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
4. **Project mirror registry** — this playbook (`projects/governance-framework/knowledge/instructions.md`)
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
  features, record it in this playbook (typically as a register row in
  Section 1 or a note in the relevant section) so future agents inherit it
  without re-reading the source.

**Template finding (copy, fill, append to the relevant section):**

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

> **Precedence:** within Governance-Framework, entries in this table **override**
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

> No local mirrors are registered yet. Likely first entries: external
> governance/methodology references (e.g. a pinned export of an upstream
> standard) once a feature needs to cite one. Source systems are identified by
> **environment alias only** — hostnames and tenant identifiers MUST NOT
> appear in this file.

| Framework | Local Mirror Path | Upstream URL | Pinned Version/Commit | Notes |
|-----------|-------------------|--------------|-----------------------|-------|
| `<mirror-name>` | `../reference/<mirror-name>/` | `<upstream-url-or-source-system>` | `<commit-hash, tag, or export date/version>` | `<what agents may cite; entry-point files to read first; last-verified date>` |
