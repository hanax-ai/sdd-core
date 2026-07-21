# Evidence-Based Skill Lifecycle

> **NON-AUTHORITATIVE WIP ITEM — grants no implementation authority.**
> Status and approval state below govern what may happen next. Silence or praise is
> not approval; approvals are item-specific and action-specific (see `wip/README.md`).

## Metadata

- **Purpose:** extend SDD-Core skill governance so every new or materially changed skill progresses through an empirical draft → evaluate → revise lifecycle instead of being treated as finished at authoring time.
- **Scope:** workspace
- **Status:** promoted
- **Created:** 2026-07-19 · **Last touched:** 2026-07-20
- **Synthesis lead:** claude-root-alpha (item creator, per default rule)
- **Active contributors:** claude-root-alpha
- **Current workstreams:** — (none claimed)
- **Contribution status:** open-for-contributions
- **Last synchronized commit:** bc7bb91 (main HEAD this synthesis integrated against)
- **Approval state:** Gate 1 APPROVED (promotion only) — NOT approved for
  implementation; Gate 2 evidence lives only in the target spec/plan
- **Gate 1 (promotion) evidence:** `Approved for promotion:
  2026-07-19-evidence-based-skill-lifecycle → docs/proposals/evidence-based-skill-lifecycle.md`
  — Agent Zero, 2026-07-20, issued against item revision `bc7bb91`
- **Promotion target:** `docs/proposals/evidence-based-skill-lifecycle.md`
- **Target status (mirror, non-authoritative):** proposed — awaiting maintainer
  review / Gate 2

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
- Commit realistic behavioral tests in the central registry at
  `.claude/skill-evals/<skill>/evals.json`, indexed in
  `.claude/skill-evals/registry.md` (see position 2); keep generated evaluation
  evidence machine-local at `~/.sdd-core-ops/artifacts/skill-evals/<skill>/<iteration>/`.
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
- Evaluation runs can satisfy the position-7 safety controls (Endpoint Discipline on
  eval inputs, Article III isolation, no customer-data egress) — to be demonstrated
  in the pilot. Article I compatibility itself is resolved (constitution v2.0.0 —
  see Risks).

## Alternatives

- Do nothing: keep specified-scenario validation only (status quo; cheapest, no
  measurement).
- Adopt evaluation practices as advisory checklist prose in skills-creator without
  eval tooling (low cost, no mechanical evidence).
- Full adoption of the upstream system as-is (rejected by the source review: missing
  companions + constitutional conflicts).

## Risks and constraints

- **Article I conflict — RESOLVED (constitution v2.0.0, 2026-07-20):** development/
  workspace-agent inference with maintainer-approved hosted models is now expressly
  permitted; the evaluation environment needs no exemption or Ollama redesign.
  Remaining obligation: evaluations honor Endpoint Discipline, Article III isolation,
  tooling governance, and the no-customer-data-egress control like any other
  workspace agent activity.
- **Article III scope:** evaluation agents must run against isolated fixtures or
  worktrees; they must not receive permission to modify root or sibling-project
  artifacts.
- **Artifact hygiene:** generated evaluation workspaces must not pollute committed
  skill directories (hence the committed-evals / machine-local-evidence split).
- **Trigger overlap:** upstream "skill-creator" and SDD-Core's `skills-creator` both
  answer "create a skill" — mitigation proposed in position 6 (name + precedence):
  the upstream skill is NOT installed (reviewed reference only); `skills-creator`
  remains the single creation entry point (placement, naming, registration) and
  hands off to the proposed `skill-evaluator` at the draft→evaluate stage;
  `skill-evaluator` triggers only on evaluate/benchmark/iterate phrasings.
- **Root availability:** SDD-Core's `skills-creator` lives under
  `projects/project-a/.claude/skills/` — it does not reliably govern root-level skill
  creation from workspace-root sessions; placement should be reconsidered.

## Proposed positions (refined for review — proposals, not decisions)

Each former open question now carries a recommended position for Agent Zero to accept,
modify, or reject at Gate 1 review. None is a decision until ratified in the promoted
artifact.

