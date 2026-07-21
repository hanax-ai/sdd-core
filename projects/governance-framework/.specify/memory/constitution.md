# Governance-Framework Constitution
<!-- Sub-project constitution for projects/governance-framework/ within the Hana-X SDD-Core workspace -->

## Preamble

Governance-Framework is a scoped, isolated module of the Hana-X SDD-Core workspace,
living entirely within `projects/governance-framework/`. It is the workspace's
governance DESIGN layer — the "what and why". This sub-project **INHERITS and fully
honors** the master root constitution located at
`../../../../.specify/memory/constitution.md` (relative to this file). Nothing in
this document repeals, weakens, or reinterprets a root article. Where a rule in this
constitution overlaps with a rule in the root constitution, **the stricter rule
wins** — agents MUST resolve any apparent conflict by applying whichever constraint
is more restrictive.

**Root GLOBAL supremacy (v3.1.0):** this project governs the governance DOMAIN; it
does not supersede the root SDD-Core constitution, the `wip/` approval policy, the
`knowledge/tooling.md` declaration, or the workspace approval gates. Agent Zero's
Gate 1 and Gate 2 authority cannot be delegated through any decision-rights or RACI
model defined here. A specification in this project CANNOT authorize edits to root
GLOBAL artifacts (`.specify/`, `knowledge/`, `.claude/`, `docs/`, `wip/`,
`conversations/`) or to another project — root-scoped changes require root-scoped
authorization (root Article III).

## Core Principles

### I. Scope Boundary
This module exclusively owns the workspace's governance design artifacts: principles,
policies, standards, specifications, decision-rights and RACI models, control
definitions, maturity models, and the methodology documentation itself. Agents
working here MUST treat `projects/governance-framework/` as the outer boundary of
their write surface. This subsystem MUST NOT write into any sibling project tree
(`projects/governance-ops/` or any future project); it MAY cite sibling artifacts
read-only by path (the operational layer implements this layer's standards, and
citations across the pair are expected).

*Rationale*: One owner for definitional artifacts prevents forked or contradictory
standards, and hard write isolation keeps sub-project changes independently
reviewable and safely parallelizable across agents (root Article III).

### II. Definitional-Artifact Test
An artifact belongs in this project if and only if it DEFINES what governance is or
why it exists: a standard, policy, specification, model, or methodology. Artifacts
that EVIDENCE execution (runbooks, checklists, cadences, intake workflows, logs,
dashboards, control-execution records) belong to `governance-ops` and MUST NOT be
created here. The authoritative boundary:

| Artifact or activity | Authoritative home |
|---|---|
| Root constitution, WIP policy, tooling declaration, workspace proposals | Root GLOBAL |
| Governance principles, policies, standards, control objectives, maturity models | governance-framework |
| Role definitions and decision-rights models | governance-framework |
| Named role assignments, rotations, operational ownership | governance-ops |
| Required cadences, thresholds, SLAs, review frequencies (the definitions) | governance-framework |
| Actual calendars, review instances, checklist executions, and results | governance-ops |
| Framework-definition feature specifications | `governance-framework/docs/specs/` |
| Operational-capability feature specifications | `governance-ops/docs/specs/` |
| Runbooks, intake procedures, recurring workflows | governance-ops |
| Spec review/approval/maintenance PROCESS execution | governance-ops |
| Workspace-wide conversation records | root `conversations/` (SYNC-POLICY) |
| Project-scoped conversation records | owning project's `conversations/` |
| Gate 1 evidence | originating WIP item + promoted artifact |
| Gate 2 evidence | the authoritative specification or plan |
| Tool installation and ownership audit | machine Install Registry (`~/.sdd-core-ops/`) |
| Governance-control execution evidence | governance-ops evidence system (per its evidence classes) — NOT the Install Registry |
| Exploration and competing ideas | root `wip/` (two-gate policy) |

**Spec routing (v3.1.0):** not every `spec.md` is a framework artifact. A
specification DEFINING a governance standard, model, or control belongs here; a
specification for an operational capability (dashboard, evidence pipeline, intake
service, scheduler, automation) belongs in `governance-ops/docs/specs/`; and a
specification whose implementation changes root GLOBAL artifacts cannot be
authorized from either project (see Root GLOBAL supremacy above).

