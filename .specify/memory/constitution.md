<!--
SYNC IMPACT REPORT
==================
Version change: 2.1.0 → 3.0.0
Bump rationale: MAJOR — three articles redefined: Article I rescoped to
  workspace-bounded inference governance with adopter-owned inference;
  Article II redefined from a universal fixed data layer to persistence
  governance (file-native SDD-Core authority, no universal PostgreSQL/Qdrant
  mandate, no reserved product-context stack, adopter-owned operational
  persistence, amendment trigger limited to new authoritative/operational
  SDD-Core storage); Article IV redefined from mandatory local mirrors to
  authoritative-source grounding with project-owned mechanisms. New
  Methodology Core & Adoption section (source-project role, mandatory local
  installation, non-waivable core, tailoring classes, adoption manifest).

Amendment rationale (maintainer directive: Agent Zero's issued SDD-Core
  v3.0.0 amendment directive of 2026-07-25, approving the consolidated R2
  amendment proposal identified by SHA-256
  `59B178937DD820719925D60B95A8259A373ACC1533558D3DB90E4FBAEE99F072`;
  the directive's full five-paragraph text is recorded verbatim in this
  amendment's commit message, which is the durable authority record): the
  accepted three-project program
  architecture (PAD-001, §3 and §12; settled decision DEC-006) reclassifies
  Ollama, PostgreSQL/Qdrant, and mandatory local mirrors as project
  architecture choices, not universal SDD methodology, while requiring
  complete pinned-release installation, the methodology core, source
  grounding, reproducibility, security, and human gate authority to remain
  binding (RAID D-001, I-002, I-004, I-006, R-001, R-002, A-004, I-017,
  I-019).

Changes in this amendment:
  - Article I retitled "Inference Governance (v3.0.0 — scope-bounded)";
    workspace-bounded mandates; adopting-projects context added; SDD-Core's
    local-inference target retained as project-local only.
  - Article II retitled "Persistence Governance (v3.0.0 — redefined)";
    file-native authority for SDD-Core records; universal PostgreSQL/Qdrant
    mandate removed (including any reserved product-context stack);
    project-governed non-authoritative rebuildable indexes/caches permitted
    via the reviewed spec/plan route; amendment required only for a new
    authoritative system of record or operational datastore outside that
    class; adopter-owned persistence; shared-database and
    cross-project-write prohibitions preserved.
  - Article IV retitled "Authoritative-Source Grounding (v3.0.0 —
    redefined)"; grounding outcomes mandated; mechanisms project-owned;
    this workspace retains local mirrors as its chosen control; G-05 left to
    CENTCOM governance.
  - New "Methodology Core & Adoption" section (source-project role,
    mandatory local installation list, non-waivable core with the no-silent-
    omission/rename/collapse/bypass rule, tailoring classes, adoption
    manifest, jurisdiction incl. unrelated-external-project exclusion and
    no-live-coupling rule).
  - No change to Articles III and V, Inheritance, Skills & Tooling
    Governance, Maintenance Changes, or the Amendment Procedure.

Impact note — files changed in this same amendment (one commit, per the
  v2.1.0 propagation exception): this file; both project constitutions
  (appended propagation entries; governance-framework → 3.1.2,
  governance-ops → 1.1.2, PATCH — no project article changes); both plan
  templates (Storage and Complexity Tracking rows) and both tasks templates
  (grounding-check wording); README.md (incl. process-flow image alt text);
  AGENTS.md; knowledge/instructions.md (reframed as the project-owned
  Article IV mechanism); docs/assets/process_flow.svg (mirror-registry
  terminology updated to grounding-registry terminology — same change, no
  deferral); verify-layout.sh (Article IV sentinel replaced; v3 sentinels
  added); CHANGELOG.md.

Previous reports: 2.1.0 (Maintenance Changes route; propagation exception;
  .claude/ tier — 2026-07-21); 2.0.1 (path/example refresh after sub-project
  renames — 2026-07-20); 2.0.0 (Article I redefined as context-split
  inference governance — 2026-07-20); 1.1.0 (Skills & Tooling Governance;
  Article IV annotation; Article V advisory extension — 2026-07-19); 1.0.0
  (initial ratification — 2026-07-17).

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

### I. Inference Governance (v3.0.0 — scope-bounded)

Model inference is governed by CONTEXT, and this article's technology mandates
bind ONLY this workspace — the SDD-Core repository and its sub-projects. SDD-Core
imposes NO portfolio-wide or adopter-wide inference architecture. Three contexts:

**SDD-Core product/runtime inference** — inference performed by subsystems this
workspace itself ships (none exist today):

- The TARGET architecture for SDD-Core's own shipped inference remains locally
  hosted open-source models served via Ollama. This is a deferred, PROJECT-LOCAL
  requirement — SDD-Core's own architectural choice, binding only if SDD-Core
  implements product inference, and never a rule for any other project.
