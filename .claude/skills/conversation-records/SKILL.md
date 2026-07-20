---
name: conversation-records
description: Use when capturing, finding, updating, summarizing, or archiving workspace-level conversation records in the root conversations/ directory — "record this decision for the workspace", "capture this conversation", "find the record about X", "update the governance record", "summarize our records", "archive that record". Governs the full record lifecycle at the WORKSPACE root only; project records stay under the machine-tier conversation-sync skill and the owning project's policy.
---

# Conversation Records — Workspace Root Lifecycle

Operational procedures for the root `conversations/` directory. This skill operates
UNDER the machine-tier `conversation-sync` skill and the root
[`conversations/SYNC-POLICY.md`](../../../conversations/SYNC-POLICY.md): it adds
procedure, never permission. Where they conflict, the policy and `conversation-sync`
win. This is deliberately NOT named `conversation-sync` — that name is reserved,
machine-wide, for the one global sync skill.

## When this skill MUST be used (triggers)

- A workspace-level outcome was ratified (governance change, cross-project convention,
  tooling decision, plan completion) and someone asks to record, capture, or save it.
- Someone asks what was previously decided at workspace level ("find the record",
  "what did we decide about X").
- An existing root record needs updating, summarizing, or archiving.

NOT for: project-scoped records (route to the owning project's
`projects/<name>/conversations/` per its policy), or chat with no ratified outcome
(record nothing — see Hard rules).

## Canonical location and scope

- Data location: `conversations/` at the workspace root — ALWAYS; never elsewhere.
- Conventions: naming, frontmatter, indexing, archival per
  [`conversations/README.md`](../../../conversations/README.md); record shape per
  [`conversations/TEMPLATE.md`](../../../conversations/TEMPLATE.md).
- **Write boundary (Article III):** writes require root-level (GLOBAL) scope. A
  project-scoped session may READ records but MUST NOT create, modify, or archive
  them — decline and name the boundary instead.

## Procedures

### 1. Capture (create)

1. Confirm the outcome is workspace-scoped AND ratified (a GLOBAL-tier artifact —
   constitution version, registry row, README, commit — backs it). Not ratified →
   record nothing; say why.
2. **Dedup check first:** search `conversations/_index.md` and record filenames/titles
   for the same topic. Match found → switch to Update (§3); never create a duplicate.
3. Copy `TEMPLATE.md` → `conversations/YYYY-MM-DD-<kebab-topic>.md` (date = ratification
   date).
4. Fill every frontmatter field; body records: provenance (which conversation/session,
   which ratifying artifacts), dates, participants BY ROLE (e.g. "Workspace
   Maintainer" — no personal data beyond public maintainer roles), decisions with
   citations, action items with owners, and unresolved questions verbatim as questions.
5. Add the record's line to `_index.md` (create the index from the README template if
   absent), newest first.

### 2. Locate (retrieve)

1. Read `conversations/_index.md` first — never scan blind.
2. Fall back to filename dates/topics, then frontmatter grep (`title:`, `related:`,
   `status:`).
3. Report matches with filename + status; superseded records are cited only with their
   `superseded-by` successor alongside.

### 3. Update

1. Locate the existing record (§2). Read it fully.
2. Show the exact diff (current vs proposed) and obtain explicit user confirmation
   BEFORE writing — advisory diff-and-confirm rule, per policy. No confirmation, no
   write.
3. Never rewrite ratified history: corrections append or supersede (§5); they do not
   silently reword past decisions.
4. Update the record's `_index.md` line if the summary or status changed.

### 4. Summarize

1. Summaries derive ONLY from record content — quote or restate what records state,
   with filename citations per claim.
2. A summary that needs facts not present in any record names the gap ("no record
   covers X") instead of filling it.
3. Written summaries of multiple records are themselves records (capture via §1) only
   when the user asks to persist them; otherwise they are ephemeral output.

### 5. Archive / supersede

1. Replacement decision → new record with `supersedes: <old-file>`; set the old
   record's `status: superseded` and `superseded-by: <new-file>` (diff-and-confirm
   applies to the old record's edit).
2. Dead-but-not-replaced records → `status: archived`, file stays in place.
3. NEVER delete a record file. Physical pruning is maintainer-only, done outside this
   skill, logged in the machine's Install Registry Event Log.

## Hard rules

- **No unsupported inference:** record only what was stated and ratified. No inferred
  motivations, no reconstructed reasoning, no "presumably". Uncertain → list under
  unresolved questions, or leave out and say so.
- **No duplicates:** capture always runs the §1.2 dedup check; same-topic evolution is
  an update or supersession, never a second record.
- **No accidental overwrites:** every modification of an existing record goes through
  diff + explicit confirmation (§3.2). Advisory guidance to the model, not a mechanical
  guarantee — reliable enforcement would require a reviewed script (future amendment).
- **No secrets:** the policy's must-never-sync list is absolute — no credentials,
  hostnames, tenant identifiers, personal data, or verbatim transcripts. Scan the
  drafted record before writing; on a hit, redact to alias/role or drop the line.
- **Durable vs disposable:** ratified decisions, constraints, provenance, action items,
  unresolved questions are durable — capture them. Exploration, dead ends, small talk,
  and anything unratified are disposable chat — never recorded.

## Validation scenarios (expected behavior)

| # | Given | Expected |
|---|-------|----------|
| V1 | "Record that we adopted the root conversations directory" (ratified: commit + registry row) | §1 runs: dedup check, new `2026-07-19-….md` from template, all frontmatter filled, `_index.md` line added |
| V2 | Same request repeated later | Dedup finds the record; skill proposes §3 update, does NOT create a second file |
| V3 | Update request on an existing record | Diff shown, explicit confirmation awaited before write; no confirmation → no write |
| V4 | Draft record contains a hostname or token | Write refused until redacted to alias/role; must-never-sync cited |
| V5 | Project-scoped session asks to write a root record | Declined, Article III boundary named, project destination offered |
| V6 | "Record this brainstorm" with no ratifying artifact | Nothing recorded; skill says the outcome is unratified/disposable |
| V7 | "What did we decide about tooling governance?" | §2: `_index.md` consulted first; answer cites record filenames; gaps named, not filled |
