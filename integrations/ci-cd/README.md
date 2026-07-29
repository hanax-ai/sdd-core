---
id: sdd-core-ci-cd-profile
title: Review-Only CI/CD Profile
artifact_type: integration-policy
category: validation
authority_tier: root-global
status: release-candidate
version: 4.0.0-rc.1
access_level: public
---

# Review-Only CI/CD Profile

SDD-Core CI/CD is validation-first and review-only. Automation may inspect a
candidate, run deterministic checks, and produce advisory evidence. No
automated result grants Gate 1, Gate 2, merge, release, deployment, or mission
authority.

## Separate status dimensions

| Dimension | Allowed states | Authority effect |
|---|---|---|
| Deterministic validation | `PASS`, `FAIL`, `PENDING` | None |
| AI review coverage | `COMPLETE`, `PARTIAL`, `UNAVAILABLE`, `PENDING` | None |
| Tool health | `HEALTHY`, `DEGRADED`, `UNAVAILABLE`, `UNKNOWN` | None |
| Integration readiness | `READY`, `BLOCKED`, `UNKNOWN` | None |
| Workflow coordination | `READY`, `DEGRADED`, `BLOCKED`, `UNKNOWN` | None |
| Human authority | `NOT_GRANTED`, `GRANTED_BY_EXACT_DIRECTIVE` | Human source only |

CodeRabbit or an equivalent reviewer is an evidence producer only. Review
coverage and tool health MUST remain distinct: a healthy tool may provide
partial coverage, and an unavailable tool cannot be reported as a completed
review.

## Disabled and deferred remediation

The following capabilities are explicitly disabled and deferred to a separate
future proposal, threat review, Gate 1, and Gate 2:

- Claude Action or equivalent agentic remediation;
- Agent Workflow remediation scheduling;
- Fusion Harness remediation execution;
- automatic fix generation or Autofix application;
- automatic commit, push, pull-request creation, or merge;
- automatic release, deployment, or rollback; and
- any write-capable agent permission or repository token.

Design notes for bounded remediation are roadmap material only. This profile
contains no write-capable action, mutation permission, hidden fallback, or
authorization inference.

See the [evidence contract](../../contracts/evidence/README.md) and
[contribution guidance](../../CONTRIBUTING.md).
