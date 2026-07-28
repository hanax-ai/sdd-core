# Workspace Proposal: SDD-Core Reset Architecture

## Provenance

1. **Originating WIP item:** `SDD-Core_Reset_Alignment_Remediation_Plan_Draft.md`
2. **WIP creation date:** 2026-07-28
3. **Promoted WIP SHA-256:**
   `7360D5E5309F18AB5FC0093C1C2385395BAE437FF3A2CD84FCB8B8D4F22AD153`
4. **Promotion approval directive (verbatim):**
   `Approved for promotion: SDD-Core_Reset_Alignment_Remediation_Plan_Draft.md (SHA-256: 7360D5E5309F18AB5FC0093C1C2385395BAE437FF3A2CD84FCB8B8D4F22AD153) → docs/proposals/sdd-core-reset-architecture.md`
   — issued 2026-07-28.
5. **Approving authority:** Agent Zero (the Workspace Maintainer's directing
   authority).
6. **Summary of the approved idea:** align SDD-Core with the reset model by
   removing the embedded `projects/` architecture, preserving and relocating
   valid framework and operational-governance material, establishing portable
   adoption and operationalization contracts, and defining versioned
   integration boundaries for Fusion Harness, Agent Workflow, and review-only
   CI/CD.
7. **Target artifact path (self-reference):**
   `docs/proposals/sdd-core-reset-architecture.md`

This section freezes what Gate 1 approved. The originating WIP remains a
non-authoritative planning artifact. If it changes after promotion, this
provenance and digest continue to identify the exact promoted revision.

## Status and authority boundary

**Promoted architecture proposal — NOT approved for implementation.**

Gate 1 authorizes this proposal's existence and review. It does not authorize:

- moving, creating, editing, or deleting the proposed implementation paths;
- changing the constitution, adapters, registries, templates, or verifier;
- installing or invoking Fusion Harness or Agent Workflow;
- changing machine-tier `conversation-sync`;
- enabling model calls, agentic remediation, Autofix, commits, pushes, merges,
  releases, or deployments based on this proposal;
- modifying another repository.

Execution requires normal SDD specification, planning, and task artifacts plus
an exact Gate 2 directive:

`Approved for implementation: <exact specification or plan>`

## 1. Problem

SDD-Core's approved reset direction and its current repository model do not
match.

The reset establishes that:

- SDD-Core is the file-native methodology and governance source, not an
  application runtime or centralized project repository.
- Applications are independent repositories that adopt an immutable SDD-Core
  release.
- Framework definition and operational governance are distinct internal
  responsibilities, not application projects.
- Fusion Harness and Agent Workflow are independent systems connected through
  versioned SDD-Core contracts.
- CI/CD begins as deterministic validation plus advisory review, without
  automatic remediation.

The current repository still defines a multi-project workspace, places
framework and operations under `projects/`, provisions new sub-projects inside
SDD-Core, and encodes those assumptions in its constitutions, adapters,
registries, templates, documentation, and structural verifier.

Deleting `projects/` without a governed migration would discard valid work and
leave the remaining authority artifacts contradictory. The reset therefore
requires a contract-first structural and constitutional migration.

## 2. Architectural decision

SDD-Core will use the following responsibility model:

| Component | Responsibility | Explicit boundary |
|---|---|---|
| **SDD-Core** | Defines methodology, governance, lifecycle, authority, adoption, integration, compatibility, and evidence contracts | Does not execute project work or store portfolio operational state |
| **Governance framework domain** | Defines reusable principles, policies, standards, decision rights, and framework specifications — the **what and why** | Does not operate recurring controls or execute project missions |
| **Operational-governance domain** | Defines recurring procedures, runbooks, registers, cadences, and evidence operations — the **how and when** | Does not redefine framework policy or become an application runtime |
| **Project repository** | Owns requirements, source, runtime, persistence, deployment, decisions, approvals, Git history, and durable evidence | Does not live inside SDD-Core |
| **Fusion Harness** | Executes authorized missions using governed agents, models, skills, hooks, tools, MCP operations, isolation, and validation | Cannot mint authority or own project truth |
| **Agent Workflow** | Registers, records, coordinates, and schedules authorized missions and their durable execution state | Does not execute agents or create authority |
| **CI/review services** | Produce deterministic results and advisory findings | Evidence does not become authority |
| **Agent Zero** | Holds the non-delegable directing authority defined by SDD-Core | Approval is item-specific and action-specific |

