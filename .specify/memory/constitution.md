<!--
SYNC IMPACT REPORT
==================
Version change: 2.0.1 → 2.1.0
Bump rationale: MINOR — new Governance subsection (Maintenance Changes) and
  materially expanded Amendment Procedure guidance (cross-scope propagation
  exception); GLOBAL-tier enumeration expanded to include .claude/. No
  article redefined.

Amendment rationale (maintainer directive, recorded verbatim: "i approve,
  WP-R1 amendment" — Agent Zero, 2026-07-21, approving work package WP-R1 of
  the consolidated go-forward plan v4 after four-review convergence): the
  workspace's maintainer-directed bounded-change practice existed without an
  authoritative definition (defect D4a), and the per-scope commit discipline
  conflicted with this procedure's own same-change propagation mandate.
  Establishing the route THROUGH the Amendment Procedure grounds it in an
  already-defined authority path.

Changes in this amendment:
  - Governance: new "Maintenance Changes" subsection defining the
    maintainer-directed bounded-change route (directive form, scope,
    exclusions, evidence, relationship to the wip/ gates).
  - Amendment Procedure, Propagation: a root amendment plus its mandated
    propagation is ONE root-authority act and MAY land as one commit
    (express exception to per-scope commit discipline); documented
    deviation with named follow-up commits remains the fallback.
  - GLOBAL-tier enumeration (preamble and Article III) now includes
    .claude/ (root workspace skills, hooks, settings) — read-only from
    project scope like the rest of the tier.

Impact note — files changed in this same amendment (one commit, per the
  propagation exception this amendment itself establishes — a practice the
  prior text already mandated): this file; both inheriting project
  constitutions receive propagation entries (governance-framework → 3.1.1,
  governance-ops → 1.1.1, PATCH — no project article changes). A separate
  alignment commit under the new route updates wip/README.md and the
  governed-change and constitution-amendment skills to cite this text.

Previous reports: 2.0.1 (path/example refresh after sub-project renames —
  2026-07-20); 2.0.0 (Article I redefined as context-split inference
  governance; category list delegated to tooling.md; GLOBAL-tier enumeration
  expanded — 2026-07-20); 1.1.0 (Skills & Tooling Governance section;
  Article IV annotation; Article V advisory extension — 2026-07-19);
  1.0.0 (initial ratification: Articles I–V, Inheritance, Governance —
  2026-07-17).

