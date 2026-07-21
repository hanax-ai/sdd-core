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

| Artifact kind | Home |
|---|---|
| Specs, policies, standards, decision-rights/RACI, control definitions, maturity models, methodology | governance-framework |
| Runbooks, checklists, review cadences, intake/approval workflows, dashboards, control-execution evidence | governance-ops |
| Spec review/approval/maintenance PROCESS execution | governance-ops |
| The specs themselves (all definitional artifacts) | governance-framework |
| Workspace conversation records | root `conversations/` (SYNC-POLICY) |
| Exploration and brainstorms | root `wip/` (two-gate policy) |
| Audit/ownership log | machine Install Registry (`~/.sdd-core-ops/`) |

*Rationale*: A single mechanical test ("does it define a standard, or evidence
execution?") keeps the two governance layers from absorbing each other and prevents
duplicate record homes across the root GLOBAL tier and the project tier.

### III. Deliberate-Change Discipline
This layer is deliberately stable. Every standard, policy, or model authored here
MUST carry a version and a change rationale; material changes flow through the
spec-first lifecycle (root Article V) — `spec.md` → `plan.md` → `tasks.md` under
`docs/specs/` — and workspace-scoped deliverables additionally require the wip/
two-gate approvals (Gate 1 promotion, Gate 2 implementation) where the wip/ policy
applies. High-churn operational records MUST NOT accumulate here; recurring
activity belongs to `governance-ops` (Article II).

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

**Version**: 3.0.0 | **Ratified**: 2026-07-17 | **Last Amended**: 2026-07-20