The governing relationship is:

```text
SDD-Core defines.
Agent Workflow coordinates and records.
Fusion Harness executes.
Each project owns its work, authority records, and durable evidence.
```

## 3. Target repository structure

The approved target model is:

```text
sdd-core/
├── .specify/
│   └── memory/
│       └── constitution.md
├── governance/
│   ├── framework/
│   └── operations/
├── contracts/
│   ├── adoption/
│   │   ├── README.md
│   │   └── project-adoption.schema.json
│   ├── authority/
│   │   ├── README.md
│   │   └── mission-envelope.schema.json
│   └── evidence/
│       ├── README.md
│       └── evidence-envelope.schema.json
├── integrations/
│   ├── fusion-harness/
│   │   ├── README.md
│   │   ├── binding.schema.json
│   │   └── compatibility.yaml
│   ├── agent-workflow/
│   │   ├── README.md
│   │   ├── registration.schema.json
│   │   └── status.schema.json
│   └── ci-cd/
│       └── README.md
├── bootstrap/
│   └── new-project.md
├── templates/
│   └── project/
│       ├── .sdd-core/
│       │   └── adoption.yaml
│       ├── .specify/
│       │   └── memory/
│       │       └── constitution.md
│       ├── conversations/
│       │   └── SYNC-POLICY.md
│       ├── knowledge/
│       │   └── instructions.md
│       ├── wip/
│       │   └── README.md
│       ├── AGENTS.md
│       ├── CLAUDE.md
│       └── README.md
├── conversations/
├── docs/
├── knowledge/
├── reference/
├── wip/
├── .claude/
├── .agents/
├── .codex/
└── verify-layout.sh
```

`projects/` is not part of the target architecture.

## 4. Structural migration requirements

### R1 — Preserve valid material

The migration must use an explicit path map covering every tracked artifact
under the current internal governance trees.

The primary moves are:

```text
projects/governance-framework/ → governance/framework/
projects/governance-ops/       → governance/operations/
```

Valid history must be preserved with Git-aware moves. Content may be merged,
superseded, or removed only when the path map records its disposition and
rationale. The `projects/` directory is removed only after it is empty and all
live authority references are migrated.

### R2 — Replace project semantics with domain semantics

The two relocated trees are internal SDD-Core governance domains:

- `FRAMEWORK-DEFINITION`
- `OPERATIONAL-GOVERNANCE`

They are not independent product repositories and must not retain language that
grants them application-project identity.

### R3 — Perform one atomic authority migration

Directory moves, root constitution changes, internal constitution changes,
ownership updates, context-routing updates, and verifier changes form one
atomic migration boundary. The repository must not publish an intermediate
state in which the filesystem and authority model disagree.

## 5. Constitutional and authority requirements

### R4 — Reframe the root constitution

The root constitution must describe SDD-Core as the source framework repository
with independent adopters. It must remove live `projects/<name>/` inheritance
and jurisdiction language while preserving:

- Gate 1 and Gate 2;
- WIP non-authority;
- human directing authority;
- source grounding;
- no silent bypass;
- scope isolation;
- cross-repository authority boundaries;
- adopter ownership;
- tooling and supply-chain governance.

### R5 — Define internal SDD-Core scopes

The constitution and ownership standard must distinguish:

- root GLOBAL governance;
- framework-definition work;
- operational-governance work.

Internal scope separation prevents framework policy from being silently changed
through operations and prevents operational records from being mistaken for
normative policy.

### R6 — Preserve adopter sovereignty

An adopting project inherits SDD-Core only through its committed adoption
record and local constitution. Adoption grants SDD-Core, its agents, and its
integrations no implicit permission to:

- write project files;
- approve plans or implementation;
- merge, release, or deploy;
- access operational data;
- change another repository;
- widen a mission.

## 6. Portable adoption contract

### R7 — Establish a tool-neutral canonical layer

