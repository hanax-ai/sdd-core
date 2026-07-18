<!--
SYNC IMPACT REPORT
==================
Version change: (unratified) → 1.0.0
Bump rationale: Initial ratification of the master global constitution for the
  Hana-X Copilot workspace. MAJOR baseline because it establishes binding
  governance where none previously existed.

Principles defined:
  I.   Local Open-Source Models Only
  II.  Standardized Data Layer
  III. Isolated Agent Scopes
  IV.  Mirror-Check Mandate
  V.   Spec-First Lifecycle

Added sections:
  - Inheritance
  - Governance (with Amendment Procedure)

Follow-up TODOs: none. All paths in this document are relative to the
workspace root (the directory containing this file's `.specify/` tree).
-->

# Hana-X Copilot Constitution

Hana-X Copilot is an AI-native, multi-project Spec-Driven Development (SDD)
workspace operated entirely through files and agents: agents read and write
structured Markdown, and the SDD lifecycle itself requires no CLI tool,
runtime, or build step. These principles are binding guardrails on every
agent, human contributor, and sub-project under `projects/`. They govern the
GLOBAL tier (`.specify/memory/`, `knowledge/`, `docs/`, `reference/`) and,
through inheritance, every PER-PROJECT tier (`projects/<name>/`).

## Core Principles

### I. Local Open-Source Models Only

All model inference MUST run on locally hosted open-source models served via
Ollama.

- No subsystem, agent, script, or generated artifact MAY call a proprietary
  or external LLM API (hosted inference endpoints, cloud model gateways, or
  third-party completion/embedding services).
- Model selection, prompting, and embedding pipelines MUST assume an
  Ollama-served local model as the only inference backend.
- Specs and plans that require model capabilities MUST name the local model
  family they target; a plan that silently depends on an external model API
  is invalid.

**Rationale:** The workspace handles customer-adjacent systems (e.g. SAP
S/4 HANA integrations in `projects/project-a/`). Keeping inference local
guarantees data sovereignty, offline operability, and cost predictability,
and removes an entire class of credential and egress risk.

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
  `knowledge/instructions.md`, `docs/`, `reference/`) but MUST treat it as
  read-only.
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

## Inheritance

Every project constitution at `projects/<name>/.specify/memory/constitution.md`
(e.g. `projects/project-a/.specify/memory/constitution.md`) inherits this
document in full.

- A project constitution MAY add new project-specific principles and MAY
  tighten any constraint defined here (narrower scopes, stricter gates,
  additional required artifacts).
- A project constitution MUST NOT loosen, waive, exempt, or contradict any
  article of this document. A project-level clause that conflicts with the
  global tier is void, and the global clause prevails.
- Where a project constitution is silent, this document applies directly.

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

**Version**: 1.0.0 | **Ratified**: 2026-07-17 | **Last Amended**: 2026-07-17
