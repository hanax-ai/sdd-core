# Governance-Ops Constitution
<!-- Sub-project constitution for projects/governance-ops/ within the Hana-X SDD-Core workspace -->

## Preamble

Governance-Ops is a scoped, isolated module of the Hana-X SDD-Core workspace, living
entirely within `projects/governance-ops/`. It is the workspace's governance
OPERATIONAL layer — the "how and when". This sub-project **INHERITS and fully
honors** the master root constitution located at
`../../../../.specify/memory/constitution.md` (relative to this file). Nothing in
this document repeals, weakens, or reinterprets a root article. Where a rule in this
constitution overlaps with a rule in the root constitution, **the stricter rule
wins** — agents MUST resolve any apparent conflict by applying whichever constraint
is more restrictive.

## Core Principles

### I. Scope Boundary
This module exclusively owns the recurring activities that put the governance
framework into practice: runbooks, review cadences, checklists, intake and approval
workflows, dashboards, and evidence that controls are actually being executed.
Agents working here MUST treat `projects/governance-ops/` as the outer boundary of
their write surface. This subsystem MUST NOT write into any sibling project tree
(`projects/governance-framework/` or any future project); it MAY cite sibling artifacts
read-only by path (every operational activity here traces to a framework standard,
and citations across the pair are expected).

*Rationale*: One owner for operational governance prevents duplicate or drifting
procedures, and hard write isolation keeps sub-project changes independently
reviewable and safely parallelizable across agents (root Article III).

### II. Execution-Evidence Test
An artifact belongs in this project if and only if it EVIDENCES or OPERATES
execution: a runbook, checklist, cadence, workflow, dashboard, or record of a
control being exercised. Artifacts that DEFINE what governance is (standards,
policies, specifications, models) belong to `governance-framework` and MUST NOT be
created here. The process for reviewing, approving, and maintaining specs runs
here; the specs themselves never live here. The authoritative boundary:

| Artifact kind | Home |
|---|---|
| Runbooks, checklists, review cadences, intake/approval workflows, dashboards, control-execution evidence | governance-ops |
| Specs, policies, standards, decision-rights/RACI, control definitions, maturity models, methodology | governance-framework |
| Spec review/approval/maintenance PROCESS execution | governance-ops |
| The specs themselves (all definitional artifacts) | governance-framework |
| Workspace conversation records | root `conversations/` (SYNC-POLICY) |
| Exploration and brainstorms | root `wip/` (two-gate policy) |
| Audit/ownership log | machine Install Registry (`~/.sdd-core-ops/`) |

*Rationale*: The same mechanical test from the framework side, applied in reverse.
Root-tier record homes (conversations/, wip/, the machine Install Registry) are
expressly OUT of this project's scope — operational governance records here never
duplicate them.

### III. Record & Churn Discipline
This layer is expected to churn. To keep churn auditable: operational records MUST
be dated and append-oriented (corrections append or supersede — never silently
rewrite an execution record); every runbook, checklist, and cadence MUST cite the
governance-framework standard it operationalizes; and control-execution evidence
MUST name the control, the date, and the operator role. Secrets discipline is
absolute: no credentials, hostnames, tenant identifiers, or personal data beyond
public maintainer roles in any operational record — environment aliases only. New
operational CAPABILITIES (a new workflow system, dashboard, or intake mechanism)
remain spec-first under root Article V; routine execution of an established
runbook does not require a spec.

*Rationale*: High-churn records are only trustworthy if their history is
append-only and every activity traces to a citable standard revision; alias-only
references keep every record safe to commit and share.

### IV. Local Context Priority
Agents MUST consult this project's `knowledge/instructions.md` — covering the
runbook register, record conventions, and token budgets — before the global
playbook at `../../../../knowledge/instructions.md`. Local instructions refine,
but never contradict, global ones; where both speak, the stricter guidance
applies, and where only the global playbook speaks, it governs unchanged.

*Rationale*: The project playbook encodes operational conventions (register
discipline, record shapes, cadence tracking) that the global playbook cannot
anticipate; reading them first prevents repeated mistakes.

## Governance

This constitution binds all agent and human work inside
`projects/governance-ops/`. It is subordinate to the master root constitution at
`../../../../.specify/memory/constitution.md`; the stricter rule always prevails.
Amendments MUST be documented in this file with a version bump and an updated
amendment date. All specs, plans, and tasks authored under `docs/specs/` MUST be
verifiable against these articles, and reviews MUST flag any violation before work
proceeds. The lifecycle remains pure file-and-agent: compliance is checked by
reading and writing Markdown, and no CLI tool or runtime is ever required.

### Amendments

- **v1.0.0 (2026-07-20)** — initial ratification. Maintainer-approved design,
  2026-07-20: the former reserved placeholder slot (`projects/project-b/`,
  renamed to `projects/governance-ops/` under root constitution v2.0.1) is
  provisioned as the workspace governance operational layer, paired with the
  sibling `governance-framework` design layer.

**Version**: 1.0.0 | **Ratified**: 2026-07-20 | **Last Amended**: 2026-07-20
