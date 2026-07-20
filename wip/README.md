# Work In Progress — `wip/` (GLOBAL tier, NON-AUTHORITATIVE, collaborative)

The canonical, team-accessible workspace for brainstorming and developing early-stage
ideas. WIP items are **tracked in Git and shared through GitHub** so multiple
authorized root-scoped agents and human contributors can collaborate on the same
items. This directory supports exploration and grants **no implementation authority of
any kind**.

## Core rule

Content in `wip/` is **exploratory only** — and stays exploratory **regardless of
whether it is committed, pushed, reviewed, or merged**. GitHub publication and team
agreement do NOT constitute Gate 1 promotion approval or Gate 2 implementation
approval. Claude may discuss, research, organize, and refine WIP content when
requested, but MUST NOT implement, install, deploy, promote, or modify authoritative
workspace artifacts based on it without **Agent Zero's explicit approval** (Agent
Zero = the Workspace Maintainer's directing authority).

**Silence, continued discussion, praise, or a merged pull request is NOT approval.**
Approval is always ITEM-specific and ACTION-specific, in exactly these forms:

- Gate 1: `Approved for promotion: <exact WIP item> → <exact target artifact>`
- Gate 2: `Approved for implementation: <exact specification or plan>`

Only Agent Zero may issue either.

## What belongs here

Feature ideas · process improvements · methodology experiments · skill and agent
concepts · website or architecture ideas · research notes · alternative designs ·
questions and unresolved possibilities · early diagrams, examples, and non-operational
pseudocode.

**Public visibility:** this repository is a public template — WIP items are publicly
readable and inherited by template consumers (maintainer-accepted). Secrets,
credentials, customer data, private transcripts, and sensitive machine information
must NEVER be committed here; Endpoint Discipline applies to every file.

## Prohibited assumptions

A WIP artifact must NEVER be treated as:

- an approved specification;
- a ratified decision;
- an implementation plan;
- a constitutional amendment;
- a tooling declaration;
- authorization to modify another file;
- authorization to install, execute, deploy, or publish anything.

WIP material cannot bypass the constitution, specifications, plans, registries, or
scope boundaries. A WIP item that contradicts an authoritative artifact is an idea to
evaluate — never an override. A synthesis decision inside WIP is not a ratified
workspace decision.

## Structure

```text
wip/
├── README.md                    # This file (purpose + approval policy) — committed
├── COLLABORATION.md             # Multi-agent collaboration protocol — committed
├── TEMPLATE.md                  # Standard WIP-item template — committed
├── _index.md                    # Committed canonical index of team WIP items
├── .local/                      # Machine-only scratch — git-ignored
└── YYYY-MM-DD-topic-name/       # One directory per WIP item — committed
    ├── README.md                # Canonical synthesis (synthesis lead integrates)
    ├── contributions/           # One uniquely named file per contributor/workstream
    │   ├── README.md
    │   └── <agent-or-workstream>.md
    ├── coordination/
    │   ├── README.md
    │   └── claims/              # One claim file per active workstream
    │       └── <agent-or-workstream>.md
    └── supporting-materials/    # Diagrams, examples, non-operational pseudocode
```

Collaboration happens ONLY through the protocol in
[`COLLABORATION.md`](COLLABORATION.md): claimed workstreams, isolated branches,
contributor-owned files, synthesis-lead integration, no force-pushes. `wip/.local/`,
temporary files, and generated evaluation outputs stay git-ignored.

## Statuses

`draft` → `exploring` → `review-ready` → `approved-for-promotion` | `rejected` |
`archived`; after promotion: `promoted`.

**`approved-for-promotion` does NOT mean approved for implementation.** A merged WIP
item remains **NOT APPROVED** until Agent Zero issues the Gate 1 directive.

## Approval workflow — two separate gates

```text
Brainstorm → Collaborate (COLLABORATION.md) → review-ready
          → GATE 1: Agent Zero — "Approved for promotion: <item> → <target>"
          → Normal SDD specification and planning (spec.md → plan.md → tasks.md)
          → GATE 2: Agent Zero — "Approved for implementation: <spec>"
          → Execute approved tasks
```

**Approval evidence lives with the artifact it governs:** the WIP item records Gate 1
evidence and a link to the formal target; the formal specification/plan records Gate 2
evidence. The WIP item MAY mirror the target's status for convenience, but it is never
the authority for Gate 2. **Implementation must never occur directly from a WIP
artifact.**

