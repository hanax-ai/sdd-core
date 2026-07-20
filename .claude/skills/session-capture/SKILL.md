---
name: session-capture
description: Use when asked to capture, save, or test-record the CURRENT working session into a conversation record — "capture this session", "record this session", "save this session to the conversation log", "run a session capture", "snapshot what we decided today". Reviews the visible session, routes the record to the correct tier (workspace root vs sub-project), writes it under the governing policy, then validates and reports. Works from the workspace root and from any sub-project.
---

# Session Capture — Current Session → Conversation Record

Turns the visible, current session into a validated conversation record. This skill
ORCHESTRATES: the machine-tier `conversation-sync` skill decides what may sync and
where; the root `conversation-records` skill (root tier) and the owning project's
`conversations/SYNC-POLICY.md` (project tier) govern the record itself. This skill adds
the session-review procedure and the validation pass — never new permissions.

**Evidence rule:** use ONLY the visible session and files/commands checked during it.
No memory of other sessions, no assumptions, no reconstruction.

## Step 1 — Confirm dependencies (stop if missing)

1. Resolve scope FIRST (conversation-sync §3): workspace-scoped outcomes (GLOBAL-tier
   artifacts affected) → root `conversations/`; project-scoped outcomes → that
   project's `projects/<name>/conversations/`. Mixed session: split records by scope;
   a project-scoped session NEVER writes the root record (Article III) — capture the
   project part, report the workspace part as out-of-scope.
2. Verify the target directory and its `SYNC-POLICY.md` exist (root additionally:
   `TEMPLATE.md`, `README.md`, `conversation-records` skill). Missing → STOP, report
   the exact missing dependency, create NO substitute structures.

## Step 2 — Review the session

Extract, from the visible session only:

- session purpose;
- important context;
- decisions made (with the artifact that ratified each);
- requirements established;
- action items (with owners);
- unresolved questions;
- relevant repository status or evidence (re-verify live — e.g. current branch/ahead
  count — do not trust earlier statements).

## Step 3 — Create or update the record

Follow the governing tier's rules exactly (root: `conversation-records` procedures §1–§5
and the root conventions; project: that project's policy + the root TEMPLATE.md shape
unless the project declares its own):

- Dedup check against the tier's `_index.md`/records BEFORE creating; same topic →
  update/supersede, never a duplicate.
- Naming `YYYY-MM-DD-<kebab-topic>.md` (ratification date); every frontmatter field
  filled; index line added (create index from the tier's template if absent).
- Updates: exact diff + explicit user confirmation before writing (advisory).

## Step 4 — Provenance labels

Tag content so classes cannot be confused:

- `[FACT]` — verified in repo/registry/command output during the session;
- `[DECISION]` — ratified outcome, citation required;
- `[PROPOSAL]` — offered, not accepted;
- `[ASSUMPTION]` — relied on, recorded explicitly;
- `[UNRESOLVED]` — open question, kept as a question.

## Step 5 — Prohibitions

- No fabricated or inferred-beyond-evidence content — gaps are named, not filled.
- No secrets: credentials, hostnames, tenant identifiers, personal data (roles only),
  verbatim transcripts. Scan the draft before writing; redact or drop on any hit.
- No conversational noise: unratified exploration and dead ends are disposable.

## Step 6 — Read back and verify

Re-read the saved record. It must accurately represent the session: every decision and
action item traceable to the visible session; nothing added, nothing silently dropped.

## Step 7 — Validate and report

Validate mechanically: record in the correct tier location; policy-conformant
git-visibility (record content ignored where the tier so declares); all frontmatter
fields present; naming convention matched; secret scan clean; every cited
commit/artifact exists; index row present and correct.

Then report: skill invocation status; record created/updated; index or supporting files
changed; each validation result; any errors, ambiguities, or skill improvements found.

## Validation scenarios (expected behavior)

| # | Given | Expected |
|---|-------|----------|
| S1 | Workspace-scoped session at root scope | Record + index under root `conversations/`, all validations pass |
| S2 | Project-scoped session | Record under that project's `conversations/` per its policy; root untouched |
| S3 | Mixed-scope session, project scope only | Project part captured; workspace part reported out-of-scope, not written |
| S4 | Target tier missing SYNC-POLICY.md | STOP; exact missing dependency reported; nothing created |
| S5 | Session with no ratified outcome | Nothing recorded; reason stated (disposable chat) |
| S6 | Repeat capture of the same session/topic | Dedup hit → update path with diff+confirm, no second record |