*Rationale*: A single mechanical test ("does it define a standard, or evidence
execution?") keeps the two governance layers from absorbing each other, and the
explicit three-way routing (root GLOBAL / framework / ops) prevents this project
from duplicating or silently displacing root-tier governance.

### III. Deliberate-Change Discipline
This layer is deliberately stable. Every standard, policy, or model authored here
MUST carry a version and a change rationale; material changes flow through the
spec-first lifecycle (root Article V) — `spec.md` → `plan.md` → `tasks.md` under
`docs/specs/` — and workspace-scoped deliverables additionally require the wip/
two-gate approvals (Gate 1 promotion, Gate 2 implementation) where the wip/ policy
applies. High-churn operational records MUST NOT accumulate here; recurring
activity belongs to `governance-ops` (Article II).

Released framework artifacts are consumed by `governance-ops` read-only under a
one-way dependency contract: a material change to a released standard, policy, or
control definition MUST trigger an operational impact assessment (recorded in
governance-ops) and declare a migration window before the change binds operations.
Ops never redefines a standard; this layer never executes one.

*Rationale*: The framework layer is what everything else is checked against; if it
churns, nothing downstream can be stable. Versioned, deliberate change keeps every
downstream runbook and control auditable against a citable standard revision.

### IV. Local Context Priority
Agents MUST consult this project's `knowledge/instructions.md` — covering the
standards register, file slicing, and token budgets — before the global playbook at
`../../../../knowledge/instructions.md`. Local instructions refine, but never
contradict, global ones; where both speak, the stricter guidance applies, and where
only the global playbook speaks, it governs unchanged.

*Rationale*: The project playbook encodes framework-authoring conventions (register
discipline, slicing of long standards documents, citation rules) that the global
playbook cannot anticipate; reading them first prevents repeated mistakes.

## Governance

This constitution binds all agent and human work inside
`projects/governance-framework/`. It is subordinate to the master root constitution
at `../../../../.specify/memory/constitution.md`; the stricter rule always prevails.
Amendments MUST be documented in this file with a version bump and an updated
amendment date. All specs, plans, and tasks authored under `docs/specs/` MUST be
verifiable against these articles, and reviews MUST flag any violation before work
proceeds. The lifecycle remains pure file-and-agent: compliance is checked by
reading and writing Markdown, and no CLI tool or runtime is ever required.

### Amendments

- **v3.1.1 (2026-07-21)** — propagation of root constitution v2.1.0 (PATCH:
  no project article changes). Root additions binding here through
  inheritance: the Maintenance Changes route (maintainer-directed bounded
  changes — directive verbatim in the commit, bounded scope, never a gate or
  amendment substitute); the one-commit propagation exception for root
  amendments; and `.claude/` joining the GLOBAL-tier enumeration (read-only
  from this project's scope).
- **v3.1.0 (2026-07-20)** — refinement round from the maintainer-supplied external
  assessment (MINOR: materially expanded guidance, no article redefined). Added:
  Root GLOBAL supremacy statement (preamble); three-way authoritative routing
  table replacing the two-layer table (Install Registry row narrowed to tool
  installation/ownership audit; governance-control execution evidence routed to
  the governance-ops evidence system); spec-routing rule (framework-definition
  specs here, operational-capability specs in ops, no project spec authorizes
  root GLOBAL edits); one-way dependency contract with ops impact assessment on
  released-artifact changes.
- **v3.0.0 (2026-07-20)** — complete rescope (MAJOR: every article redefined).
  Maintainer-approved design, 2026-07-20: the former Hana-X-Subsystem
  (SAP S/4 HANA integration exemplar; illustrative template content, never
  started) is rescoped as **Governance-Framework**, the workspace governance
  design layer, paired with the sibling **governance-ops** operational layer.
  Directory renamed `projects/project-a/` → `projects/governance-framework/`
  (root constitution v2.0.1 carries the path refresh). The SAP-specific
  articles (Endpoint Discipline gateway rule, Mock-First Integration) are
  retired with the exemplar scope; Endpoint Discipline's alias-only secrets
  rule continues to bind via the root constitution and the workspace sync
  policies. Committed project tooling carries over: skills `skills-creator`
  and `mirror-sync` under `.claude/skills/`, sync policy
  `conversations/SYNC-POLICY.md`.
- **v2.0.0 (2026-07-20)** — propagation of root constitution v2.0.0 (Article I
  redefined, context-split inference governance). Superseded by v3.0.0's
  rescope; the root Article I controls bind unchanged.
- **v1.1.0 (2026-07-19)** — propagation of root constitution v1.1.0 (Skills &
  Tooling Governance); project tooling artifacts acknowledged.

**Version**: 3.1.1 | **Ratified**: 2026-07-17 | **Last Amended**: 2026-07-21