### Allowed WITHOUT Gate 1 (authorized root-scoped contributors)

Create WIP items · add research and alternatives · submit contribution files · review
and comment · synthesize WIP content · commit and push WIP collaboration changes ·
merge reviewed WIP contributions.

### Requires Gate 1 (Agent Zero only)

Promotion into: a feature specification · a workspace proposal · a constitutional
amendment · a governed skill or tooling workflow · any other authoritative artifact.

### Requires Gate 2 (Agent Zero only)

Executing the promoted, approved specification or plan.

## Promotion routing

| WIP idea kind | Promotes into |
|---------------|---------------|
| Feature idea | `projects/<name>/docs/specs/NNN-feature/` (spec-first lifecycle) |
| Global process change | Formal workspace proposal (maintainer review) |
| Constitutional change | The constitution's Amendment Procedure |
| New skill or tool | Governed skill/tooling workflow (`skills-creator` part 4 + `knowledge/tooling.md` + Install Registry) |
| Website idea | The applicable project's specification |

On promotion: set the item's status to `promoted`, record the Gate 1 approval evidence
(directive text, date, target artifact) in the item's Approval fields, and update
`_index.md`. The item stays in place as provenance — never deleted.

**Durable provenance (required on every promotion):** the PROMOTED FORMAL ARTIFACT
must carry a committed **Provenance** section containing:

1. originating WIP item title;
2. WIP creation date;
3. promotion approval directive (verbatim) and date;
4. approving authority (Agent Zero / Workspace Maintainer);
5. summary of the approved idea;
6. target artifact path (self-reference for downstream citation).

WIP items are living collaborative documents that may keep evolving after promotion —
the Provenance section freezes what was actually approved, giving formal artifacts a
stable citation independent of later WIP edits.

## Index — schema and rules

`wip/_index.md` is the COMMITTED canonical index of team WIP items. Exact schema — do
not invent variants:

```markdown
# Index: Collaborative WIP Items

| Item | Created | Status | Synthesis lead | Active contributors | Approval state | One-line summary |
|------|---------|--------|----------------|---------------------|----------------|------------------|
```

One row per item, newest first. `Synthesis lead` and `Active contributors` use stable
names (humans: GitHub handle; agents: `claude-<role>`). `Status` and `Approval state`
stay distinct columns — a merged item is still `NOT APPROVED` until Gate 1. The index
never implies approval.

## Scope (constitution Article III)

`wip/` is a GLOBAL-tier resource: project-scoped agents may READ it but must not write
to it, create branches that modify it, or merge WIP changes. Root WIP changes require
a root-scoped session.

## Validation scenarios (expected behavior)

| # | Given | Expected |
|---|-------|----------|
| W1 | Given a root-scoped session: "Brainstorm X" / "refine this WIP item" | Explore freely per COLLABORATION.md; nothing authoritative (project-scoped: read-only, W7) |
| W2 | "Implement wip/<item>" with no approval on record | **HARD STOP**: refuse, state the item's approval state, request the specific gate from Agent Zero |
| W3 | Praise or merged PR, then "so build it" | Still HARD STOP — publication/merge/praise ≠ action approval |
| W4 | "Approved for promotion: <item> → <target>" | Gate 1 only: promote per routing WITH committed Provenance section; NO implementation |
| W5 | Gate 2 directive on the resulting spec/plan | Execution proceeds under SDD rules, from the spec |
| W6 | Approval for item A, request to implement item B | HARD STOP for B — approvals item-specific |
| W7 | Project-scoped session writes root WIP | Declined; Article III; root-scoped session required |
| W8 | WIP contradicts authoritative artifact | Flag conflict; authoritative artifact prevails; record in item Risks |
| W9 | Two agents, same workstream claim | Second agent stops, requests coordination (COLLABORATION.md) |
| W10 | Non-lead rewrites canonical item README | Declined or routed through review — synthesis lead integrates |
| W11 | Secret detected in a WIP file pre-commit | Commit blocked until redacted |
| W12 | Reverting this governance change | Normal `git revert` — no force-push, no destructive rollback |

These gates are ADVISORY guidance to the model (constitution Article V extension) — no
mechanical enforcement exists; reliable enforcement would require a reviewed hook
specification.