Every adopting repository must contain a committed `.sdd-core/adoption.yaml`
record validated against `contracts/adoption/project-adoption.schema.json`.

The adoption contract must identify:

- schema version;
- project ID and canonical repository identity;
- adopted SDD-Core version, source, and digest;
- local constitution path and digest;
- adoption date and authority reference;
- required, tailored, and excluded provisions;
- rationale and authority for each tailoring;
- Fusion Harness binding status and integration-profile version;
- Agent Workflow registration status and integration-profile version;
- CI/CD profile status;
- supersession history.

Gate 2, WIP non-authority, scope isolation, and cross-repository authority
boundaries form the protected provision set. The schema must require every
protected provision to remain classified as `required` and must reject its
omission, exclusion, or placement in `tailored`. A later constitutional
amendment may change the protected set only through a new schema version and
the normal SDD-Core amendment process.

Contract objects must reject undeclared properties. Secrets, credentials,
tokens, connection strings, and personal machine paths are prohibited.

### R8 — Treat assistant-specific files as adapters

`.sdd-core/`, the local constitution, and repository governance are canonical.
`AGENTS.md`, `CLAUDE.md`, `.claude/`, `.agents/`, `.codex/`, and other
assistant-specific surfaces are subordinate adapters. They may improve pickup
and usability but cannot create authority or replace the portable contract.

### R9 — Keep the project template architecture-neutral

The template establishes governance and adoption only. It must not prescribe:

- frontend or backend frameworks;
- programming languages;
- databases or persistence products;
- `ui/`, `services/`, or `database/` directories;
- deployment architecture;
- cloud providers;
- application runtime structure.

Those choices belong to each project.

## 7. Governed operationalization

### R10 — Separate initiation from acceptance

A natural-language instruction may initiate project operationalization, but
prompt interpretation is not evidence of completion.

`bootstrap/new-project.md` defines the canonical operationalization process.

Operationalization succeeds only when deterministic checks establish:

1. independent repository identity and boundary;
2. immutable SDD-Core version and digest;
3. valid local adoption contract and constitution;
4. compatible Fusion Harness binding;
5. valid Agent Workflow registration contract;
6. integration-profile compatibility;
7. required policy and capability state;
8. a complete initialization evidence report.

If a required identity, digest, contract, or compatible release cannot be
established, operationalization is `BLOCKED`.

### R11 — Define automatic read-only readiness

Opening an operationalized project may automatically:

- verify identities, versions, digests, and compatibility;
- assemble applicable governance context;
- inspect allowlisted manifest and configuration metadata that describes
  agents, skills, hooks, models, tools, and MCP capabilities;
- calculate capability policy;
- report missing prerequisites.

Capability discovery is metadata-only. It may not execute plugin or adapter
code, make network calls, invoke hooks, initialize connections, or read secret
values. Prerequisite reporting must use only the inspected allowlisted
metadata.

Readiness may not:

- call models;
- mutate repository or governed state, including project files, global
  governance, adoption or registration records, authority or evidence state,
  branches, and worktrees;
- execute arbitrary hooks;
- invoke state-changing MCP operations;
- start an agent team;
- advance a governance gate.

When necessary, readiness may use explicitly non-authoritative, disposable
ephemeral caching outside governed repositories and durable governed state.
Such caching cannot contain secret values or become evidence, authority, or
registration state.

## 8. Shared contract model

### R12 — Authority envelope

`contracts/authority/mission-envelope.schema.json` defines the bounded authority
passed to an executor. It must cover:

- a unique mission ID and nonce;
- authenticated issuer identity, initiating authority, authority reference,
  and trigger;
- issuance time, expiration time, and revocation or supersession status;
- canonical serialization, digest, and a verifiable issuer signature under the
  approved trust profile;
- replay-protection and consumption state;
- project identity, frozen policy version, base commit, and branch;
- allowed paths, repositories, environments, capabilities, tools, and MCP
  operations;
- prohibited actions;
- validation and evidence requirements;
- time, attempt, retry, model-cost, and resource limits;
- expiration and completion conditions;
- next authority boundary.