Follow-up TODOs: none. All paths in this document are relative to the
workspace root (the directory containing this file's `.specify/` tree).
-->

# Hana-X SDD-Core Constitution

Hana-X SDD-Core is an AI-native, multi-project Spec-Driven Development (SDD)
workspace operated entirely through files and agents: agents read and write
structured Markdown, and the SDD lifecycle itself requires no CLI tool,
runtime, or build step. These principles are binding guardrails on every
agent, human contributor, and sub-project under `projects/`. They govern the
GLOBAL tier (`.specify/memory/`, `knowledge/`, `conversations/`, `wip/`,
`docs/`, `reference/`, `.claude/`) and, through inheritance, every PER-PROJECT tier
(`projects/<name>/`). (`wip/` is GLOBAL-tier but expressly NON-AUTHORITATIVE —
see Skills & Tooling Governance and `wip/README.md`.)

## Core Principles

### I. Inference Governance (v2.0.0 — redefined)

Model inference is governed by CONTEXT. Two contexts exist, with different rules:

**Product/runtime inference** — inference performed by implemented subsystems,
customer-adjacent pipelines, or any artifact this workspace ships:

- The TARGET architecture is locally hosted open-source models served via Ollama.
  This is a deferred product requirement: no Ollama infrastructure exists in the
  workspace today, and this document does not claim otherwise. The requirement
  binds when product inference is implemented.
- Once implemented, product inference MUST NOT call proprietary or external LLM
  APIs (hosted inference endpoints, cloud model gateways, third-party
  completion/embedding services); pipelines MUST assume an Ollama-served local
  model as the only product inference backend.
- Specs and plans that require product model capabilities MUST name the local
  model family they target; a plan that silently depends on an external model API
  for product inference is invalid. A spec that genuinely needs hosted product
  inference raises it as a proposed amendment — never implements it unilaterally.

**Development and workspace agents** — agents and tooling operating the SDD
lifecycle itself (spec/plan/task authoring, verification probes, skill
evaluation, workspace maintenance):

- MAY use maintainer-approved hosted models, including Claude, subject to ALL of:
  Endpoint Discipline (no credentials, hostnames, tenant identifiers, or customer
  data in prompts or generated artifacts); Article III scope isolation; tooling
  governance (approved sources, `knowledge/tooling.md` declaration, machine
  Install Registry); and no customer-data egress of any kind.
- Approval is per tool/model via the existing tooling governance path; no agent
  self-approves a new inference provider.

**Rationale:** The workspace handles customer-adjacent systems (any sub-project
integrating customer endpoints). Keeping PRODUCT inference local
(when built) preserves data sovereignty, offline operability, cost
predictability, and credential/egress hygiene. But Ollama-only was an
architectural policy, not an SDD requirement — SDD needs governed specs, plans,
tasks, validation, and scope control, regardless of which approved model operates
the workspace. The prior text mandated infrastructure that does not exist and, read
literally, forbade the very agents operating this workspace.

### II. Standardized Data Layer

The data layer is fixed: PostgreSQL for relational and transactional state,
Qdrant for vector and semantic storage.

- All relational, transactional, and structured application state MUST live
  in PostgreSQL.
- All embeddings, vector indexes, and semantic-search storage MUST live in
  Qdrant.
- Agents MUST NOT introduce ad-hoc datastores (SQLite files, alternate
  vector databases, bespoke JSON/CSV persistence layers, in-process caches
  promoted to durable storage) in any spec, plan, or implementation.
- A sub-project needing a genuinely new storage capability MUST raise it as
  a proposed amendment to this constitution, not implement it unilaterally.

**Rationale:** Two well-understood stores keep operational surface, backup
strategy, and agent grounding uniform across every sub-project. Datastore
sprawl is the fastest way for a multi-project workspace to become
unmaintainable.

### III. Isolated Agent Scopes

Agents operate in strictly isolated directory scopes.

- An agent operating on a sub-project MUST confine all writes to that
  project's directory tree (`projects/<name>/`), including its
  `.specify/memory/`, `docs/specs/`, `knowledge/`, and `reference/`.
- The same agent MAY read the GLOBAL tier (`.specify/memory/constitution.md`,
  `knowledge/instructions.md`, `conversations/`, `wip/`, `docs/`, `reference/`,
  `.claude/`) but MUST treat it as read-only.
- An agent MUST NOT edit another project's tree. Any cross-project edit is a
  constitution violation and MUST be reverted, not rationalized.
- Changes that genuinely span projects (shared conventions, global
  instructions, this document) MUST be performed by an agent explicitly
  scoped to the GLOBAL tier, never as a side effect of sub-project work.

**Rationale:** Scope isolation is what makes multiple concurrent agents safe.
It guarantees that a sub-project agent cannot corrupt global memory or a
sibling project, and makes every change attributable to exactly one scope.

### IV. Mirror-Check Mandate

Framework-dependent code MUST be grounded in locally mirrored sources.

- Before proposing any code that depends on an external framework, library,
  or API, an agent MUST consult `knowledge/instructions.md` (global tier) —
  and the corresponding `projects/<name>/knowledge/instructions.md` when
  working inside a sub-project — for a registered local mirror under
  `reference/repos/`.
- If a mirror is registered, all proposed API usage MUST be grounded in the
  mirrored sources: signatures, module paths, and behaviors are taken from
  the mirror, not from recall.
- If no mirror is registered, the agent MUST NOT invent API usage. It MUST
  instead flag the missing mirror and request that one be registered before
  producing framework-dependent code.
- Ungrounded (hallucinated) API usage is a constitution violation regardless
  of whether it happens to be correct.

**Rationale:** Mirrors under `reference/repos/` (git-ignored local
framework checkouts) are the workspace's ground truth for third-party code.
Mandatory mirror-checks convert "plausible" agent output into verifiable
output and eliminate hallucinated dependencies at the source.

> **Annotation (v1.1.0; path updated v2.0.1):** the `mirror-sync` skill
> (`projects/governance-framework/.claude/skills/mirror-sync/`) is an *implementation
> aid* for this article — it routes lookups through the registries and stops
> on validation failures. Registry consultation and pin discipline remain
> normative under this article whether or not that skill loads; the skill
> adds convenience, never authority.

### V. Spec-First Lifecycle

No implementation work without an approved spec and plan.

- Every feature MUST begin by copying
  `projects/<name>/docs/specs/template/` to a numbered feature folder
  (e.g. `projects/<name>/docs/specs/001-feature-name/`).
- Within that folder, artifacts MUST be completed strictly in order:
  `spec.md` (what and why) → `plan.md` (how) → `tasks.md` (execution
  breakdown).
- Agents MUST NOT write implementation code, schemas, or configuration for a
  feature whose `spec.md` and `plan.md` are absent or unapproved.
- A change of direction discovered mid-implementation MUST flow back through
  the spec and plan before the implementation continues.

**Rationale:** In a file-and-agent methodology, the spec folder is the only
durable contract between intent and output. Skipping it produces code that
no reviewer, agent, or future session can trace to a requirement.

**Extension (v1.1.0 — material amendment):** agents are additionally
expected to plan before implementing and to produce validation evidence
(verifiable success criteria, test-first work where applicable) for feature
work under this article. This expectation is **ADVISORY**: it is delivered
as guidance via installed methodology skills and machine-tier conduct rules
(see Skills & Tooling Governance), and no mechanical enforcement (hooks,
settings gates) is installed by the workspace. Hard enforcement, if ever
required, must arrive as a separately reviewed hook-design specification
scoped to project settings — never as a silent addition.

## Inheritance

Every project constitution at `projects/<name>/.specify/memory/constitution.md`
(e.g. `projects/governance-framework/.specify/memory/constitution.md`) inherits this
document in full.

- A project constitution MAY add new project-specific principles and MAY
  tighten any constraint defined here (narrower scopes, stricter gates,
  additional required artifacts).
- A project constitution MUST NOT loosen, waive, exempt, or contradict any
  article of this document. A project-level clause that conflicts with the
  global tier is void, and the global clause prevails.
- Where a project constitution is silent, this document applies directly.

## Skills & Tooling Governance

The workspace recognizes a governed tooling inventory, declared in the
committed requirement declaration `knowledge/tooling.md`. Items are grouped
into categories DECLARED IN that file (v2.0.0: the category list lives with
the declaration, so additions no longer require constitutional churn).
Categories at this amendment: **conduct & methodology** (plugins and merged
conduct rulesets), **conversation sync** (the global skill plus per-tier
policy files), **workspace-native skills** (committed lifecycle/governance
skills and their advisory hooks), **workspace governance** (policy-bearing
directories such as `wip/`), and **MCP tools** (none active; playwright
deferred and absent from every gating artifact, reactivatable only via a
future feature spec naming a concrete browser surface plus a maintainer
amendment). `knowledge/tooling.md` is authoritative for the current
category list and row inventory.

Rules:

- **Machine tier acknowledged, not governed.** Machine-tier items
  (`~/.claude/` plugins, skills, and conduct files) are adjacent
  infrastructure OUTSIDE constitutional jurisdiction. Their state is
  recorded in each machine's Install Registry
  (`~/.sdd-core-ops/INSTALL-REGISTRY.md`); this constitution claims no
  authority over them and template content never includes them.
- **Declaration vs installation.** A `knowledge/tooling.md` row declares
  what the workspace requires or permits; it NEVER implies installation.
  Only a `complete` row in a machine's Install Registry, with a review
  record, means installed there.
- **Additions.** Any new skill, plugin, policy file, or MCP tool enters
  governance by adding a row to `knowledge/tooling.md` and registering in
  the machine Install Registry; external sources additionally require
  maintainer-approved source, pinned revision, and pre-install content
  review. No agent self-approves.

## Governance

This constitution supersedes all other conventions, instructions, and habits
where they conflict. `knowledge/instructions.md` provides operational
guidance; it operates under this constitution, never above it.

- **Authority.** Articles I–V are binding gates. Every `spec.md`, `plan.md`,
  and `tasks.md` MUST be checkable against them, and reviewers (human or
  agent) MUST verify compliance before approval. Violations are resolved by
  changing the spec, plan, or implementation — never by diluting an article.
- **Violations.** A detected violation (cross-project edit, ungrounded API
  usage, ad-hoc datastore, external model call, spec-less implementation)
  MUST be recorded in the affected feature folder and remediated before any
  dependent work proceeds.

### Maintenance Changes (v2.1.0)

Between the wip/ approval gates and this Amendment Procedure sits a third,
narrower path: the **maintainer-directed bounded change** — the route for
repairs and registrations that implement ALREADY-RATIFIED decisions or
correct defects against EXISTING binding text.

- **Authorization:** an explicit directive from the Workspace Maintainer's
  directing authority (Agent Zero). The directive's VERBATIM text MUST be
  recorded in the commit message (or the commit MUST cite the committed
  artifact carrying it). No directive, no change.
- **Permitted scope:** bounded repairs, documentation alignment, tooling and
  registry registrations, and execution of decisions already ratified by an
  amendment, gate, or recorded maintainer decision.
- **Exclusions:** this route NEVER amends a constitution (Amendment
  Procedure only); NEVER substitutes for Gate 1 or Gate 2; NEVER creates a
  new authoritative standard or policy (those arrive spec-first or through
  promotion); NEVER implements WIP content on the strength of WIP text
  alone.
- **Evidence and audit:** git history is the audit trail (the atomic commit
  and its message are the record); commits are scoped per authority boundary
  (root GLOBAL / single project), except as the Propagation exception below
  provides.
- **Relationship to gates:** the route operates UNDER the gates and this
  procedure — it can never grant what they grant.

### Amendment Procedure

- **Proposal.** Amendments are proposed as a Markdown change to this file,
  accompanied by a written rationale and an impact note listing every
  affected project constitution, template, and instruction file.
- **Review.** The workspace maintainer reviews and approves amendments;
  agents MUST NOT self-amend this document as a side effect of feature work.
  Sub-projects propose amendments upward — they never patch the global tier
  directly (Article III).
- **Versioning.** Amendments bump the version per SemVer for governance:
  MAJOR = backward-incompatible change, removal, or redefinition of an
  article; MINOR = a new article/section or materially expanded guidance;
  PATCH = clarifications and non-semantic refinements. The Sync Impact
  Report at the top of this file and the metadata line below MUST be updated
  in the same change.
- **Propagation.** Approved amendments MUST be propagated in the same change
  to every inheriting project constitution and any dependent template under
  `projects/<name>/docs/specs/template/` that references the amended text.
  A root amendment plus its mandated propagation constitutes ONE
  root-authority act and MAY land as one commit — an express exception
  (v2.1.0) to per-scope commit discipline; Article III's cross-project-edit
  ban targets sub-project agents, not root-scoped propagation this document
  itself requires. Where same-change propagation is impracticable, the Sync
  Impact Report documents the deviation and names the follow-up commits.

**Version**: 2.1.0 | **Ratified**: 2026-07-17 | **Last Amended**: 2026-07-21
