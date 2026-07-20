---
name: governed-change
description: Use when making ANY governed change to this repository — "commit this", "apply this change", "make a tracked change", "merge the branch", "commit under governance", or any edit that will end in a git commit. Encodes the workspace's repo-writing discipline (clean tree, atomic commit, ownership logging, verification) so no governed change skips a step.
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

## 4. Log ownership (delegate to registry-logging)

- Every touched file: `git hash-object <path>` recorded in the machine Install
  Registry Event Log at write time, with the commit SHA. Follow the
  `registry-logging` skill for entry shapes; machine-tier file edits additionally
  need a Gate 6 backup BEFORE modification.

## 5. Verify

- `./verify-layout.sh` passes (all required paths).
- The change's own done-when conditions are checked mechanically (file content greps,
  command output) — never asserted from memory.
- Report results with evidence; failures reported as failures, never papered over.

## 6. Rollback rule

- Undo = `git revert <that change's commit>` — NEVER `git checkout <path>` over a
  working tree, never history rewrites on shared branches. Machine-tier files restore
  from `~/.sdd-core-ops/backups/` with hash verification.
