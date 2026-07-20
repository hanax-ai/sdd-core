# Evidence-Based Skill Lifecycle

> **NON-AUTHORITATIVE WIP ITEM — grants no implementation authority.**
> Status and approval state below govern what may happen next. Silence or praise is
> not approval; approvals are item-specific and action-specific (see `wip/README.md`).

## Metadata

- **Purpose:** extend SDD-Core skill governance so every new or materially changed skill progresses through an empirical draft → evaluate → revise lifecycle instead of being treated as finished at authoring time.
- **Scope:** workspace
- **Status:** review-ready
- **Created:** 2026-07-19 · **Last touched:** 2026-07-20
- **Synthesis lead:** claude-root-alpha (item creator, per default rule)
- **Active contributors:** claude-root-alpha
- **Current workstreams:** — (none claimed)
- **Contribution status:** frozen-for-review
- **Last synchronized commit:** 7f23f16 (main HEAD this synthesis integrated against)
- **Approval state:** NOT APPROVED — exploration only
- **Gate 1 (promotion) evidence:** —
- **Promotion target:** —
- **Target status (mirror, non-authoritative):** —

## Problem or opportunity

SDD-Core governs where skills live, how they are named/triggered, tier boundaries,
registry updates, and expected validation scenarios — but a written SKILL.md is treated
as a completed capability. Existing validation is specified scenarios (e.g.
session-capture S1–S6), not measured evaluations. An upstream "Skill Creator" reference
(source doc in `supporting-materials/`) supplies the missing empirical improvement lifecycle:
capture intent → draft → realistic tests → skill-enabled vs baseline runs → objective
grading → human qualitative feedback → revise and repeat → separate trigger-accuracy
optimization.

## Ideas being explored

- Adopt the lifecycle: Intent → Placement → Draft → Structural validation → Trigger
  evaluation → Behavioral evaluation → Human review → Revision → Live verification →
  Registration.
- Treat every SKILL.md as a draft until evaluated; iterate until feedback is clear,
  progress stops, or the maintainer approves completion.
- Commit realistic behavioral tests at `.claude/skills/<skill>/evals/evals.json`;
  keep generated evaluation evidence machine-local at
  `~/.sdd-core-ops/artifacts/skill-evals/<skill>/<iteration>/`.
- Test against BOTH the new skill and a baseline (no skill / previous version);
  objective assertions only where mechanically verifiable; human review preserved for
  quality/judgment; inspect execution transcripts, not just final outputs; fresh
  isolated test contexts so authoring context cannot mask defects.
- Independent trigger testing: should-trigger, difficult should-not-trigger, natural
  phrasing/abbreviations/typos, near-miss prompts that could activate the wrong skill.
- Keep SKILL.md lean: detailed guidance to `references/`, deterministic work to
  `scripts/`, reusable templates to `assets/`.
- First application candidate: convert session-capture S1–S6 into executable
  evaluation cases with baselines, trigger/near-miss tests, synthetic conversation
  fixtures (scope, dedup, missing dependencies, secrets, unratified chat), finishing
  with a fresh-session live integration test.

## Assumptions

- The upstream SKILL.md's companion resources (eval/aggregation scripts, viewer,
  grader/comparator/analyzer agent instructions, JSON schemas, packaging and
  trigger-optimization scripts) were NOT attached — without them the reference is
  guidance, not a functioning evaluation system; SDD-Core would build or adapt its own.
- Evaluation runs can be made compatible with SDD-Core's inference constraints
  (unvalidated — see Risks).

## Alternatives

- Do nothing: keep specified-scenario validation only (status quo; cheapest, no
  measurement).
- Adopt evaluation practices as advisory checklist prose in skills-creator without
  eval tooling (low cost, no mechanical evidence).
- Full adoption of the upstream system as-is (rejected by the source review: missing
  companions + constitutional conflicts).

## Risks and constraints

- **Article I conflict:** upstream workflow uses Claude subagents and `claude -p`;
  SDD-Core's constitution requires local open-source models via Ollama only. Needs an
  explicit exemption for the evaluation environment or a redesign to Ollama-driven
  evaluation. Authoritative artifact prevails until amended.
- **Article III scope:** evaluation agents must run against isolated fixtures or
  worktrees; they must not receive permission to modify root or sibling-project
  artifacts.
- **Artifact hygiene:** generated evaluation workspaces must not pollute committed
  skill directories (hence the committed-evals / machine-local-evidence split).
- **Trigger overlap:** upstream "skill-creator" and SDD-Core's `skills-creator` both
  answer "create a skill" — responsibilities must be split explicitly (upstream:
  drafting/evaluation/benchmarking/iteration; SDD-Core: tier placement, scope, naming,
  registries, constitutional compliance).
