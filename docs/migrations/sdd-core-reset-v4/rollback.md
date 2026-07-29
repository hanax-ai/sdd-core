---
title: SDD-Core Reset v4 Rollback
status: pre-commit-design
topic: reset-rollback
scope: GLOBAL
base_commit: d3363238bb2d2f513f09b364926ff4146cc376ff
---

# SDD-Core Reset v4 Rollback

## Before merge

The migration is isolated on `codex/sdd-core-reset-planning`. Before merge, the
recoverable rollback is to abandon the branch/worktree and return to the
authorized base commit
`d3363238bb2d2f513f09b364926ff4146cc376ff`. Do not rewrite or clean another
worktree. Preserve the branch if review evidence or forensic comparison is
still needed.

The atomic migration commit identifier is an evidence-closure field:
`NOT_YET_CREATED` until T022. T023 records the exact commit and tree without
amending that commit.

## After merge

A post-merge rollback requires one separate exact human authorization naming
both the evidence-closure commit and the atomic migration commit. Apply the
reverts newest-first with `--no-commit`—evidence closure first, then the atomic
migration—and create one rollback commit containing both inverse changes. Both
reverts are mandatory; do not publish an intermediate state or preserve stale
closure evidence after reverting the migration.

Do not partially restore `projects/`, individual constitutions, contracts,
adapters, or integration files; partial restoration would create mixed
authority models.

If later adopter or integration work exists, assess it separately before any
revert. This document does not authorize changes in an adopter, CentCom,
Fusion Harness, Agent Workflow, machine-tier configuration, or release state.

## Preservation

Legacy source blobs remain recoverable from the authorized base and are
cataloged in [artifact-inventory.md](artifact-inventory.md). The CentCom
package has independent byte-identical preservation at commit
[`201dde50268650e6ad489f483d5c57d3eeef2f3f`](https://github.com/hanax-ai/sdd-core-centcom-dashboard/commit/201dde50268650e6ad489f483d5c57d3eeef2f3f).
Its repository is not part of an SDD-Core rollback.

## Stop conditions

Stop and return to Agent Zero if the base, migration commit/tree, disposition
map, independent review, remote check results, or external preservation cannot
be proven. A failed or partial rollback is not repaired by restoring selected
legacy paths.