1. **Article I vs `claude -p` evaluation → RESOLVED by constitution v2.0.0
   (2026-07-20, commit `000eec6`).** The maintainer went further than this item's
   interpretation proposal: Article I was amended to context-split inference
   governance — development/workspace agents (including skill evaluation) may use
   maintainer-approved hosted models under Endpoint Discipline, Article III, tooling
   governance, and no-egress controls; Ollama-only survives as the product/runtime
   TARGET architecture. Skill evaluations with `claude -p` are now expressly
   constitutional. No exemption text is needed in the promoted artifact — it simply
   cites Article I v2.0.0.
2. **Harness location → CENTRAL committed evaluation registry (revised per review —
   per-skill `evals/` dirs fail across tiers).** A path like
   `.claude/skills/<skill>/evals/` only works for root skills; machine-tier
   conversation-sync (`~/.claude/skills/`, uncommitted) and project-tier mirror-sync
   (`projects/project-a/.claude/skills/`) have no committable sibling location.
   Revised proposal: workspace-root central registry
   `.claude/skill-evals/registry.md` (one row per skill: name | tier | canonical
   skill path | evals path | fixtures path) plus
   `.claude/skill-evals/<skill>/evals.json` — one committed home for every tier,
   including machine-tier skills whose SKILL.md itself is per-machine. Run outputs
   stay machine-local under `~/.sdd-core-ops/artifacts/skill-evals/<skill>/<iteration>/`.
   The runner enters `knowledge/tooling.md` as a governed tool at authoring time.
3. **skills-creator root placement → move to workspace root.** Single source at
   `.claude/skills/skills-creator/` (root tier reliably serves root + sub-project
   sessions via ancestor discovery — the same conclusion reached for session-capture);
   project-a keeps no duplicate (its committed copy is removed in the same governed
   change; git history preserves provenance). Executed as its own governed change with
   registry + tooling.md updates.
4. **Retroactive evaluation → on material change only, plus targeted backfill.**
   Evals become mandatory for NEW skills and MATERIAL changes to existing ones. No
   blanket backfill of all existing workspace skills (currently 7 across root,
   project, and machine tiers); opportunistic backfill starts with the
   three highest-behavioral-risk skills (conversation-sync, mirror-sync,
   session-capture — the ones whose failures corrupt records or ground truth).
5. **evals.json schema → defined fresh; v1 must be reproducibility-complete (revised
   per review — string assertions + boolean baseline cannot produce measured
   evidence).** Upstream schemas were never attached, so nothing to borrow. The
   promoted specification MUST define schema v1 with at least: per-case `id` and
   `type` (trigger expectations SEPARATE from behavioral expectations); assertions as
   objects — assertion id, type, check method (exact-match | regex | file-exists |
   command-exit | transcript-grep | human-graded), expected result; baseline identity
   (`none` | `previous-release@<ref>` | `previous-iteration@<n>`); fixture path +
   content hash; required output/artifact definitions; model + evaluator versions;
   timeout and repetition count; result-evidence and grading fields; and
   acceptance + non-regression thresholds. Sketch:
   `{ "id", "type": "trigger"|"negative-trigger"|"behavioral", "prompt",
   "fixture": {"path", "sha1"}, "baseline": {"kind", "ref"},
   "assertions": [{"id", "check", "expect"}], "run": {"model", "evaluator",
   "timeout_s", "repeats"}, "thresholds": {"accept", "non_regression"},
   "results": {…filled by runner…} }` — objective checks only; human review reserved
   for judgment calls (per the source reference).
6. **Trigger overlap with upstream skill-creator → resolve by NAME + precedence
   before any root move (added per review).** The evaluation lifecycle skill is NOT
   named `skill-creator` (upstream's name) nor `skills-creator` (SDD-Core's
   governance skill): proposed name `skill-evaluator`, description triggering on
   evaluate/benchmark/iterate phrasings only. Routing: `skills-creator` remains the
   single entry point for "create a skill" (placement, naming, registration) and
   HANDS OFF to `skill-evaluator` at the draft→evaluate stage; `skill-evaluator`
   never fires on creation phrasings. Precedence: governance first (placement before
   evaluation), evaluator during draft/iterate/regression. The upstream skill-creator
   is NOT installed — it stays a reviewed reference only.
