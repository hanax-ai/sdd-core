# sdd-core

An AI-native Spec-Driven Development (SDD) workspace template optimized for Claude Code.

## Why This Template Exists

*   **Pure File-Driven Architecture:** Eliminates the need for external CLI runtimes, allowing agentic interfaces to read, write, and execute feature lifecycles entirely through structured Markdown.
*   **Hierarchical Context Separation:** Features a multi-tiered layout separating global governance (`.specify/memory/constitution.md`) from granular subsystem modules.
*   **Local Repository Mirroring Playbooks:** Includes a dedicated context routing directory (`knowledge/instructions.md`) to guide agents directly to local offline frameworks (e.g., UI component libraries or API schemas), eliminating context hallucinations.
*   **Modular Sub-Projects:** Pre-scaffolded template modules allowing instant provisioning of independent, isolated backend/frontend services that honor global architectural constraints.

![SDD-Core process flow: the global constitution and mirror registry feed the workspace, which drives each sub-project's feature lifecycle (1. Scaffold template → 2. Specify + Clarify spec.md → 3. Plan plan.md → 4. Tasks tasks.md → 5. Execute). Diagram predates the governance-framework/governance-ops rescope and shows the former Project A / Project B labels.](docs/assets/process_flow.png)

## What is Spec-Driven Development

Spec-Driven Development inverts the traditional relationship between specification and code: the specification is the primary artifact, and implementation is derived from it. Every feature begins as a written specification that captures intent, constraints, and acceptance criteria before any planning or task breakdown occurs. This gives AI agents an unambiguous source of truth to work from and gives humans a durable, reviewable record of *why* the system behaves the way it does.

The methodology implemented here is based on [github/spec-kit](https://github.com/github/spec-kit), which defines the Specify → Plan → Tasks progression and the constitution-as-governance model. This workspace adapts that methodology into a pure file-and-agent form: agents read and write structured Markdown directly, and the entire lifecycle runs without any required CLI tooling or runtime.

## Workspace Layout

```text
sdd-core/
├── .gitignore
├── README.md                          # This file
├── verify-layout.sh                   # Optional human convenience script (structural checks only)
│
├── .specify/
│   └── memory/
│       └── constitution.md            # GLOBAL constitution: root architectural principles
├── knowledge/
│   ├── instructions.md                # GLOBAL mirror registry: routes agents to local framework mirrors
│   └── tooling.md                     # GLOBAL tooling requirement declaration + new-machine bootstrap
├── conversations/
│   ├── README.md                      # GLOBAL conversation records: purpose, conventions, index/archival rules
│   ├── SYNC-POLICY.md                 # Workspace-level sync destination policy (records git-ignored)
│   └── TEMPLATE.md                    # Standard conversation-record template
├── wip/
│   ├── README.md                      # GLOBAL brainstorming space: purpose + two-gate approval policy
│   ├── COLLABORATION.md               # Multi-agent collaboration protocol
│   ├── TEMPLATE.md                    # Standard WIP-item template
│   └── _index.md                      # Committed canonical index of team WIP items
├── docs/                              # GLOBAL workspace-level documentation
│   └── proposals/                     # Gate-1-promoted workspace proposals (with Provenance)
├── reference/
│   └── repos/                         # Git-ignored local mirrors of external frameworks
│
└── projects/
    ├── governance-framework/          # Governance DESIGN layer: principles, policies, standards, specs ("what & why")
    │   ├── README.md                  # Project structure + methodology
    │   ├── .claude/
    │   │   └── skills/
    │   │       ├── mirror-sync/
    │   │       │   └── SKILL.md       # Mirror Registry Engine (Article IV implementation aid)
    │   │       └── skills-creator/
    │   │           └── SKILL.md       # Workspace skill-authoring instructions
    │   ├── .specify/
    │   │   └── memory/
    │   │       └── constitution.md    # PER-PROJECT constitution: subsystem scope and rules
    │   ├── conversations/
    │   │   └── SYNC-POLICY.md         # Sync destination policy (other contents git-ignored)
    │   ├── docs/
    │   │   └── specs/
    │   │       └── template/          # Copy this folder to start a new feature
    │   │           ├── spec.md        # What & why (Specify + Clarify)
    │   │           ├── plan.md        # How (architecture and design decisions)
    │   │           └── tasks.md       # Ordered, executable task breakdown
    │   ├── knowledge/
    │   │   └── instructions.md        # PER-PROJECT mirror registry and agent guidance
    │   └── reference/                 # PER-PROJECT local reference material
    │
    └── governance-ops/                # Governance OPERATIONAL layer: runbooks, cadences, evidence ("how & when")
        ├── README.md                  # Project structure + methodology
        ├── .specify/memory/constitution.md
        ├── conversations/SYNC-POLICY.md
        ├── docs/specs/template/       # spec.md / plan.md / tasks.md
        ├── knowledge/instructions.md  # Playbook: runbook register, record conventions
        └── reference/
```

## How Claude Code Sub-Agents Navigate This Hierarchy

This is the **canonical five-step CONTEXT-LOADING order** for the workspace. Agents load context in this strict order, from global governance down to the active feature; every other document that states a load order restates this one:

1.  **Root constitution** — [.specify/memory/constitution.md](.specify/memory/constitution.md): workspace-wide architectural principles (context-split inference governance — Ollama-only as the product/runtime TARGET, maintainer-approved hosted models for development/workspace agents; PostgreSQL for relational data and Qdrant for vector data; strict isolated agent scopes).
2.  **Root mirror registry** — [knowledge/instructions.md](knowledge/instructions.md): the routing table pointing agents to local framework mirrors under [reference/repos/](reference/repos/).
3.  **Project constitution** — `projects/<name>/.specify/memory/constitution.md`: the sub-project's scope, boundaries, and rules.
4.  **Project mirror registry** — `projects/<name>/knowledge/instructions.md`: project-specific mirrors and agent guidance (in governance-framework this file is the project playbook).
5.  **Active feature folder** — the current `projects/<name>/docs/specs/NNN-feature-name/` directory (`spec.md`, `plan.md`, `tasks.md`).

Skills and plugins are **ambient, triggered tooling — not load-order steps**: they load on demand (or per machine configuration) and never displace or reorder the five steps above. Project playbooks may append project-local refinements after step 5 (governance-framework adds manifest-selected reference slices), always labeled as refinements.

**Nested-skill activation note:** skills committed under `projects/<name>/.claude/skills/` are directory-scoped — Claude Code (v2.1.178+, refined in v2.1.181) makes them available when the session works with files under that project, even if it started at the workspace root; they are not guaranteed to be listed before any project file is touched. Sessions that need them immediately should start inside the project directory. The same applies one level up: workspace-root skills (`.claude/skills/` — conversation-records, session-capture, governed-change, registry-logging) are reliably listed only in sessions started inside the repository — **sessions doing workspace governance work start in the repo root**, not a parent directory.

### Scope Rules

- An agent assigned to a sub-project operates **only inside that project's tree** (`projects/<name>/`). It never writes outside it.
- The global tier (root constitution, root `knowledge/instructions.md`, `conversations/`, `wip/`, `docs/`, `reference/`) is **read-only** from within a project.

### Work In Progress (non-authoritative, collaborative)

Early-stage ideas are brainstormed in the root [`wip/`](wip/) directory — a GLOBAL-tier, **non-authoritative** space that grants no implementation authority. WIP items are Git-tracked and shared through GitHub so authorized root-scoped agents and human contributors can collaborate on them under the protocol in [`wip/COLLABORATION.md`](wip/COLLABORATION.md) (claimed workstreams, contributor-owned files, synthesis-lead integration, no force-pushes). Committing, reviewing, or merging a WIP item grants NO authority: promotion requires Agent Zero's explicit item-specific Gate 1 directive, and execution additionally requires Gate 2 implementation approval of the resulting spec/plan — see [`wip/README.md`](wip/README.md) for the policy, statuses, and routing. Only `wip/.local/` scratch stays machine-local (git-ignored).

### Conversation Records

Durable conversation records have exactly two homes, disambiguated by scope: workspace-level outcomes (governance, cross-project conventions, tooling) go to the root [`conversations/`](conversations/) directory — a GLOBAL-tier resource writable only at root-level scope; project-scoped outcomes go to the owning project's `projects/<name>/conversations/` under its own `SYNC-POLICY.md`. Records follow [`conversations/TEMPLATE.md`](conversations/TEMPLATE.md) and the conventions in [`conversations/README.md`](conversations/README.md); record content stays machine-local (git-ignored) — only the policy, template, and README are template content. The root-scoped [`conversation-records`](.claude/skills/conversation-records/SKILL.md) skill governs the record lifecycle (capture, locate, update, summarize, archive) at the workspace root, and the [`session-capture`](.claude/skills/session-capture/SKILL.md) skill turns the current working session into a validated record at either tier (routing by scope).

### Mirror-Check Mandate

Before proposing any framework-dependent code, an agent **must** consult `knowledge/instructions.md` (project-level first, then root) to determine whether a local mirror of that framework exists under `reference/repos/`. If a mirror exists, the agent grounds its output in the mirrored source rather than recalled training knowledge.

**Lookup order is not load order:** "project registry before global" is the MIRROR-LOOKUP precedence rule — a constitution Article IV *resolution order* applied while working on framework-dependent tasks. It does not compete with the canonical five-step context-loading order above, which reads governance global-tier-first. The `mirror-sync` skill (governance-framework) operationalizes these lookups as an implementation aid; the registries and their pin discipline remain normative.

## Feature Lifecycle

The lifecycle is entirely file-based — no tooling is required at any step:

1.  **Scaffold** — Copy `projects/<name>/docs/specs/template/` to `projects/<name>/docs/specs/001-feature-name/` (increment the numeric prefix for each new feature).
2.  **Specify + Clarify** — Complete `spec.md`. Resolve **every** row in its ambiguity/clarification table before proceeding; an unresolved ambiguity blocks the next phase.
3.  **Plan** — Complete `plan.md`, deriving architecture and design decisions from the finished spec and the applicable constitutions.
4.  **Tasks** — Complete `tasks.md`, breaking the plan into small, ordered, independently verifiable tasks.
5.  **Execute** — Work through the tasks strictly in order, keeping the three documents updated as the source of truth.

## Provisioning a New Sub-Project

1.  Copy the structure of [projects/governance-framework/](projects/governance-framework/) to `projects/<new-name>/` — including the `.claude/skills/` and `conversations/` shape, with a project-specific `conversations/SYNC-POLICY.md` declaring the new project's sync destination.
2.  Rewrite `projects/<new-name>/.specify/memory/constitution.md` for the new subsystem's scope, keeping it consistent with the root constitution.
3.  Clear out `docs/specs/` so only the untouched `template/` folder remains, and update `knowledge/instructions.md` and `reference/` for the new project's frameworks.

**Machine-tier items are per-machine, NOT template content:** plugins (caveman, superpowers), the global `conversation-sync` skill, and the `~/.claude/CLAUDE.md` conduct block never ship with this template. A new machine (or template consumer) provisions them by following the bootstrap procedure in [knowledge/tooling.md](knowledge/tooling.md), which reconciles the machine's Install Registry against the declared requirements.

## Verification

An optional convenience script is provided for humans to confirm structural compliance. From the repository root, in a bash shell:

```bash
./verify-layout.sh
```

This checks that the directory layout matches the expected structure. It is **not** part of the SDD workflow — agents operate on the files directly and never depend on it.
