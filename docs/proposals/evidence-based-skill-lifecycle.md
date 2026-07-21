# Workspace Proposal: Evidence-Based Skill Lifecycle

## Provenance

1. **Originating WIP item:** "Evidence-Based Skill Lifecycle"
   (`wip/2026-07-19-evidence-based-skill-lifecycle/`)
2. **WIP creation date:** 2026-07-19
3. **Promotion approval directive (verbatim):**
   `Approved for promotion: 2026-07-19-evidence-based-skill-lifecycle → docs/proposals/evidence-based-skill-lifecycle.md`
   — issued 2026-07-20, against item revision commit `bc7bb91`.
4. **Approving authority:** Agent Zero (the Workspace Maintainer's directing
   authority).
5. **Summary of the approved idea:** extend SDD-Core skill governance so every new
   or materially changed skill progresses through an empirical draft → evaluate →
   revise lifecycle — committed behavioral/trigger evaluations with baselines,
   machine-local run evidence, and human review — instead of being treated as
   finished at authoring time. Piloted on session-capture (root tier) and
   mirror-sync (project tier); machine tier covered by post-pilot
   conversation-sync backfill.
6. **Target artifact path (self-reference):**
   `docs/proposals/evidence-based-skill-lifecycle.md`

This section freezes what Gate 1 approved. The WIP item remains a living document;
where they diverge, this Provenance section is the stable citation for what was
approved.

## Status

**Proposed — NOT approved for implementation.** Gate 1 promotion authorizes this
proposal's existence only. Implementation requires the normal SDD lifecycle
(specification → plan → tasks) and an explicit Gate 2 directive
(`Approved for implementation: <exact specification or plan>`) from Agent Zero.
Nothing in this document authorizes creating skills, directories, registries,
tooling rows, or moves of existing skills.

## Problem

SDD-Core governs where skills live, how they are named and triggered, tier
boundaries, registry updates, and expected validation scenarios — but a written
SKILL.md is treated as a completed capability. Existing validation consists of
specified scenarios (e.g. session-capture S1–S6), not measured evaluations. An
upstream "Skill Creator" reference (reviewed source in the WIP item's
`supporting-materials/`; upstream repository/revision unverified; companion
tooling never attached) supplies the missing empirical improvement lifecycle.
This proposal adapts that lifecycle to SDD-Core's governance rather than adopting
the upstream system as-is.

## Proposed lifecycle (the standard being ratified)

Every NEW skill and every MATERIAL change to an existing skill progresses through:

Intent → Placement → Draft → Structural validation → Trigger evaluation →
Behavioral evaluation → Human review → Revision → Live verification → Registration.

A SKILL.md is a draft until evaluated; iteration continues until feedback is
clear, progress stops, or the maintainer approves completion. SKILL.md files stay
lean: detailed guidance in `references/`, deterministic work in `scripts/`,
reusable templates in `assets/`.

## Requirements

### R1 — Constitutional basis

Constitution v2.0.0 (2026-07-20, commit `000eec6`) Article I context-split
expressly permits development/workspace-agent inference with maintainer-approved
hosted models. Skill evaluations (e.g. `claude -p` runs) are constitutional with
no exemption text, subject to ALL Article I conditions: Endpoint Discipline,
Article III isolation, tooling governance, and no customer-data egress.

### R2 — Central committed evaluation registry

One committed home for every tier (root, project, and machine — machine-tier
SKILL.md files are per-machine and have no committable sibling location):

- `.claude/skill-evals/registry.md` — one row per skill:
  name | tier | canonical skill path | evals path | fixtures path.
- `.claude/skill-evals/<skill>/evals.json` — the committed evaluation cases.
- Run outputs stay machine-local under
  `~/.sdd-core-ops/artifacts/skill-evals/<skill>/<iteration>/` — never committed,
  never inside skill directories.
- The evaluation runner enters `knowledge/tooling.md` as a governed tool at
  authoring time.

### R3 — skills-creator moves to workspace root

Single source at `.claude/skills/skills-creator/` (root tier reliably serves root
and sub-project sessions via ancestor discovery). project-a keeps no duplicate;
its committed copy is removed in the same governed change (git history preserves
provenance). Executed as its own governed change with registry and tooling.md
updates.

### R4 — Retroactive evaluation policy

Evals are mandatory for NEW skills and MATERIAL changes only. No blanket backfill
of all existing workspace skills (currently 7 across root, project, and machine
tiers). Opportunistic backfill starts with the three highest-behavioral-risk
skills: conversation-sync, mirror-sync, session-capture — the ones whose failures
corrupt records or ground truth.

### R5 — evals.json schema v1 (reproducibility-complete)

