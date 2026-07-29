---
title: SDD-Core Reset Implementation Authorization
status: authorized
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

Merge and release require separate, explicit authorization after the
implementation and its evidence have been reviewed.

## Entry verification

- Plan digest: exact match.
- Planning commit: exact match.
- Authorized base commit: ancestor of the planning commit.
- Worktree: clean before this authorization record was created.
- Baseline verifier: `181/181` checks passed.
- Active coordination claims: none found.
