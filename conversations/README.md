# Workspace Conversation Records — `conversations/` (GLOBAL tier)

The canonical location for durable, workspace-relevant conversation records: decisions,
constraints, and outcomes ratified at the GLOBAL tier that belong to no single
sub-project (governance changes, cross-project conventions, plan completions, tooling
decisions).

## Where records belong (unambiguous rule)

- **Workspace-level record** (governance, cross-project convention, tooling, anything
  spanning projects) → HERE, `conversations/` at the workspace root.
- **Project-scoped record** (one sub-project's decisions, constraints, status) →
  that project's `projects/<name>/conversations/`, per its `SYNC-POLICY.md`.
- Never both; never another project's directory. When scope is unclear, it is a
  workspace-level record only if a GLOBAL-tier artifact (root constitution, root
  registries, README) is affected — otherwise it is project-scoped.

## Scope rule (constitution Article III)

This directory is a **GLOBAL-tier resource**. Agents scoped to a sub-project treat it
as READ-ONLY — same rule as every other root-level path. Only an agent explicitly
operating at root-level (GLOBAL) scope may create or modify records here. A
project-scoped write into this directory is a constitution violation: revert it, never
rationalize it.

## Usage

1. Read [`SYNC-POLICY.md`](SYNC-POLICY.md) first — it governs what may and must never
   be recorded.
2. Copy [`TEMPLATE.md`](TEMPLATE.md) to a new file named per the convention below.
3. Fill every frontmatter field; summarize — never paste transcripts.
4. Add one line to the local `_index.md` (create it from the template in this file if
   absent).
5. Modifying an existing record: show the diff, get explicit user confirmation first
   (advisory rule, per policy).

## Naming convention

`YYYY-MM-DD-<kebab-case-topic>.md` — e.g. `2026-07-19-canonical-plan-v3-completion.md`.
One record per decision/session outcome. Date = the date the recorded outcome was
ratified, not the writing date.

## Metadata

Every record carries the TEMPLATE.md frontmatter: `title`, `date`, `scope`
(`workspace`), `status` (`active` | `superseded` | `archived`), `supersedes` /
`superseded-by` (record filenames or `—`), `related` (specs, plans, commits, registry
entries). Searchable by plain grep over frontmatter keys.

## Indexing

A local `_index.md` in this directory lists every record, one line each, newest first:

```markdown
# Index: workspace conversation records

| Record | Date | Status | One-line summary |
|--------|------|--------|------------------|
| 2026-07-19-example.md | 2026-07-19 | active | What was decided |
```

The index and the records are **local to each machine** (git-ignored); only this
README, `SYNC-POLICY.md`, and `TEMPLATE.md` are committed template content.

## Archival

- A record is never deleted. Supersede it: set `status: superseded` and
  `superseded-by:` on the old record, `supersedes:` on the new one.
- Records with no live relevance move to `status: archived` (file stays in place;
  index row updated).
- Pruning physical files is a maintainer-only action, recorded in the machine's
  Install Registry Event Log.
