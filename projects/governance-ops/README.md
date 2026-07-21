# governance-ops — the how and when

The workspace's governance OPERATIONAL layer. Living and high-churn. This project
owns the recurring activities that put the governance framework into practice:
runbooks, review cadences, checklists, intake and approval workflows, dashboards,
and evidence of controls actually being executed. Its definitional counterpart is
[`../governance-framework/`](../governance-framework/) — the "what and why" —
whose standards every activity here operationalizes and cites.

**The boundary test (constitution Article II):** does the artifact EVIDENCE or
OPERATE execution (belongs here), or DEFINE a standard (belongs in
governance-framework)? The spec review/approval/maintenance process runs here;
the specs themselves live in governance-framework. The full boundary table —
including what stays at the root GLOBAL tier (conversations/, wip/, the machine
Install Registry) — is in
[`.specify/memory/constitution.md`](.specify/memory/constitution.md).

## Structure

```text
governance-ops/
├── README.md                    # This file: structure + methodology
├── .specify/
│   └── memory/
│       └── constitution.md      # Project constitution (scope, boundary test, record discipline)
├── conversations/
│   └── SYNC-POLICY.md           # Sync destination policy (record contents git-ignored)
├── docs/
│   └── specs/                   # Feature lifecycle folders (spec → plan → tasks)
│       ├── README.md
│       └── template/            # Copy to NNN-feature-name/ to start a feature
├── knowledge/
│   └── instructions.md          # Project playbook: runbook register, record conventions
└── reference/                   # Project-local reference material (sliced, manifest-first)
```

**Intended operational directories (documented, not yet scaffolded):** `runbooks/`
and `records/` are created by this project's first real features — each arrives
through the spec lifecycle below, not by empty scaffolding.

## Methodology

New operational CAPABILITIES (a workflow system, dashboard, intake mechanism) are
spec-first (root constitution Article V):

1. Copy `docs/specs/template/` to `docs/specs/NNN-feature-name/`.
2. Complete `spec.md` (what/why) — resolve every ambiguity row before planning.
3. Complete `plan.md` (how), then `tasks.md` (ordered execution), then execute.

Routine execution of an established runbook does not require a spec — it requires
the record discipline of constitution Article III: dated, append-oriented records;
every activity citing the governance-framework standard it operationalizes;
environment aliases only, never secrets or tenant identifiers.
