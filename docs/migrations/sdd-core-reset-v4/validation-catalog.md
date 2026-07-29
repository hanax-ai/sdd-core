---
title: SDD-Core Reset v4 Validation Catalog
status: validation-first
topic: contract-and-readiness-cases
schema_version: "1.0.0"
---

# SDD-Core Reset v4 Validation Catalog

These expected outcomes are defined before schemas, profiles, or validator entry
points. A later validator must reproduce every outcome exactly.

| Criterion | Case | Fixture or surface | Expected | Reason |
|---|---|---|---|---|
| CC-005 | `adoption-valid` | `contracts/adoption/fixtures/valid/minimal.json` | **PASS** | Complete protected adoption |
| CC-005 | `protected-excluded` | `contracts/adoption/fixtures/invalid/protected-excluded.json` | **REJECT** | Protected provision excluded |
| CC-005 | `protected-tailored` | `contracts/adoption/fixtures/invalid/protected-tailored.json` | **REJECT** | Protected provision tailored |
| CC-005 | `protected-omitted` | `contracts/adoption/fixtures/invalid/protected-omitted.json` | **REJECT** | Protected provision omitted |
| CC-005 | `unknown-field` | `contracts/adoption/fixtures/invalid/unknown-field.json` | **REJECT** | Closed schema violation |
| CC-005 | `secret-like-key` | `contracts/adoption/fixtures/invalid/secret-like-key.json` | **REJECT** | Secret-like field name |
| CC-005 | `absolute-personal-path` | `contracts/adoption/fixtures/invalid/absolute-personal-path.json` | **REJECT** | Synthetic absolute personal path |
| CC-005 | `missing-authority` | `contracts/adoption/fixtures/invalid/missing-authority.json` | **REJECT** | Authority reference absent |
| CC-005 | `tailoring-missing-rationale` | `contracts/adoption/fixtures/invalid/tailoring-missing-rationale.json` | **REJECT** | Tailoring lacks required rationale |
| CC-005 | `nested-secret-value` | `contracts/adoption/fixtures/invalid/nested-secret-value.json` | **REJECT** | Allowed field contains secret-bearing value |
| CC-005 | `nested-personal-path-value` | `contracts/adoption/fixtures/invalid/nested-personal-path-value.json` | **REJECT** | Allowed field contains personal machine path |
| CC-006 | `mission-valid` | `contracts/authority/fixtures/valid/authorized.json` | **PASS** | Structurally and semantically authorized |
| CC-006 | `missing-signature` | `contracts/authority/fixtures/invalid/missing-signature.json` | **REJECT** | missing signature |
| CC-006 | `signature-mismatch` | `contracts/authority/fixtures/invalid/signature-mismatch.json` | **REJECT** | signature mismatch |
| CC-006 | `digest-mismatch` | `contracts/authority/fixtures/invalid/digest-mismatch.json` | **REJECT** | canonical digest mismatch |
| CC-006 | `expired` | `contracts/authority/fixtures/invalid/expired.json` | **REJECT** | expired |
| CC-006 | `revoked` | `contracts/authority/fixtures/invalid/revoked.json` | **REJECT** | revoked |
| CC-006 | `superseded` | `contracts/authority/fixtures/invalid/superseded.json` | **REJECT** | superseded |
| CC-006 | `replayed` | `contracts/authority/fixtures/invalid/replayed.json` | **REJECT** | replayed |
| CC-006 | `scope-expanded` | `contracts/authority/fixtures/invalid/scope-expanded.json` | **REJECT** | scope expanded |
| CC-006 | `branch-expanded` | `contracts/authority/fixtures/invalid/branch-expanded.json` | **REJECT** | branch exceeds authorization |
| CC-006 | `prohibited-action` | `contracts/authority/fixtures/invalid/prohibited-action.json` | **REJECT** | request includes explicitly prohibited action |
| CC-006 | `frozen-policy-changed` | `contracts/authority/fixtures/invalid/frozen-policy-changed.json` | **REJECT** | frozen policy changed |
| CC-006 | `base-mismatch` | `contracts/authority/fixtures/invalid/base-mismatch.json` | **REJECT** | base mismatch |
| CC-007 | `evidence-valid` | `contracts/evidence/fixtures/valid/validation-evidence.json` | **PASS** | Evidence remains non-authoritative |
| CC-007 | `authority-granted` | `contracts/evidence/fixtures/invalid/authority-granted.json` | **REJECT** | authority granted |
| CC-007 | `review-grants-authority` | `contracts/evidence/fixtures/invalid/review-grants-authority.json` | **REJECT** | review grants authority |
| CC-007 | `validation-grants-authority` | `contracts/evidence/fixtures/invalid/validation-grants-authority.json` | **REJECT** | validation grants authority |
| CC-007 | `integration-grants-authority` | `contracts/evidence/fixtures/invalid/integration-grants-authority.json` | **REJECT** | integration grants authority |
| CC-007 | `workflow-grants-authority` | `contracts/evidence/fixtures/invalid/workflow-grants-authority.json` | **REJECT** | workflow grants authority |
| CC-007 | `execution-grants-authority` | `contracts/evidence/fixtures/invalid/execution-grants-authority.json` | **REJECT** | execution grants authority |
| CC-008 | `harness-compatible` | `integrations/fusion-harness/fixtures/compatible.yaml` | **PASS** | READY without runtime invocation |
| CC-008 | `harness-incompatible` | `integrations/fusion-harness/fixtures/incompatible.yaml` | **BLOCKED** | Incompatible immutable release |
| CC-008 | `harness-unavailable` | `integrations/fusion-harness/fixtures/unavailable.yaml` | **BLOCKED** | Required release unavailable |
| CC-008 | `workflow-compatible` | `integrations/agent-workflow/fixtures/compatible.yaml` | **PASS** | READY |
| CC-008 | `workflow-incompatible` | `integrations/agent-workflow/fixtures/incompatible.yaml` | **BLOCKED** | Incompatible immutable release |
| CC-008 | `workflow-unavailable` | `integrations/agent-workflow/fixtures/unavailable-blocked.yaml` | **BLOCKED** | No adopted degradation prerequisites |
| CC-008 | `workflow-degraded-valid` | `integrations/agent-workflow/fixtures/degraded-valid.yaml` | **DEGRADED** | Adopted policy and immutable signed mission binding validate |
| CC-008 | `workflow-degraded-invalid` | `integrations/agent-workflow/fixtures/degraded-invalid.yaml` | **BLOCKED** | Mission-envelope content digest does not match binding |
| CC-009 | `template-neutral` | `templates/project/` | **PASS** | No application technology or runtime layout |
| CC-010 | `readiness-side-effects` | `bootstrap/new-project.md` | **PASS** | Zero execution, network, secrets, hooks, mutation, models, or agent starts |
| CC-011 | `remediation-disabled` | `integrations/ci-cd/README.md` | **PASS** | No autonomous mutation permissions or enabled remediation |

## Readiness side-effect invariant

Read-only readiness permits only allowlisted manifest/configuration inspection
and context assembly. It must observe zero code execution, network access,
secret access, hook invocation, governed mutation, model calls, or agent starts.

## Remediation invariant

Claude Action, Agent Workflow remediation scheduling, Fusion Harness remediation
execution, Autofix, automatic commits, automatic pushes, automatic merges,
releases, and deployments remain absent or explicitly disabled.

## Preimplementation failure

The required command is `python scripts/validate-contracts.py`. At fixture
definition time the entry point and schemas do not exist, so the expected result
is a nonzero failure. This is the validation-first red state; implementation
must make the catalog pass without changing its expected outcomes.

Observed on 2026-07-28: exit `2`, because
`scripts/validate-contracts.py` did not yet exist. The initial 25 JSON fixtures
and eight YAML fixtures parsed successfully before that expected failure.
Review remediation later added six focused negative JSON cases without
changing any original expected outcome.
