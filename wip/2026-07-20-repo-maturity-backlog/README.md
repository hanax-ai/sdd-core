# Repository Maturity Backlog

> **NON-AUTHORITATIVE WIP ITEM — grants no implementation authority.**
> Status and approval state below govern what may happen next. Silence or praise is
> not approval; approvals are item-specific and action-specific (see `wip/README.md`).

## Metadata

- **Purpose:** track the maintainer-identified repository maturity gaps (legal foundation, automation, demonstrable content, OSS hygiene, portability, evidence operationalization) as bounded, decision-gated work items.
- **Scope:** workspace
- **Status:** exploring
- **Created:** 2026-07-20 · **Last touched:** 2026-07-20
- **Synthesis lead:** claude-root-alpha (item creator, per default rule)
- **Active contributors:** claude-root-alpha
- **Current workstreams:** — (none claimed)
- **Contribution status:** open-for-contributions
- **Last synchronized commit:** 61ba05e (main HEAD this synthesis integrated against)
- **Approval state:** NOT APPROVED — exploration only
- **Gate 1 (promotion) evidence:** —
- **Promotion target:** —
- **Target status (mirror, non-authoritative):** —

## Problem or opportunity

The Workspace Maintainer's 2026-07-20 feedback (verbatim source in
`supporting-materials/maintainer-feedback-remaining-gaps.md`) confirms the
repository is architecturally coherent post-rescope and names the remaining work
as the classic maturity backlog. None of these items were claimed closed by the
rescope round; all can now proceed "safely as framework-first bounded work
without risking root displacement or ops redefinition of standards" (source, 
Bottom line). The one residual defect the feedback named (project README
spec-routing wording) was fixed immediately in commit `61ba05e` and is out of
scope here.

## Backlog (maintainer-prioritized)

**Immediate / framework-first:**

1. **LICENSE** — no license file; primary legal blocker for safe external reuse.
   Maintainer-suggested candidates: MIT or Apache-2.0. Plus README reference and
   softening of any success language to the previously agreed safe criterion.
   OPEN DECISION: license choice (Agent Zero).
2. **CI policy + workflow** — no `.github/`, no CI. Decide optional-feedback vs
   required-merge-gate; if required, implement least-privilege, full-SHA-pinned
   Actions workflow around `verify-layout.sh`. OPEN DECISION: CI policy
   (Agent Zero).
3. **First concrete framework-definition demonstrator** — the
   evidence-based-skill-lifecycle normative standard spec is the natural
   candidate. Already staged: three-way spec split ratified; spec-authoring
   riders committed in the lifecycle WIP item (commit `fe05792`). This backlog
   item tracks it only as a dependency — the work itself stays coordinated with
   the promoted proposal.
4. **OSS hygiene pack** — CONTRIBUTING.md, SECURITY.md (with threat model),
   CHANGELOG.md, basic issue/PR templates.

**Next:**

5. **Evidence-class operationalization** — the three classes are defined in the
   governance-ops constitution (v1.1.0); still missing: matching `.gitignore`
   patterns, retention/sync policy elaboration, and the concrete evidence-system
   directory structure under governance-ops (spec-first, per its constitution).
6. **Deliverables inventory / living ownership map** — first-class artifact,
   three-layered (Root GLOBAL / framework / ops), valid identities only.
7. **Portability adapters** — AGENTS.md or equivalent, explicit precedence
   statement BENEATH the constitution and five-step loading order, compatibility
   matrix, minimal smoke tests.
8. **verify-layout content checks** — harden beyond existence-only: selected
   content checks for constitutional invariants (supremacy statements, routing
   tables, version footers).

## Assumptions

- Backlog items are individually small enough to run as bounded governed changes
  or single features; none requires a root constitution amendment on its face
  (any that turns out to → formal Amendment Procedure, per the process
  constraints below).

## Alternatives

- Do nothing: repository stays a governance-sound template with known maturity
  gaps (legal reuse remains blocked by the missing LICENSE).
- Bulk-implement without decisions: rejected — LICENSE choice and CI policy are
  maintainer decisions; the process constraints require bounded, gated work.

## Risks and constraints

- **Process constraints (maintainer-stated, source doc):** continue under the
  umbrella + bounded WIP model; Agent Zero remains sole Gate 1 / Gate 2
  authority; further root constitution changes follow the formal Amendment
  Procedure; skill-placement decisions affecting the promoted lifecycle proposal
  stay coordinated with it.
- **Public repository:** SECURITY.md threat model and evidence-class
  operationalization must not leak real operational details; synthetic examples
  only (governance-ops constitution Article III).
- **Root GLOBAL supremacy:** items 1, 2, 4, 7, 8 touch root-tier files — they
  are root-scoped governed changes, never project-spec-authorized work.

## Open questions

- LICENSE: MIT or Apache-2.0? (Agent Zero)
- CI: optional feedback or required merge gate? (Agent Zero)
- Item 6 shape: standalone committed artifact at root, or governance-framework
  standard + governance-ops register pair?

## Proposed next step

Agent Zero picks the immediate items to execute now (1, 2, 4 are independent
bounded changes; 3 rides the lifecycle spec). Each executes as its own governed
change with registry logging; items promoting into formal artifacts follow the
normal Gate 1 routing.
