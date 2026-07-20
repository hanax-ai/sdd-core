# Evidence-Based Skill Lifecycle

> **NON-AUTHORITATIVE WIP ITEM — grants no implementation authority.**
> Status and approval state below govern what may happen next. Silence or praise is
> not approval; approvals are item-specific and action-specific (see `wip/README.md`).

## Metadata

- **Purpose:** extend SDD-Core skill governance so every new or materially changed skill progresses through an empirical draft → evaluate → revise lifecycle instead of being treated as finished at authoring time.
- **Scope:** workspace
- **Status:** exploring
- **Created:** 2026-07-19 · **Last touched:** 2026-07-20
- **Synthesis lead:** claude-root-alpha (item creator, per default rule)
- **Active contributors:** claude-root-alpha
- **Current workstreams:** — (none claimed)
- **Contribution status:** open-for-contributions
- **Last synchronized commit:** 8afd8c1 (main HEAD the initial synthesis integrated against)
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

## Open questions

- Exempt the evaluation environment from Article I, or redesign evaluation to run on
  Ollama? Which is acceptable to the maintainer?
- Where does the eval harness itself live (committed scripts vs machine tooling), and
  does it enter `knowledge/tooling.md` as a governed tool?
- Should `skills-creator` move (or be mirrored) to the workspace root as part of this
  change, and does that require its own governed change first?
- What graduates an existing skill (authored pre-lifecycle) into "evaluated" status —
  retroactive evals for all 8+ workspace skills, or only on material change?
- Is `evals/evals.json` schema borrowed from upstream or defined fresh (upstream
  schemas were not attached)?

## Proposed next step

Refine to `review-ready`, then request Gate 1 promotion into a formal workspace
proposal: "Establish an Evidence-Based Skill Lifecycle" — extending skills-creator
part 4 and the governed skill/tooling workflow, with the Article I/III resolutions
decided by the maintainer during specification. (A suggestion, not an authorization.)
