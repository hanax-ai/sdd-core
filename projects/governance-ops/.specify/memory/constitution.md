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

**Root GLOBAL supremacy (v1.1.0):** this project governs the governance DOMAIN; it
does not supersede the root SDD-Core constitution, the `wip/` approval policy, the
`knowledge/tooling.md` declaration, or the workspace approval gates. Agent Zero's
Gate 1 and Gate 2 authority cannot be delegated through any role assignment or
operational ownership defined here. A specification in this project CANNOT
authorize edits to root GLOBAL artifacts (`.specify/`, `knowledge/`, `.claude/`,
`docs/`, `wip/`, `conversations/`) or to another project — root-scoped changes
require root-scoped authorization (root Article III).

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
| Governance-control execution evidence | this project's evidence system (Article III evidence classes) — NOT the Install Registry |
| Exploration and competing ideas | root `wip/` (two-gate policy) |

**Spec routing (v1.1.0):** specifications for operational capabilities
(dashboards, evidence pipelines, intake services, schedulers, automations) belong
in this project's `docs/specs/`; specifications DEFINING governance standards
belong in governance-framework; no specification in either project authorizes
root GLOBAL edits (see Root GLOBAL supremacy above).

*Rationale*: The same mechanical test from the framework side, applied in reverse,
with explicit three-way routing (root GLOBAL / framework / ops). Root-tier record
homes are expressly OUT of this project's scope — operational governance records
here never duplicate them, and the Install Registry remains a tooling audit, not
a general governance audit log.

### III. Record & Churn Discipline
This layer is expected to churn. To keep churn auditable: operational records MUST
be dated and append-oriented (corrections append or supersede — never silently
rewrite an execution record). Secrets discipline is absolute: no credentials,
hostnames, tenant identifiers, or personal data beyond public maintainer roles in
any operational record — environment aliases only. New operational CAPABILITIES
(a new workflow system, dashboard, or intake mechanism) remain spec-first under
root Article V; routine execution of an established runbook does not require a
spec.

**One-way dependency contract (v1.1.0):** this project consumes RELEASED
governance-framework artifacts read-only and never redefines the standard it
executes. Every operational record MUST identify what it implements with at
least: control ID; policy/standard version; effective date; execution date;
responsible role; result; evidence location; and exception or remediation
status. A framework change binds operations only after its impact assessment
and migration window (recorded here).

**Evidence classes (v1.1.0):** this repository is PUBLIC. Exactly three evidence
classes exist:

1. **Committed templates and synthetic examples** — repo-safe, committable.
2. **Real evidence, machine-local** — git-ignored, governed by declared
   retention and sync policy.
3. **Approved external systems of record** — only safe references (IDs,
   aliases, locations) are committed.

Real control-execution evidence (audit logs, meeting records, approval evidence,
identities, dashboards over real data) is NEVER committed by default; committing
any real evidence requires explicit maintainer approval plus a secrets/identity
scan.

*Rationale*: High-churn records are only trustworthy if their history is
append-only and every activity traces to a citable standard revision; the
evidence classes keep a public template repository from ever becoming a leak
vector for real governance activity.

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

- **v1.1.0 (2026-07-20)** — refinement round from the maintainer-supplied external
  assessment (MINOR: materially expanded guidance, no article redefined). Added:
  Root GLOBAL supremacy statement (preamble); three-way authoritative routing
  table (Install Registry narrowed to tooling audit; control-execution evidence
  routed to this project's evidence system); spec-routing rule; one-way
  dependency contract with versioned traceability fields; three evidence classes
  with the real-evidence-never-auto-committed rule.
- **v1.0.0 (2026-07-20)** — initial ratification. Maintainer-approved design,
  2026-07-20: the former reserved placeholder slot (`projects/project-b/`,
  renamed to `projects/governance-ops/` under root constitution v2.0.1) is
  provisioned as the workspace governance operational layer, paired with the
  sibling `governance-framework` design layer.

**Version**: 1.1.0 | **Ratified**: 2026-07-20 | **Last Amended**: 2026-07-20
