# Security Policy

## Reporting a vulnerability

Use GitHub's **private vulnerability reporting** on this repository (Security →
Report a vulnerability). Do not open public issues for suspected sensitive
findings. The maintainer triages reports; there is no bounty program.

## Threat model (what this repository is, and is not)

sdd-core is a **public, file-only governance template**: Markdown, one shell
script (`verify-layout.sh`), and one advisory CI workflow. It ships no
application code, no dependencies, no build step, and no runtime.

**Assets worth protecting:**

1. **Absence of secrets.** The repository is designed to never contain
   credentials, hostnames, tenant identifiers, customer data, or personal data
   beyond public maintainer roles (Endpoint Discipline, root constitution;
   sync policies' must-never-sync lists; governance-ops evidence classes).
   The primary threat is accidental commitment of real operational material —
   mitigations: git-ignored record/evidence directories by default, evidence
   classed as committed-synthetic vs machine-local vs external-reference, and
   review discipline before any commit.
2. **Integrity of governance text.** Constitutions, policies, and registries
   are the workspace's control plane. Threat: a contribution that quietly
   weakens binding text (loosened article, altered approval gates, widened
   scope). Mitigations: maintainer-only amendment procedures, non-delegable
   Gate 1/Gate 2 authority, append-only registries, WIP non-authority rule
   (merged ≠ approved).
3. **Executable surface.** `verify-layout.sh` (read-only checks) and the CI
   workflow (least-privilege `contents: read`, full-SHA-pinned actions,
   `persist-credentials: false`) are the only executable content. Threat:
   malicious modification introducing exfiltration or privilege escalation.
   Mitigations: SHA pinning, minimal permissions, review of any change to
   either file. Skills and hooks under `.claude/` are ADVISORY prompts to
   agents, not mechanically executed authority — but treat changes to them as
   governance-text changes (asset 2).
4. **Supply chain.** No package dependencies by design. The only external
   references are pinned action SHAs and git-ignored local mirrors that never
   enter the repository.

**Out of scope:** machine-tier items (`~/.claude/`, `~/.sdd-core-ops/`) are
per-machine and never ship with the template; security of consumer forks'
operational content is the consumer's responsibility once real data enters
their evidence systems.

## Supported versions

The template is maintained at `main` only; consume the latest commit.
