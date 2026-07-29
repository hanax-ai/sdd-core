---
title: SDD-Core v4.0.0-rc.1 Release Transition
status: release-authorized-activation-blocked
topic: release-transition
scope: GLOBAL
authority_tier: root-global
version: 4.0.0-rc.1
authorized_on: 2026-07-29
---

# SDD-Core v4.0.0-rc.1 Release Transition

## Purpose

This post-T024 record preserves the historical stop boundary while recording
the later authority, completed merge, release sequence, and prerequisites that
still block adopter readiness and runtime activation.

## Verbatim authority

> You have my separate explicit authority to proceed with Merge, release,
> adopter updates, and runtime activation. unless there is a diff next step.

Agent Zero also directed:

> evaluate if the hand-off need to be adjusted.

This authority permits the named actions. It does not waive immutable identity,
compatibility, validation, adopter ownership, mission-envelope, or rollback
requirements, and it does not activate autonomous remediation.

## Completed merge

| Field | Value |
|---|---|
| Pull request | [PR #17](https://github.com/hanax-ai/sdd-core/pull/17) |
| Base | `release/sdd-core-v3.0.0-rc.1` |
| Head | `codex/sdd-core-reset-v4-final-clean-rebuild` |
| Merge commit | `98c3c8fdfd77e9361911d97050c5a42dc5adc1b2` |
| Merge tree | `c68fdc7a43d60272497519005037f729a79dc12b` |
| Atomic migration | `740a5e3a7623916f97d96f3f0cb0dff9cdcf18d0` |
| Evidence closure | `2f8d9b523c20f354387bc3a03053071ccc50b283` |
| Local validation | **PASS** — `122/122` |
| Release-branch CI | **PASS** — [run 30428563050](https://github.com/hanax-ai/sdd-core/actions/runs/30428563050) |

The merge commit preserves both governed commits without squashing.

## Required release sequence

1. Commit this bounded handoff correction under the maintenance route.
2. Replace the stale v3 release-candidate PR with a v4 release branch and PR
   from merge commit `98c3c8fdfd77e9361911d97050c5a42dc5adc1b2`.
3. Validate the exact release tree against `main`.
4. Merge the reviewed v4 release PR.
5. Create immutable tag `v4.0.0-rc.1` and a GitHub prerelease whose record
   includes constitution `4.0.0`, commit, tree, verification, unresolved
   dependencies, and rollback.

The existing `release/sdd-core-v3.0.0-rc.1` name and PR #1 description are
historical v3 identities and must not be presented as the v4 release.

## Adopter and runtime state

| Action | Authority | Readiness |
|---|---|---|
| SDD-Core v4 release | Authorized | Ready after the release sequence above passes |
| Adopter contract updates | Authorized | `BLOCKED` until exact adopter repositories and immutable integration pins are inventoried |
| Fusion Harness activation | Authorized | `BLOCKED` because no compatible immutable Harness release is verified |
| Agent Workflow registration | Authorized | `BLOCKED` because no compatible immutable Workflow release is verified |
| Runtime activation | Authorized | `BLOCKED` until installation, compatibility, registration, and readiness checks pass; each execution still requires a valid mission envelope |
| Autonomous remediation | Not activated | Disabled and deferred |

An authorization can permit an action but cannot convert an invalid or
unverified binding into `READY`.

## Rollback

Before the v4 release reaches `main`, abandon the new release PR and retain
merge commit `98c3c8fdfd77e9361911d97050c5a42dc5adc1b2` on the release branch for
forensic evidence. After release, use the governed whole-commit procedure in
[rollback.md](../migrations/sdd-core-reset-v4/rollback.md); do not partially
restore the legacy `projects/` model.

## Related records

- [Migration evidence](../migrations/sdd-core-reset-v4/migration-evidence.md)
- [Implementation authorization](../specs/001-sdd-core-reset/records/implementation-authorization.md)
- [Reset rollback](../migrations/sdd-core-reset-v4/rollback.md)