- **Root availability:** SDD-Core's `skills-creator` lives under
  `projects/project-a/.claude/skills/` — it does not reliably govern root-level skill
  creation from workspace-root sessions; placement should be reconsidered.

## Proposed positions (refined for review — proposals, not decisions)

Each former open question now carries a recommended position for Agent Zero to accept,
modify, or reject at Gate 1 review. None is a decision until ratified in the promoted
artifact.

1. **Article I vs `claude -p` evaluation → documented interpretation, amendment as
   fallback.** Skill evaluations probe CLAUDE behavior — running them on Ollama
   measures the wrong system. Article I's rationale targets the workspace's PRODUCT
   inference (subsystems, customer-adjacent pipelines); machine-tier verification
   probes are development tooling. Precedent: the maintainer-ratified canonical plan
   itself mandated `claude -p` probe sessions (G3/G4 probes, dry-runs, fresh-session
   validations) — the workspace already operates on this interpretation. Proposal:
   the promoted artifact records this interpretation explicitly (machine-tier skill
   evaluation exempt from Article I; product inference unchanged); if the maintainer
   prefers hard text, a PATCH/MINOR Article I clarification via the Amendment
   Procedure is the fallback.
2. **Harness location → split committed/machine like everything else.** Committed:
   per-skill `.claude/skills/<skill>/evals/evals.json` (expected-behavior
   declaration) + a governed runner skill (root tier) once authored. Machine-local:
   all run outputs under `~/.sdd-core-ops/artifacts/skill-evals/<skill>/<iteration>/`.
   The runner enters `knowledge/tooling.md` as a governed tool at authoring time
   (skills-creator part 4 applies to it like any other skill).
3. **skills-creator root placement → move to workspace root.** Single source at
   `.claude/skills/skills-creator/` (root tier reliably serves root + sub-project
   sessions via ancestor discovery — the same conclusion reached for session-capture);
   project-a keeps no duplicate (its committed copy is removed in the same governed
   change; git history preserves provenance). Executed as its own governed change with
   registry + tooling.md updates.
4. **Retroactive evaluation → on material change only, plus targeted backfill.**
   Evals become mandatory for NEW skills and MATERIAL changes to existing ones. No
   blanket backfill of all 8+ workspace skills; opportunistic backfill starts with the
   three highest-behavioral-risk skills (conversation-sync, mirror-sync,
   session-capture — the ones whose failures corrupt records or ground truth).
5. **evals.json schema → defined fresh, minimal.** Upstream schemas were never
   attached, so nothing to borrow. Proposed minimal v1:
   `[{ "id", "type": "behavioral" | "trigger" | "negative-trigger", "prompt",
   "context": "<fixture ref, optional>", "expect": ["<assertion>", …],
   "baseline": true|false }]` — extensible later; assertions objective-only, with
   human review reserved for judgment calls (per the source reference).

## Proposed adoption plan (outline for the promoted artifact)

1. Ratify the Article I interpretation (position 1) and the lifecycle stages:
   Intent → Placement → Draft → Structural validation → Trigger evaluation →
   Behavioral evaluation → Human review → Revision → Live verification → Registration.
2. Governed change: move skills-creator to root (position 3); extend its part 4 with
   the lifecycle stages so every new/materially-changed skill inherits them.
3. Author the eval runner skill + evals.json schema v1 (positions 2, 5); register both.
4. Pilot: convert session-capture S1–S6 into executable evals with baselines,
   trigger/near-miss tests, synthetic fixtures; finish with a fresh-session live
   integration test. Trigger evaluation includes root-skill DISCOVERABILITY: runs
   from repo-root vs out-of-repo session contexts (closes the tracked
   discoverability question per maintainer decision "1 now + 3 later", 2026-07-20).
   Evidence to Ops Home.
5. Backfill conversation-sync and mirror-sync evals (position 4). Report results;
   maintainer reviews before the lifecycle becomes required practice.

## Remaining open questions (for Gate 1 review)

- Does the maintainer accept the Article I interpretation route, or require the
  amendment fallback up front?
- Pilot scope: session-capture only, or include one project-tier skill to exercise
  Article III isolation in the harness design?

## Proposed next step

Request Gate 1. Exact directive for Agent Zero, if approved:

`Approved for promotion: 2026-07-19-evidence-based-skill-lifecycle → formal workspace
proposal "Establish an Evidence-Based Skill Lifecycle"`

(A suggestion, not an authorization. Promotion produces the proposal artifact with its
committed Provenance section; implementation would additionally require Gate 2 on the
resulting specification.)