Defined fresh (no upstream schemas were attached). The implementing specification
MUST define schema v1 with at least: per-case `id` and `type` (trigger
expectations SEPARATE from behavioral expectations); assertions as objects —
assertion id, type, check method (exact-match | regex | file-exists |
command-exit | transcript-grep | human-graded), expected result; baseline
identity (`none` | `previous-release@<ref>` | `previous-iteration@<n>`); fixture
path + content hash; required output/artifact definitions; model + evaluator
versions; timeout and repetition count; result-evidence and grading fields; and
acceptance + non-regression thresholds. Sketch:

```json
{ "id": "…", "type": "trigger|negative-trigger|behavioral", "prompt": "…",
  "fixture": {"path": "…", "sha1": "…"}, "baseline": {"kind": "…", "ref": "…"},
  "assertions": [{"id": "…", "check": "…", "expect": "…"}],
  "run": {"model": "…", "evaluator": "…", "timeout_s": 0, "repeats": 0},
  "thresholds": {"accept": "…", "non_regression": "…"},
  "results": {} }
```

Objective checks only where mechanically verifiable; human review reserved for
quality/judgment calls. Tests run against BOTH the new skill and a baseline
(no skill / previous version); execution transcripts are inspected, not just
final outputs; fresh isolated test contexts so authoring context cannot mask
defects.

### R6 — skill-evaluator naming, routing, precedence

The evaluation lifecycle skill is named `skill-evaluator` — NOT `skill-creator`
(upstream's name) nor `skills-creator` (SDD-Core's governance skill). Routing:
`skills-creator` remains the single entry point for "create a skill" (placement,
naming, registration) and HANDS OFF to `skill-evaluator` at the draft → evaluate
stage; `skill-evaluator` triggers only on evaluate/benchmark/iterate phrasings,
never on creation phrasings. Precedence: governance first (placement before
evaluation), evaluator during draft/iterate/regression. The upstream
skill-creator is NOT installed — it stays a reviewed reference only. Independent
trigger testing covers should-trigger, difficult should-not-trigger, natural
phrasing/abbreviations/typos, and near-miss prompts that could activate the
wrong skill.

### R7 — Evaluation-environment safety controls

Beyond Article III filesystem isolation, the implementing specification MUST
define: fixture isolation (fixtures and working directories under Ops Home only,
never repo or customer material); a SYNTHETIC-DATA-ONLY rule for fixtures (no
real records, hosts, tenants, or personal data — Endpoint Discipline applied to
eval inputs); network/tool restrictions for eval runs (no MCP servers, no web
access, minimal tool set); secret scanning of prompts AND outputs before
retention; transcript redaction rules; a retention window (proposed here: until
acceptance + 30 days, maintainer prunes — the existing Gate 6 backup discipline
defines pre-edit backup + hash logging only and has no retention window); and an
evidence cleanup procedure for failed or abandoned iterations. Evaluation agents
run against isolated fixtures or worktrees and must not receive permission to
modify root or sibling-project artifacts.

## Adoption plan

1. Ratify the lifecycle stages (R1 cites the constitutional basis) and the
   safety controls (R7).
2. Governed change: move skills-creator to root (R3) with the
   naming/routing/precedence split versus `skill-evaluator` (R6); extend its
   part 4 with the lifecycle stages so every new or materially changed skill
   inherits them.
3. Author the `skill-evaluator` runner skill, evals.json schema v1, and the
   central `.claude/skill-evals/` registry (R2, R5, R6); register all of it.
4. Pilot (scope decided by Agent Zero, 2026-07-20 — Option B, two skills across
   two tiers):
   - **session-capture** (root tier): convert S1–S6 into executable evals with
     baselines, trigger/near-miss tests, and synthetic conversation fixtures
     (scope, dedup, missing dependencies, secrets, unratified chat); finish with
     a fresh-session live integration test. Trigger evaluation includes
     root-skill DISCOVERABILITY: runs from repo-root vs out-of-repo session
     contexts (closes the tracked discoverability question per maintainer
     decision "1 now + 3 later", 2026-07-20).
   - **mirror-sync** (project tier): mechanically assertable evals over its five
     validation gates (missing mirror path, placeholder pin, missing
     `_index.md`, phantom slices, absent-framework routing), reusing the G7
     dry-run fixtures and registry seed rows. This leg proves the central
     registry's tier claims and the R7/Article III isolation property.
   Evidence to Ops Home. Machine tier is deliberately NOT in the pilot.
   The pilot also serves to demonstrate that evaluation runs can satisfy the
   full R7 control set (Endpoint Discipline on eval inputs, isolation,
   no customer-data egress) — an assumption until demonstrated.
5. Backfill conversation-sync evals (R4; mirror-sync evals are already produced
   by the pilot's project-tier leg in step 4). Report results; maintainer
   reviews before the lifecycle becomes required practice.

## Alternatives considered (recorded in the WIP item)

- Do nothing: keep specified-scenario validation only (cheapest, no measurement).
- Advisory checklist prose in skills-creator without eval tooling (low cost, no
  mechanical evidence).
- Full adoption of the upstream system as-is (rejected by the source review:
  missing companion tooling and, at the time, constitutional conflicts).
