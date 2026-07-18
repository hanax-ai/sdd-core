# Hana-X-Subsystem Constitution
<!-- Sub-project constitution for projects/project-a/ within the Hana-X SDD-Core workspace -->

## Preamble

Hana-X-Subsystem is a scoped, isolated module of the Hana-X SDD-Core workspace, living
entirely within `projects/project-a/`. This sub-project **INHERITS and fully honors**
the master root constitution located at `../../../../.specify/memory/constitution.md`
(relative to this file). Nothing in this document repeals, weakens, or reinterprets a
root article. Where a rule in this constitution overlaps with a rule in the root
constitution, **the stricter rule wins** — agents MUST resolve any apparent conflict
by applying whichever constraint is more restrictive.

## Core Principles

### I. Scope Boundary
This module exclusively owns integration with its designated customer endpoints,
exemplified by customer SAP S/4 HANA endpoints (OData v4 services and BAPI-style RFC
wrappers). No other subsystem may call these endpoints, directly or indirectly; all
such traffic MUST originate from within this project tree. Conversely, this subsystem
MUST NOT reach into any other project tree — no reads, writes, or references to files
under `../project-b/` or any sibling project. Agents working here operate under the
root constitution's strict isolated-scope mandate and MUST treat `projects/project-a/`
as the outer boundary of their write surface.

*Rationale*: Exclusive endpoint ownership prevents duplicate, conflicting integrations
against the same customer system, and hard tree isolation keeps sub-project changes
independently reviewable and safely parallelizable across agents.

### II. Endpoint Discipline
All S/4 HANA interaction MUST flow through a single gateway layer defined in this
project's feature plans (`docs/specs/<feature>/plan.md`); no spec, plan, or task may
introduce a second path to the customer system. Credentials, hostnames, and tenant
identifiers MUST NEVER appear in specs, plans, tasks, or knowledge files — reference
environment aliases only (e.g., `S4_GATEWAY_ALIAS`, `S4_TENANT_ALIAS`). Any artifact
found to contain a concrete secret, host, or tenant value MUST be corrected before
work proceeds.

*Rationale*: A single gateway keeps authentication, throttling, and error semantics
in one auditable place; alias-only references keep every Markdown artifact safe to
commit, share, and mirror without leaking customer infrastructure details.

### III. Mock-First Integration
Specs and development MUST validate against mocks and schema exports stored in this
project's `reference/` folder before any live endpoint is touched. A feature plan MAY
declare live-endpoint validation only after its mock-based acceptance checks pass, and
tasks MUST sequence mock validation ahead of any live interaction. Missing mocks or
schema exports are a blocking gap: the spec MUST record it rather than assume live
access.

*Rationale*: Mock-first work makes the lifecycle reproducible without customer
connectivity, protects live SAP systems from exploratory traffic, and turns schema
exports into a versioned, reviewable contract.

### IV. Local Context Priority
Agents MUST consult this project's `knowledge/instructions.md` — covering edge cases,
file slicing, and token budgets — before the global playbook at
`../../../../knowledge/instructions.md`. Local instructions refine, but never
contradict, global ones; where both speak, the stricter guidance applies, and where
only the global playbook speaks, it governs unchanged.

*Rationale*: Sub-project instructions encode hard-won, endpoint-specific knowledge
(SAP payload shapes, slicing large OData metadata, budget limits for schema files)
that the global playbook cannot anticipate; reading them first prevents repeated
mistakes and wasted context.

## Governance

This constitution binds all agent and human work inside `projects/project-a/`. It is
subordinate to the master root constitution at
`../../../../.specify/memory/constitution.md`; the stricter rule always prevails.
Amendments MUST be documented in this file with a version bump and an updated
amendment date. All specs, plans, and tasks authored under `docs/specs/` MUST be
verifiable against these articles, and reviews MUST flag any violation before work
proceeds. The lifecycle remains pure file-and-agent: compliance is checked by reading
and writing Markdown, and no CLI tool or runtime is ever required.

**Version**: 1.0.0 | **Ratified**: 2026-07-17 | **Last Amended**: 2026-07-17
