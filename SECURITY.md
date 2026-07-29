# Security Policy

## Reporting a vulnerability

Use GitHub private vulnerability reporting. Do not disclose suspected sensitive
findings in a public issue.

## Threat model

SDD-Core is a public, file-native framework and governance repository. It ships
schemas, validation code, assistant adapters, and a review-only CI workflow; it
does not ship an application runtime.

Protected assets are:

1. **Secret exclusion.** No credentials, tokens, connection strings, private
   host data, tenant identifiers, customer data, or personal machine paths.
2. **Governance integrity.** Constitutions, contracts, gates, adoption records,
   and provenance must not be silently weakened or bypassed.
3. **Scope isolation.** Internal domains, adopters, external repositories, and
   machine-tier installations retain explicit write boundaries.
4. **Executable integrity.** Validation scripts, hooks, workflows, and action
   pins receive the same review as governance text. They cannot create
   authority.
5. **Supply-chain grounding.** External dependencies and actions use
   authoritative sources, immutable pins, and recorded digests.

Read-only readiness performs no network, secret, hook, model, agent, or mutation
activity. Autonomous remediation, including autonomous repository, release, or
deployment mutation, is disabled. This statement does not disable separately
authorized human-directed work.

Machine-tier tools and adopter operational data are outside SDD-Core
jurisdiction. Their owners remain responsible for their security controls.

## Supported versions

Only explicitly published release candidates and stable releases are supported.
An unmerged branch or passing CI run is not a release.
