---
name: wip-item-bookkeeping
description: Use when updating a collaborative WIP item's metadata or progress — "mark item done", "update the sync pin", "flip the WIP status", "record Gate 1 evidence", "refresh the item after commit", "update the item index row". Governs the metadata contracts (Last-synchronized-commit = the main HEAD the synthesis integrates against), the status vocabulary and forward-only transitions, approval-field shapes, done-marking with commit citations, and wip/_index.md row consistency.
---

# WIP Item Bookkeeping

Metadata discipline for items under `wip/`. Born from two escaped defects: stale
sync pins caught twice by maintainer review (2026-07-20). This skill operates
UNDER `wip/README.md` and `wip/TEMPLATE.md` — it adds procedure, never
authority.

## The sync pin (the defect this skill exists for)

`Last synchronized commit` = the short SHA of the main HEAD this synthesis
integrated against — i.e. the PARENT of the synthesis commit you are about to
make.

- Update it in EVERY commit that touches the item's README (every synthesis),
  set to `git log --oneline -1` BEFORE committing.
- Never copy a SHA from earlier in the session — read HEAD live.
- A pin older than the last commit that touched the item is STALE — fix it in
  the next synthesis, never retroactively rewrite history.

## Status and approval fields

- Vocabulary (TEMPLATE.md, forward-only): `draft` → `exploring` →
  `review-ready` → `approved-for-promotion` | `rejected` | `archived`; after
  promotion: `promoted`.
- Approval state stays `NOT APPROVED` until a verbatim Gate directive exists.
  Gate evidence fields carry: the directive VERBATIM, the date, the issuing
  authority (Agent Zero), and the exact target path — plus the item revision
  the directive was issued against.
- `Contribution status` vocabulary: `open-for-contributions` | `synthesizing`
  | `frozen-for-review`. Reopen after a review round completes.

## Done-marking

A backlog/idea entry is marked done as: `✅ DONE (commit <short-SHA>)` plus the
decision that authorized it (who, date). Never mark done without the commit
citation; never delete the entry — supersede or annotate.

## Index row

After any change to status, approval state, lead, contributors, or summary:
update the item's `wip/_index.md` row in the SAME commit. Schema is fixed
(7 columns, newest first); `verify-layout.sh` checks every item has a row.

## Sequence for a synthesis commit

1. Read current main HEAD (`git log --oneline -1`) → set the pin.
2. Apply content edits (done-marks, status, approval fields).
3. Update `_index.md` row if any indexed column changed.
4. Commit via the governed-change discipline (one atomic commit).
