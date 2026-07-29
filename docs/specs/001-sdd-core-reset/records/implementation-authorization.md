---
title: SDD-Core Reset Implementation Authorization
status: implementation-complete-evidence-closure-prepared
record_type: gate-2-implementation-authorization
issuer: Agent Zero
authorized_on: 2026-07-28
repository: hanax-ai/sdd-core
base_branch: release/sdd-core-v3.0.0-rc.1
base_commit: d3363238bb2d2f513f09b364926ff4146cc376ff
plan_path: docs/specs/001-sdd-core-reset/plan.md
plan_sha256: C83198CE8CDAA85E27696273A2DE13F543D8CB1B45C2AD91FA753ECE4735354D
planning_commit: cc4f4b17ccca428334689cc5ab381741470168c0
---

# SDD-Core Reset Implementation Authorization

## Verbatim authorization

> Approved for implementation: docs/specs/001-sdd-core-reset/plan.md (SHA-256: C83198CE8CDAA85E27696273A2DE13F543D8CB1B45C2AD91FA753ECE4735354D; commit: cc4f4b17ccca428334689cc5ab381741470168c0)

## Authorized scope

- Implement the outcomes and tasks defined by the identified plan in
  `hanax-ai/sdd-core`.
- Work only from the authorized base branch and base commit recorded above.
- Validate the implementation using the plan's required deterministic checks,
  evidence records, and independent review.

## Prohibited actions

- Do not modify an external project repository or machine-tier installation.
- Do not treat this authorization as merge or release authority.
- Do not broaden implementation beyond the identified plan.
- Do not remove legacy project material unless its required preservation is
  proved.

## Next authority boundary

The authorized implementation is complete, but merge and release remain
unauthorized. They require separate, explicit authorization after the
evidence-closure commit exists and its post-push checks are reported in T024.

## Implementation outcome

- Atomic commit: `740a5e3a7623916f97d96f3f0cb0dff9cdcf18d0`.
- Atomic tree: `50c9ec59e60f3a33b30ada846a240cfce5d58378`.
- Planning parent: `cc4f4b17ccca428334689cc5ab381741470168c0`.
- T021 independent governance review: R10 **ACCEPT**.
- Local deterministic validation: **122/122**.
- Source closure: **60/60** dispositions and **39/39** moved-target hashes.
- Draft [PR #17](https://github.com/hanax-ai/sdd-core/pull/17): base
  `release/sdd-core-v3.0.0-rc.1`, head
  `codex/sdd-core-reset-v4-final-clean-rebuild`; pre-closure Ubuntu and Windows
  checks passed.
- CodeRabbit evidence is cumulative across the PR #7 full-base review,
  remediation PRs #10, #12, #14, and #16, and final exact-tree one-file
  [PR #18](https://github.com/hanax-ai/sdd-core/pull/18#issuecomment-5113801614),
  which was clean with no actionable finding.
- The evidence-closure commit is `SELF`, meaning the commit introducing the
  closed evidence table. T024 records its exact SHA and the post-closure PR #17
  CI and CodeRabbit results after creation and push.
- Fusion Harness, Agent Workflow, machine-tier routing, remediation, Autofix,
  merge, release, and deployment remain outside this authorization.

## Entry verification

- Plan digest: exact match.
- Planning commit: exact match.
- Authorized base commit: ancestor of the planning commit.
- Worktree: clean before this authorization record was created.
- Baseline verifier: `181/181` checks passed.
- Active coordination claims: none found.
