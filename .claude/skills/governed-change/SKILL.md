---
name: governed-change
description: Use when making ANY governed change to this repository — "commit this", "apply this change", "make a tracked change", "merge the branch", "commit under governance", or any edit that will end in a git commit. Encodes the workspace's repo-writing discipline (clean tree, atomic commit, git-history audit, verification) so no governed change skips a step.
---

# Governed Change — Repo-Writing Discipline

The mandatory procedure for every change committed to this repository. Derived from the
canonical plan's D9 git-safety rules; the constitution and registries remain normative —
this skill is the operational checklist.

## 1. Preconditions (before any edit)

- `git status --short` is EMPTY (clean tree). Dirty → stop and report; never mix a
  governed change with unrelated modifications.
- Correct branch confirmed (`git branch --show-current`). Feature-scale work gets a
  dedicated branch from `main`; small maintainer-directed changes may land on `main`
  directly when so directed.
- The edit set is scoped and named BEFORE editing: list the exact files the change will
  touch. Every changed line must trace to the directive.

## 2. Make the change

- Touch only the listed files. New requirements discovered mid-change → stop, restate
  the edit set, then continue.
- Structural additions update `verify-layout.sh` REQUIRED_PATHS and the README layout
  tree in the SAME change.
- New skills/plugins/policy files also follow `skills-creator` part 4 registrations in
  the same change (tooling.md row now; Install Registry row at logging time).

## 3. One atomic commit

- Exactly ONE commit per governed change-set. Stage only the listed files —
  never `git add -A` / `git add .`.
- Commit message: what changed and why, normal prose (no style compression).
- After committing: `git status --short` must be empty again, and
  `git show --stat HEAD` must list exactly the declared edit set.

## 4. Audit trail (scope narrowed 2026-07-20)

- Repository changes are audited by GIT HISTORY: the atomic commit and its message
  ARE the ownership record — no Install Registry row for routine repo commits.
- Install Registry rows are required only for TOOLING-scope events (new, changed,
  or removed skills, plugins, hooks, policy files, tool installs — per the
  `registry-logging` skill) and for machine-tier file edits (Gate 6 backup BEFORE
  modification, then the entry).
- Governance-control evidence never enters the registry — it belongs to the
  governance-ops evidence system (the constitutions' routing tables).

## 5. Verify

- `./verify-layout.sh` passes (all required paths).
- The change's own done-when conditions are checked mechanically (file content greps,
  command output) — never asserted from memory.
- Report results with evidence; failures reported as failures, never papered over.

## 6. Rollback rule

- Undo = `git revert <that change's commit>` — NEVER `git checkout <path>` over a
  working tree, never history rewrites on shared branches. Machine-tier files restore
  from `~/.sdd-core-ops/backups/` with hash verification.