The envelope must be pre-issued, immutable, unexpired, and mechanically
verifiable before execution. No agent, model, hook, tool, integration, or
workflow may mint, refresh, reinterpret, or expand it.

### R13 — Evidence envelope

`contracts/evidence/evidence-envelope.schema.json` defines the shared,
content-addressable evidence core used by CI, Fusion Harness, and Agent Workflow
references.

SDD-Core owns the schema, not the operational evidence. The project repository
owns durable project evidence. Agent Workflow may retain immutable references
and coordination state without becoming the evidence authority.

### R14 — Separate evidence, coverage, execution, and authority states

Status models must not collapse:

- deterministic validation;
- AI-review coverage;
- integration health;
- workflow execution;
- human authority.

A passing test, completed run, clean review, commit, or merge is evidence only.
It does not grant remediation, merge, release, or deployment authority.

## 9. Fusion Harness integration

### R15 — Versioned binding profile

`integrations/fusion-harness/` must define:

- canonical source;
- immutable release version and digest;
- supported SDD-Core compatibility;
- installation and verification requirements;
- project binding schema;
- capability policy;
- readiness semantics;
- upgrade and rollback behavior;
- authority and evidence contract versions.

Harness installation and binding are mandatory outcomes of operationalization.
A project remains `BLOCKED` when no compatible, verified, immutable Harness
release exists.

### R16 — Execution boundary

Fusion Harness may execute only after a recognized SDD trigger establishes a
valid mission envelope. It may automate authorized analysis, implementation,
testing, correction, validation, and evidence preparation, then stops at the
next authority boundary.

## 10. Agent Workflow integration

### R17 — Versioned registration profile

`integrations/agent-workflow/` must define:

- automatic read-only project registration;
- project, SDD-Core, and Harness identities and digests;
- registration and compatibility status;
- authority-reference requirements;
- mission and work-order status contracts;
- evidence-reference requirements;
- outage, outbox, and reconciliation behavior.

Agent Workflow records and schedules authorized work. It cannot execute agents,
invoke project mutations, or mint authority.

### R18 — Degraded local execution

When Agent Workflow is unavailable, local Fusion Harness execution may continue
only when the adopted policy explicitly permits degraded execution and a
pre-issued mission envelope remains authenticated, unexpired, unrevoked,
unsuperseded, and unused or otherwise replay-safe. The Harness must verify the
issuer, canonical digest and signature, mission ID and nonce, issuance and
expiration times, revocation or supersession status, replay state, frozen
policy, and base commit before continuing. Degraded mode may not create
missions, refresh expired envelopes, expand authority, alter frozen policy or
the base commit, or bypass reconciliation requirements. The project reports
`DEGRADED`. Portfolio coordination, cross-project state, and centralized
scheduling stop until reconciliation is safe.

Agent Workflow's SQLite-versus-PostgreSQL choice remains its own governed
implementation decision behind the service boundary and is not part of the
SDD-Core integration contract.

## 11. CI/CD integration

### R19 — Review-only baseline

The CI/CD profile begins with:

- required deterministic validation;
- optional advisory AI review;
- normalized evidence;
- explicit tool-failure reporting;
- separate validation, review-coverage, and authority states.

CodeRabbit or equivalent review tooling is an evidence producer, not an
orchestrator or approval authority.

### R20 — Remediation remains disabled

The review-only baseline does not enable:

- Claude Action or another coding agent from findings;
- Agent Workflow remediation scheduling;
- Fusion Harness remediation execution;
- Autofix;
- automatic commits, pushes, pull requests, merges, releases, or deployments.

Those capabilities remain a separately gated dormant roadmap.

## 12. Conversation and WIP routing

### R21 — Consolidate SDD-Core internal conversation routing

Framework-definition and operational-governance conversations belong to the
root SDD-Core conversation system with explicit domain metadata. They must not
retain fake application-project identity merely to preserve the old path model.

### R22 — Update independent-repository conversation compatibility separately

The current machine-tier `conversation-sync` skill assumes
`projects/<active-project>/conversations/SYNC-POLICY.md`. Independent
repositories require a separately authorized machine-tier revision that
resolves the active repository's own root `conversations/SYNC-POLICY.md`.

