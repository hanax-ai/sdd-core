# Standard ST-001 — Deliverables & Ownership

**Version:** 1.0.0 · **Status:** active · **Effective:** 2026-07-20 ·
**Authored:** direct governed change on maintainer directive (Agent Zero,
2026-07-20; paired-model decision) — future MATERIAL changes to this standard
flow spec-first per the project constitution (Article III).

The authoritative DEFINITIONS side of the workspace's deliverables inventory.
The LIVING side — actual owners, operational status, review dates, exceptions —
is the governance-ops register
(`../../governance-ops/registers/deliverables.md`), which implements this
standard read-only and never redefines it. Root GLOBAL carries a concise
navigation index only (`docs/deliverables-index.md`), never a competing
authority.

## 1. What is a deliverable

A deliverable is a named, durable artifact set the workspace commits to
maintaining, at one of three layers (constitution Article II routing):

| Layer | Deliverable classes |
|-------|--------------------|
| Root GLOBAL | Root constitution; mirror/tooling registries; conversation-record governance; wip/ governance; workspace proposals; root skills & hooks; CI + verification; OSS/legal corpus (LICENSE, CONTRIBUTING, SECURITY, CHANGELOG) |
| governance-framework | Project constitution; standards (this registry's entries); framework-definition specs; project playbook; project skills |
| governance-ops | Project constitution; operational registers; evidence policy + templates; operational-capability specs; runbooks (when built) |

Granularity rule: register at the level a single owner can meaningfully answer
for — a corpus or register, not every file.

## 2. Ownership roles (definitions — assignments live in the ops register)

| Role | Definition |
|------|-----------|
| Workspace Maintainer (Agent Zero) | Directing authority; sole Gate 1 / Gate 2 issuer — NON-DELEGABLE (constitutions' Root GLOBAL supremacy statements) |
| Deliverable Owner | Accountable identity for a register row: keeps it current, answers reviews, raises exceptions |
| Operating Agent | Agent identity performing maintenance under the owner (e.g. `claude-root-alpha`) |
| Contributor | Any identity submitting changes under CONTRIBUTING.md and the WIP protocol |

Identity validity: humans = GitHub handle; agents =
`claude-<role>-<assigned-name-or-short-id>` (same rule as `wip/_index.md`).
Bare roles are not valid register identities; personal data beyond public
maintainer roles never appears.

## 3. Decision rights

| Decision | Right holder |
|----------|--------------|
| Define/retire a deliverable class (amend this standard) | Workspace Maintainer, spec-first for material change |
| Add/retire a register row | Deliverable Owner proposes; Workspace Maintainer confirms |
| Assign/rotate an owner | Workspace Maintainer |
| Execute maintenance | Operating Agent / Owner |
| Declare an exception | Owner (recorded in the register row); Maintainer resolves |
| Audit the register against reality | Any contributor may flag; Maintainer adjudicates |

## 4. Maintenance standard for the inventory itself

- Every register row carries: deliverable ID (`DEL-NNN`), layer, artifact
  set, owner, operating agent (or —), status
  (`active | at-risk | retiring | retired`), last-review date, next-review
  due, exceptions.
- Review cadence: each row at least every 90 days, and at every material
  change of its artifact set; the reviewer updates last/next dates in the same
  change.
- A row whose next-review date has passed is STALE: flag at next governed
  change touching its artifacts; stale > 30 days → status `at-risk`.
- Register changes are ordinary governed changes (append-oriented history via
  git); the register never gates or redefines this standard — one-way
  dependency (ops constitution Article III).
