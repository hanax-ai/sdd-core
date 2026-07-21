# governance-framework — the what and why

The workspace's governance DESIGN layer. Relatively stable; changes deliberately.
This project owns the definitional artifacts of governance: principles, policies,
standards, specifications, decision-rights and RACI models, control definitions,
maturity models, and the methodology documentation itself. Its operational
counterpart is [`../governance-ops/`](../governance-ops/) — the "how and when" —
which puts this framework into recurring practice.

**The boundary test (constitution Article II):** does the artifact DEFINE a
standard (belongs here), or EVIDENCE execution (belongs in governance-ops)?
Specs live here; the process of reviewing and maintaining specs runs in
governance-ops. The full boundary table is in
[`.specify/memory/constitution.md`](.specify/memory/constitution.md).

## Structure

```text
governance-framework/
├── README.md                    # This file: structure + methodology
├── .specify/
│   └── memory/
│       └── constitution.md      # Project constitution (scope, boundary test, change discipline)
├── .claude/
│   └── skills/
│       ├── mirror-sync/         # Article IV implementation aid (mirror lookups)
│       └── skills-creator/      # Workspace skill-authoring instructions
├── conversations/
│   └── SYNC-POLICY.md           # Sync destination policy (record contents git-ignored)
├── docs/
│   └── specs/                   # Feature lifecycle folders (spec → plan → tasks)
│       ├── README.md
│       └── template/            # Copy to NNN-feature-name/ to start a feature
├── knowledge/
│   └── instructions.md          # Project playbook: standards register, slicing, token rules
└── reference/                   # Project-local reference mirrors (sliced, manifest-first)
```

## Methodology

Every deliverable is spec-first (root constitution Article V):

1. Copy `docs/specs/template/` to `docs/specs/NNN-feature-name/`.
2. Complete `spec.md` (what/why) — resolve every ambiguity row before planning.
3. Complete `plan.md` (how), then `tasks.md` (ordered execution), then execute.

Workspace-scoped deliverables carry the additional wip/ two-gate discipline:
ideas brainstorm in root `wip/`, promote to `docs/proposals/` on Gate 1, and the
resulting specification here executes only on Gate 2
(`Approved for implementation: <spec>`) — both gates are Agent Zero's alone.

Standards authored here are versioned with change rationales
(constitution Article III). High-churn operational records never accumulate in
this tree — they belong to governance-ops.

**Spec placement rule (Agent Zero, 2026-07-20):** specs live at sub-project
level, never at the workspace root. Workspace/tooling deliverables are owned by
this project. First planned feature:
`docs/specs/001-evidence-based-skill-lifecycle/` — the specification derived
from the Gate-1-promoted proposal
[`../../docs/proposals/evidence-based-skill-lifecycle.md`](../../docs/proposals/evidence-based-skill-lifecycle.md)
(folder created when spec authoring begins).