This proposal records the dependency but does not authorize the machine-tier
change.

## 13. Verification and release requirements

### R23 — Target invariants

The migration must provide deterministic checks that:

- require the approved target directories;
- reject tracked `projects/` content;
- reject live legacy structural references in authoritative files;
- validate adoption, binding, registration, authority, and evidence fixtures;
- detect version and digest mismatches;
- preserve skill-mirror and adapter invariants;
- run on Linux and Windows.

Historical references may remain only in a migration map or changelog and must
be explicitly marked superseded.

### R24 — Migration evidence

The final evidence package must include:

- canonical origin, branch, and starting commit;
- pre-migration verifier result;
- complete current-to-target path map;
- moved, merged, superseded, and removed artifact inventory;
- constitution and contract versions;
- schema and structural verification;
- Linux and Windows CI results;
- independent review;
- final commit and tree digest;
- rollback and supersession instructions;
- unresolved external dependency list.

### R25 — Release treatment

The implementation specification must establish release state before computing
the version:

- if no stable `v3.0.0` release exists, the reset may supersede
  `v3.0.0-rc.1` through a new release candidate;
- if stable `v3.0.0` exists, the reset is a major-version change.

Existing adopters do not upgrade silently.

## 14. Sequencing

The approved order is:

1. Promote and review this SDD-Core architecture proposal.
2. Author the formal SDD-Core implementation specification, plan, and tasks.
3. Obtain exact Gate 2 authority.
4. Implement the SDD-Core migration and contracts.
5. In a separate authorized cycle, publish the compatible Fusion Harness
   contract and release.
6. In a separate authorized cycle, formalize Agent Workflow's SDD lifecycle,
   commit its identity rebaseline, and publish its first contract version.
7. In a separate machine-tier change, update `conversation-sync` for
   independent repository roots.
8. Pilot the review-only baseline using SDD-Core plus one project.
9. Evaluate evidence before advancing any remediation stage.
10. Return to CentCom only through its separately pinned architecture decision.

At no point may active implementation span SDD-Core, Fusion Harness, and Agent
Workflow simultaneously.

## 15. Non-goals

This proposal does not:

- implement the target structure;
- remove or move current repository content;
- select a runtime language for Fusion Harness or Agent Workflow;
- choose Agent Workflow's production database;
- implement CentCom;
- establish CentCom authority;
- activate CI remediation;
- grant cross-repository write authority;
- install tools, models, plugins, skills, hooks, or MCP servers;
- authorize merge, release, or deployment.

## 16. Acceptance criteria for the future implementation

The reset implementation is complete only when:

1. tracked SDD-Core content contains no `projects/` directory;
2. valid framework and operational-governance history is preserved at the
   approved paths;
3. the constitution, README, adapters, registries, standards, templates, and
   verifier describe one architecture;
4. SDD-Core contains no application source, project operational state,
   portfolio registry, or execution runtime;
5. the canonical project template is vendor-neutral and technology-neutral;
6. adoption, authority, evidence, Harness binding, Workflow registration, and
   CI review contracts are explicit and mechanically validatable;
7. operationalization cannot report success without deterministic evidence;
8. readiness remains automatic and read-only;
9. remediation remains disabled;
10. Linux and Windows verification pass;
11. an independent reviewer confirms that evidence and workflow state cannot
    create authority;
12. release, upgrade, rollback, and supersession evidence is complete.

## 17. Stop conditions

Implementation must stop and return to Agent Zero if:

- the implementation artifact lacks exact Gate 2 authority;
- the active repository, base commit, or release state cannot be established;
- pre-existing changes or active claims overlap the authorized edit set;
- a move would discard or ambiguously merge valid material;
- the constitution version cannot be computed;
- a required external release or immutable digest does not exist;
- schema validation cannot be deterministic;
- work requires another repository or machine-tier mutation without separate
  authority;
- any step would activate remediation, merge, release, or deployment beyond
  its authority envelope.

## 18. Next authority boundary

The next authorized activity is review and refinement of this proposal.

Implementation remains prohibited until formal specification, plan, and task
artifacts exist and Agent Zero issues an exact Gate 2 directive identifying the
approved implementation artifact.
