# sdd-core

An AI-native Spec-Driven Development (SDD) workspace template optimized for Claude Code.

## Why This Template Exists

*   **Pure File-Driven Architecture:** Eliminates the need for external CLI runtimes, allowing agentic interfaces to read, write, and execute feature lifecycles entirely through structured Markdown.
*   **Hierarchical Context Separation:** Features a multi-tiered layout separating global governance (`.specify/memory/constitution.md`) from granular subsystem modules.
*   **Local Repository Mirroring Playbooks:** Includes a dedicated context routing directory (`knowledge/instructions.md`) to guide agents directly to local offline frameworks (e.g., UI component libraries or API schemas), eliminating context hallucinations.
*   **Modular Sub-Projects:** Pre-scaffolded template modules allowing instant provisioning of independent, isolated backend/frontend services that honor global architectural constraints.

![SDD-Core process flow: the global constitution and mirror registry feed the workspace, which drives the Project A feature lifecycle (1. Scaffold template → 2. Specify + Clarify spec.md → 3. Plan plan.md → 4. Tasks tasks.md → 5. Execute) alongside the empty Project B slot](docs/assets/process_flow.png)

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
│   └── instructions.md                # GLOBAL mirror registry: routes agents to local framework mirrors
├── docs/                              # GLOBAL workspace-level documentation
├── reference/
│   └── repos/                         # Git-ignored local mirrors of external frameworks
│
└── projects/
    ├── project-a/                     # Example sub-project: "Hana-X-Subsystem" (SAP S/4 HANA integration)
    │   ├── .specify/
    │   │   └── memory/
    │   │       └── constitution.md    # PER-PROJECT constitution: subsystem scope and rules
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
    └── project-b/                     # Empty placeholder slot for the next sub-project
```

## How Claude Code Sub-Agents Navigate This Hierarchy

Agents load context in a strict order, from global governance down to the active feature:

1.  **Root constitution** — [.specify/memory/constitution.md](.specify/memory/constitution.md): workspace-wide architectural principles (local open-source models via Ollama only; PostgreSQL for relational data and Qdrant for vector data; strict isolated agent scopes).
2.  **Root mirror registry** — [knowledge/instructions.md](knowledge/instructions.md): the routing table pointing agents to local framework mirrors under [reference/repos/](reference/repos/).
3.  **Project constitution** — `projects/<name>/.specify/memory/constitution.md`: the sub-project's scope, boundaries, and rules.
4.  **Project mirror registry** — `projects/<name>/knowledge/instructions.md`: project-specific mirrors and agent guidance.
5.  **Active feature folder** — the current `projects/<name>/docs/specs/NNN-feature-name/` directory (`spec.md`, `plan.md`, `tasks.md`).

### Scope Rules

- An agent assigned to a sub-project operates **only inside that project's tree** (`projects/<name>/`). It never writes outside it.
- The global tier (root constitution, root `knowledge/instructions.md`, `docs/`, `reference/`) is **read-only** from within a project.

### Mirror-Check Mandate

Before proposing any framework-dependent code, an agent **must** consult `knowledge/instructions.md` (project-level first, then root) to determine whether a local mirror of that framework exists under `reference/repos/`. If a mirror exists, the agent grounds its output in the mirrored source rather than recalled training knowledge.

## Feature Lifecycle

The lifecycle is entirely file-based — no tooling is required at any step:

1.  **Scaffold** — Copy `projects/<name>/docs/specs/template/` to `projects/<name>/docs/specs/001-feature-name/` (increment the numeric prefix for each new feature).
2.  **Specify + Clarify** — Complete `spec.md`. Resolve **every** row in its ambiguity/clarification table before proceeding; an unresolved ambiguity blocks the next phase.
3.  **Plan** — Complete `plan.md`, deriving architecture and design decisions from the finished spec and the applicable constitutions.
4.  **Tasks** — Complete `tasks.md`, breaking the plan into small, ordered, independently verifiable tasks.
5.  **Execute** — Work through the tasks strictly in order, keeping the three documents updated as the source of truth.

## Provisioning a New Sub-Project

1.  Copy the structure of [projects/project-a/](projects/project-a/) to `projects/<new-name>/` (or populate the [projects/project-b/](projects/project-b/) placeholder).
2.  Rewrite `projects/<new-name>/.specify/memory/constitution.md` for the new subsystem's scope, keeping it consistent with the root constitution.
3.  Clear out `docs/specs/` so only the untouched `template/` folder remains, and update `knowledge/instructions.md` and `reference/` for the new project's frameworks.

## Verification

An optional convenience script is provided for humans to confirm structural compliance. From the repository root, in a bash shell:

```bash
./verify-layout.sh
```

This checks that the directory layout matches the expected structure. It is **not** part of the SDD workflow — agents operate on the files directly and never depend on it.