- Once implemented, SDD-Core product inference MUST NOT silently call
  proprietary or external LLM APIs; a spec that genuinely needs hosted product
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

**Adopting projects** — projects that adopt a pinned SDD-Core release
(see Methodology Core & Adoption):

- Each adopting project selects and governs its OWN inference architecture under
  its own constitution and reviewed spec/plan artifacts. Nothing in this article
  transfers SDD-Core's project-local choices to an adopter.
- Non-waivable outcomes still bind through the Methodology Core: inference
  choices are recorded in reviewed artifacts, grounded per Article IV,
  reproducible, security-reviewed, and subject to endpoint discipline. A plan
  that silently depends on an undeclared inference provider is invalid in any
  adopting project.

**Rationale:** The v2.0.0 context split fixed this article for the workspace's
own agents; the three-project program architecture (PAD-001 §12) requires the
same fix outward. Inference architecture is a project decision; governed specs,
grounding, reproducibility, and endpoint discipline are the methodology. SDD-Core
keeps its own local-first target without exporting it.

### II. Persistence Governance (v3.0.0 — redefined)

Persistence is governed by AUTHORITY and OWNERSHIP, not by a fixed portfolio
stack. No universal datastore mandate exists: PostgreSQL and Qdrant are no
longer required of SDD-Core, its sub-projects, or any adopting project — and no
fixed product-context stack is reserved for SDD-Core's currently nonexistent
product systems.

**SDD-Core authoritative records — file-native:**

- The authoritative form of SDD-Core's methodology and governance records —
  constitutions, specs, plans, tasks, templates, standards, registers, gate and
  amendment records, provenance — is Git-managed flat files (Markdown and
  similar plain text). They MUST remain diffable, reviewable, and hash-bindable
  without any runtime.
- No datastore may become the system of record for any SDD-Core authoritative
  artifact. External architecture (including CENTCOM or Agent Workflow /
  coordination-harness designs) is NEVER justification for operational storage
  inside SDD-Core.

**Non-authoritative indexes and caches (expressly permitted class):**

- A derived, non-authoritative, rebuildable index or cache (e.g., a search or
  telemetry read-model) MAY exist only when a reviewed, project-governed
  `spec.md`/`plan.md` (Article V) declares it. It MUST be rebuildable from the
  canonical files, MUST NOT be committed as authority, and never substitutes
  for the file-native record. No agent introduces a durable store outside a
  reviewed artifact. This class requires the reviewed spec/plan route — it does
  NOT require a constitutional amendment.

**Adopting projects:**

- Each adopting project OWNS and governs its operational persistence under its
  own constitution and reviewed artifacts (choice, schema, security, backup,
  recovery, migration). SDD-Core neither selects nor approves an adopter's
  datastore.

**Boundaries (preserved and binding on all of the above):**

- No shared operational database across projects.
- No unauthorized cross-project write of any kind (Article III).
- A constitutional amendment is required ONLY for a new AUTHORITATIVE system of
  record or a new OPERATIONAL datastore for SDD-Core itself — that is, any
  SDD-Core storage outside the expressly permitted non-authoritative,
  rebuildable index/cache class above. Such storage MUST be raised as a
  proposed amendment to this constitution, never implemented unilaterally.

**Rationale:** Two fixed stores made sense when one workspace was the whole
program. The accepted architecture gives each peer project its own authoritative
persistence (Git files, PostgreSQL/Supabase, SQLite respectively) with no shared
database; what generalizes is the DISCIPLINE — single authoritative home,
reviewed storage decisions, rebuildable secondaries, hard cross-project
boundaries — not the brand of database.

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

### IV. Authoritative-Source Grounding (v3.0.0 — redefined)

Framework- and external-source-dependent claims MUST be grounded in
authoritative sources with immutable, verifiable identity — never in recall.

- Before proposing any code, spec text, or plan step that depends on an
  external framework, library, or API, an agent MUST consult the applicable
  grounding registry — `knowledge/instructions.md` (global tier) and the
  corresponding `projects/<name>/knowledge/instructions.md` — for a registered
  grounding source.
- Every grounded claim carries source identity: source name, pinned version /
  commit / tag, path or URL, and — where the source is retrieved rather than
  content-addressed — retrieval evidence and a content digest. Signatures,
  module paths, and behaviors are taken from the registered source at its pin,
  not from memory.
- If no grounding source is registered, the agent MUST NOT invent API usage.
  It MUST stop, flag the missing source, and request registration before
  producing dependent work.
- Ungrounded (hallucinated) API usage is a constitution violation regardless of
  whether it happens to be correct.