7. **External-inference safety controls (added per review — Article I v2.0.0 permits
   hosted models; the eval environment still needs its own controls beyond Article
   III filesystem isolation).** The promoted spec MUST define: fixture isolation
   (fixtures + working dirs under Ops Home only, never repo or customer material);
   SYNTHETIC-DATA-ONLY rule for fixtures (no real records, hosts, tenants, personal
   data — Endpoint Discipline applied to eval inputs); network/tool restrictions for
   eval runs (no MCP servers, no web access, minimal tool set); secret scanning of
   prompts AND outputs before retention; transcript redaction rules; retention
   window (proposed by this item: until acceptance + 30 days, maintainer prunes —
   the existing Gate 6 backup discipline defines pre-edit backup + hash logging
   only, no retention window); evidence cleanup procedure for failed/abandoned
   iterations.

## Proposed adoption plan (outline for the promoted artifact)

1. Ratify the lifecycle stages (Article I already resolved by v2.0.0 — cite it):
   Intent → Placement → Draft → Structural validation → Trigger evaluation →
   Behavioral evaluation → Human review → Revision → Live verification → Registration.
   Ratify the eval-environment safety controls (position 7).
2. Governed change: move skills-creator to root (position 3) with the
   naming/routing/precedence split versus `skill-evaluator` (position 6); extend its
   part 4 with the lifecycle stages so every new/materially-changed skill inherits
   them.
3. Author the `skill-evaluator` runner skill + evals.json schema v1 + the central
   `.claude/skill-evals/` registry (positions 2, 5, 6); register all of it.
4. Pilot (scope decided by Agent Zero, 2026-07-20 — Option B, two skills across two
   tiers):
   - **session-capture** (root tier): convert S1–S6 into executable evals with
     baselines, trigger/near-miss tests, synthetic fixtures; finish with a
     fresh-session live integration test. Trigger evaluation includes root-skill
     DISCOVERABILITY: runs from repo-root vs out-of-repo session contexts (closes
     the tracked discoverability question per maintainer decision "1 now + 3
     later", 2026-07-20).
   - **mirror-sync** (project tier): mechanically assertable evals over its five
     validation gates (missing mirror path, placeholder pin, missing `_index.md`,
     phantom slices, absent-framework routing), reusing the G7 dry-run fixtures
     and registry seed rows. This leg proves the central registry's tier claims
     and the position-7 Article III isolation property (harness runs a
     project-tier subject without touching root or sibling artifacts).
   Evidence to Ops Home. Machine tier is deliberately NOT in the pilot;
   conversation-sync backfill covers it post-pilot (step 5).
5. Backfill conversation-sync evals (position 4; mirror-sync evals are already
   produced by the pilot's project-tier leg in step 4). Report results;
   maintainer reviews before the lifecycle becomes required practice.

## Remaining open questions (for Gate 1 review)

- ~~Article I interpretation vs amendment~~ — **RESOLVED**: constitution v2.0.0
  amended Article I (2026-07-20); evaluations under hosted models are constitutional.
- ~~Pilot scope~~ — **RESOLVED** (Agent Zero, 2026-07-20): Option B —
  session-capture (root tier) + mirror-sync (project tier), folded into adoption
  plan step 4. Machine tier via post-pilot conversation-sync backfill.

**No open questions remain.** The item is fully scoped for the Gate 1 decision.

## Proposed next step

Gate 1 GRANTED (2026-07-20) — the item promoted into
`docs/proposals/evidence-based-skill-lifecycle.md`, which carries the committed
Provenance section freezing what was approved. This item stays in place as living
provenance.

Next: normal SDD specification and planning derived from the proposal, then Gate 2
(`Approved for implementation: <exact specification or plan>`) before any
implementation. No implementation authority exists yet.

**Spec-authoring riders (Agent Zero decisions, 2026-07-20 — actions the specs
MUST carry):**

- Three-way spec split: the framework spec
  (`governance-framework/docs/specs/001-evidence-based-skill-lifecycle/`)
  carries the normative lifecycle standard; a governance-ops spec carries the
  operational evaluation procedures and evidence handling; root-GLOBAL
  implementation changes (skills-creator move, `.claude/skill-evals/`) are
  REQUESTED by the specs but authorized only by a root-scoped governed change
  at Gate 2.
- mirror-sync root-move decision point: current decision is framework-only for
  now (governance-ops has no mirrors). The spec MUST present an explicit
  decision on folding the mirror-sync root move in alongside R3's
  skills-creator move (both governance projects then covered by ancestor
  discovery). Escalation trigger: a governance-ops mirror-validation need
  materializing. Decision authority: Agent Zero.
