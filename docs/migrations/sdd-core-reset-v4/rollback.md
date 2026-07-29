---
title: SDD-Core Reset v4 Rollback
status: evidence-closure-prepared
topic: reset-rollback
scope: GLOBAL
base_commit: d3363238bb2d2f513f09b364926ff4146cc376ff
---

# SDD-Core Reset v4 Rollback

## Before merge

The migration is isolated on
`codex/sdd-core-reset-v4-final-clean-rebuild` in draft
[PR #17](https://github.com/hanax-ai/sdd-core/pull/17). Its exact atomic
identifier is commit `740a5e3a7623916f97d96f3f0cb0dff9cdcf18d0`,
tree `50c9ec59e60f3a33b30ada846a240cfce5d58378`, parent
`cc4f4b17ccca428334689cc5ab381741470168c0`.

Before merge, the recoverable rollback is to abandon the branch/worktree and
draft pull request and return to the planning parent commit above. Do not
rewrite or clean another worktree. Preserve the branch if review evidence or
forensic comparison is still needed. The authorized base commit
`d3363238bb2d2f513f09b364926ff4146cc376ff` remains the earlier recovery source
for legacy blobs, not the immediate parent of the atomic migration.

## After merge

A post-merge rollback requires one separate exact human authorization naming
both the evidence-closure commit and atomic commit
`740a5e3a7623916f97d96f3f0cb0dff9cdcf18d0`. The evidence-closure commit is
`SELF` in the closure record because it cannot contain its own SHA; T024 must
record its exact SHA before any post-merge rollback.

Apply the reverts newest-first with `--no-commit`: the exact evidence-closure
commit first, then atomic commit
`740a5e3a7623916f97d96f3f0cb0dff9cdcf18d0`. Create one rollback commit
containing both inverse changes. Both reverts are mandatory; do not publish an
intermediate state or preserve stale closure evidence after reverting the
migration.

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