**Grounding mechanisms are project-owned.** Each project (this workspace and
every adopting project) selects the mechanism its registry rows use: local
mirrors, pinned upstream checkouts, vendored snapshots, or content-pinned
official documentation. THIS workspace retains local mirrors under
`reference/repos/` with the registries in `knowledge/instructions.md` as its
chosen, project-owned control — retained by choice, not exported as a mandate.
Adopting projects choose and govern their own mechanism in their own
registries; the grounding OUTCOMES above are non-waivable either way.

> **Annotation (v1.1.0; paths updated v2.0.1; retained under v3.0.0):** the
> `mirror-sync` skill
> (`projects/governance-framework/.claude/skills/mirror-sync/`) remains an
> *implementation aid* for this workspace's mirror-based mechanism — it routes
> lookups through the registries and stops on validation failures. Registry
> consultation and pin discipline remain normative whether or not that skill
> loads; the skill adds convenience, never authority.

**Rationale:** What eliminates hallucinated dependencies is the verifiable pin
and the stop-when-ungrounded rule, not the physical location of the copy.
Mirrors remain this workspace's mechanism of choice; the constitution now
mandates the outcome (immutable identity, provenance, verification,
reproducibility) and leaves the mechanism to each project's governance.
CENTCOM's existing G-05 mirror requirement is expressly NOT disposed here — it
is re-reviewed under CENTCOM governance (PAD-001 §12).

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

## Methodology Core & Adoption (v3.0.0)

SDD-Core is the methodology SOURCE project: it authors, versions, and releases
the methodology, and records its own release version and immutable commit. It
is NOT an adopter of itself and maintains no self-referential adoption
manifest. Downstream projects deliberately admitted to the portfolio adopt
PINNED SDD-Core releases — a reviewed snapshot, deliberately re-pinned on
upgrade. Pinned adoption creates NO live coupling: no dynamic dependence on a
sibling checkout and no unpinned flow of future SDD-Core changes.

**Mandatory local installation.** Every portfolio project, and every future
project deliberately admitted under SDD-Core, MUST install locally from its
pinned release:

1. the canonical SDD-Core constitution;
2. the canonical templates;
3. the canonical process and feature lifecycle definition;
4. the governance gates;
5. the required deliverables; and
6. the conformance validation rules needed to prove conformance.

Core requirements CANNOT be silently omitted, renamed away, collapsed, or bypassed.
A project may extend the baseline or explicitly tailor it to its
product boundary only through the recorded tailoring classes below.

**Non-waivable methodology core.** No adoption, tailoring, or project
constitution may waive, dilute, or silently omit:

1. Structured specifications as the primary source of truth, and the canonical
   lifecycle `spec.md` → `plan.md` → `tasks.md` → execute → validate for
   substantive feature work — three DISTINCT artifacts, never collapsed into
   one document.
2. The bounded Maintenance Changes route and its exclusions (Governance
   section): maintainer-directed bounded changes never amend a constitution,
   never substitute for Gate 1 or Gate 2, never create new policy, never
   implement WIP content on WIP authority alone.
3. Human gate authority: Gate 1 promotion and Gate 2 implementation approval
   are issued only by the designated human authority and cannot be delegated
   to agents, CI, reviews, merges, or workflow state.
4. Spec-first discipline: no implementation without an approved spec and plan
   (Article V).
5. Authoritative-source grounding outcomes (Article IV).
6. Endpoint Discipline: no credentials, hostnames, tenant identifiers, or
   customer data in committed artifacts.

**Permitted tailoring classes.** An adopting project MAY, with recorded
rationale and authority:

- (a) select its own technology (inference, persistence, runtime, tooling)
  within Articles I, II, and IV as rescoped;
- (b) map directory naming and layout to its repository conventions;
- (c) ADD stricter gates, artifacts, or checks;
- (d) adapt template fields to its product domain;
- (e) exclude a genuinely inapplicable non-core provision — explicitly, per
  provision, with rationale and approving authority.

Tailoring is never silent: an omission without a manifest record is a
conformance failure, not a tailoring.

**Adoption manifest.** Every adopting repository maintains a version-controlled
adoption manifest recording, at minimum: adopted SDD-Core release and immutable
commit; source repository and canonical paths; installed artifact paths and
SHA-256 content digests; local installation paths; every extension and every
tailored or excluded provision with class, rationale, and approving authority;
the repository-local authority order; effective date; and supersession history.
Conformance is checkable against the manifest; a project that cannot produce
one has not adopted SDD-Core.

**Jurisdiction.** These provisions bind this workspace and projects that adopt
SDD-Core into this portfolio. They claim no authority over unrelated external
projects that have not deliberately adopted SDD-Core or joined the portfolio,
and adoption grants SDD-Core no authority over an adopter's implementation,
repository, releases, or datastores.

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

**Version**: 3.0.0 | **Ratified**: 2026-07-17 | **Last Amended**: 2026-07-25
