---
title: SDD-Core v4.0.0-rc.1 Release Transition
status: released-activation-blocked
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

## Completed release

| Field | Value |
|---|---|
| Mainline pull request | [PR #21](https://github.com/hanax-ai/sdd-core/pull/21) |
| Release commit | `61d51a7f8f3d43397678073e9ba6dc21770c2c27` |
| Release tree | `2e93ff1415a97bf0dd17c16ccca5bb259a90962a` |
| Annotated tag | `v4.0.0-rc.1` |
| Tag object | `7be64b888d087a6bcd2ad56919b4df7fe546edb2` |
| GitHub prerelease | [SDD-Core v4.0.0-rc.1](https://github.com/hanax-ai/sdd-core/releases/tag/v4.0.0-rc.1) |
| Post-merge main CI | **PASS** — [run 30429349490](https://github.com/hanax-ai/sdd-core/actions/runs/30429349490) |

The release sequence completed under the recorded authority:

1. the bounded handoff correction merged through
   [PR #20](https://github.com/hanax-ai/sdd-core/pull/20);
2. historical v3 PR #1 closed unmerged and remained preserved;
3. the correctly named `release/sdd-core-v4.0.0-rc.1` branch targeted `main`;
4. PR #21 passed Ubuntu and Windows validation and merged; and
5. the annotated tag and GitHub prerelease were created at the exact merged
   `main` commit.

## Adopter and runtime state

| Action | Authority | Readiness |
|---|---|---|
| SDD-Core v4 release | Authorized and completed | `v4.0.0-rc.1` published |
| Adopter contract updates | Authorized | `BLOCKED` until exact adopter repositories and immutable integration pins are inventoried |
| Fusion Harness activation | Authorized | `BLOCKED` because no compatible immutable Harness release is verified |
| Agent Workflow registration | Authorized | `BLOCKED` because no compatible immutable Workflow release is verified |
| Runtime activation | Authorized | `BLOCKED` until installation, compatibility, registration, and readiness checks pass; each execution still requires a valid mission envelope |
| Autonomous remediation | Not activated | Disabled and deferred |

An authorization can permit an action but cannot convert an invalid or
unverified binding into `READY`.

## Rollback

The v4 release has reached `main`. Any rollback now requires separate exact
human authority and the governed whole-commit procedure in
[rollback.md](../migrations/sdd-core-reset-v4/rollback.md); do not partially
restore the legacy `projects/` model.

## Related records

- [Migration evidence](../migrations/sdd-core-reset-v4/migration-evidence.md)
- [Implementation authorization](../specs/001-sdd-core-reset/records/implementation-authorization.md)
- [Reset rollback](../migrations/sdd-core-reset-v4/rollback.md)
