## What changed and why

<!-- One paragraph. Every changed line should trace to this. -->

## Authority

<!-- Cite the exact human directive, governed artifact revision/digest, scope,
and next authority boundary. Review, CI, or tool output is not authority. -->

## Evidence

<!-- Link deterministic validation, review coverage, tool-health state, and
project-owned evidence separately. Do not collapse these into approval. -->

## Governance checklist

- [ ] Edit set is scoped and named; nothing unrelated touched
- [ ] `verify-layout.sh` passes (CI output is evidence, not approval)
- [ ] Structural additions update `verify-layout.sh` required paths + README layout in this same change
- [ ] No secrets, credentials, connection material, personal paths, or private data
- [ ] External-repository work has separate exact authority
- [ ] WIP content claims no approval; promotion and implementation require exact Gate 1 and Gate 2 directives
- [ ] Constitutional text is untouched, or amended through its documented procedure with a version bump
- [ ] AI review coverage, tool health, integration state, Workflow state, and human authority are reported separately
- [ ] Agentic remediation, Autofix, automatic commit/push/PR/merge, release, and deployment remain disabled
