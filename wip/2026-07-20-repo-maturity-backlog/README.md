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
- **Last synchronized commit:** cba817f (main HEAD this synthesis integrated against)
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

1. **LICENSE** — ✅ DONE (commit `981f0a2`): Agent Zero chose Apache-2.0
   (2026-07-20); canonical text added, README License section + layout tree,
   verify-layout entry. Success-language sub-item: grep found no over-claiming
   language in the current README (only lifecycle instructions matched) — the
   "previously agreed safe criterion" could not be located in any session
   record; checked and closed with that caveat, reopen if the criterion
   resurfaces.
2. **CI policy + workflow** — ✅ DONE (commit `017f811`): Agent Zero chose
   OPTIONAL FEEDBACK, not a required merge gate (2026-07-20). Workflow
   `.github/workflows/verify-layout.yml`: contents:read only, checkout pinned
   to full SHA, persist-credentials false; policy documented in the workflow
   header and README.
3. **First concrete framework-definition demonstrator** — the
   evidence-based-skill-lifecycle normative standard spec is the natural
   candidate. Already staged: three-way spec split ratified; spec-authoring
   riders committed in the lifecycle WIP item (commit `fe05792`). This backlog
   item tracks it only as a dependency — the work itself stays coordinated with
   the promoted proposal.
4. **OSS hygiene pack** — ✅ DONE (commit `5158888`): CONTRIBUTING.md (routes
   through workspace governance), SECURITY.md (private vulnerability reporting
   + public-template threat model), CHANGELOG.md (Keep-a-Changelog style),
   issue templates (defect, idea-with-wip-routing), PR template with
   governance checklist.

**Next (maintainer-ordered 2026-07-20: 5 → 6 → 8 → 7):**

5. **Evidence-class operationalization** — ✅ DONE as POLICY operationalization
   (commit `cba817f`): `.gitignore` class patterns (real records ignored by
   default; policy README + synthetic `*.template.md` re-included — verified
   mechanically), `records/README.md` policy home (record shape,
   safe-reference format `[EXT] alias · id · date`, class-2 retention default:
   next successful review + 30 days, maintainer prunes), class-1
   control-execution template. The evidence SYSTEM itself (intake, dashboards,
   pipelines) remains spec-first per the ops constitution.
6. **Deliverables inventory / living ownership map** — shape RESOLVED
   (maintainer, 2026-07-20): paired model — governance-framework holds the
   authoritative deliverable definitions, ownership roles, decision rights,
   and maintenance standard; governance-ops holds the living assignment
   register (actual owners, operational status, review dates, exceptions);
   Root GLOBAL gets a concise navigation index only, never a competing
   authority. Valid identities only.
7. **Portability adapters** — AGENTS.md or equivalent, explicit precedence
   statement BENEATH the constitution and five-step loading order, compatibility
   matrix, minimal smoke tests. (Ordered LAST.)
8. **verify-layout content checks** — harden beyond existence-only: selected
   content checks for constitutional invariants (supremacy statements, routing
   tables, version footers). (Ordered before item 7.)

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

- ~~LICENSE: MIT or Apache-2.0?~~ — RESOLVED: Apache-2.0 (Agent Zero,
  2026-07-20; commit `981f0a2`).
- ~~CI: optional feedback or required merge gate?~~ — RESOLVED: optional
  feedback (Agent Zero, 2026-07-20; commit `017f811`).
- ~~Item 6 shape?~~ — RESOLVED: paired model (framework definitions + ops
  living register + root navigation index only; maintainer, 2026-07-20).

## Proposed next step

Immediate tier complete (1, 2, 4) and item 5 done; maintainer verified the
tier read-only (2026-07-20) — LICENSE text confirmed matching canonical
Apache-2.0 (leading blank line added afterward for byte-parity), CI hardening
confirmed, hygiene pack confirmed aligned. Remaining order: 6 → 8 → 7, each as
its own governed change. Item 3 (demonstrator) stays UNTOUCHED until Agent
Zero intentionally authorizes lifecycle specification authoring.
