---
title: Hana-X SDD-Core Constitution
version: 4.0.0
status: ratified-implementation-candidate
ratified: 2026-07-17
last_amended: 2026-07-28
release_candidate: v4.0.0-rc.1
authority: Agent Zero
---

<!--
SYNC IMPACT REPORT
==================
Version change: 3.0.0 -> 4.0.0
Bump rationale: MAJOR. SDD-Core changes from a multi-project workspace with
embedded project inheritance to a source-framework repository with two
subordinate internal governance domains and independently owned adopters.

Amendment authority: Agent Zero approved implementation of
docs/specs/001-sdd-core-reset/plan.md at SHA-256
C83198CE8CDAA85E27696273A2DE13F543D8CB1B45C2AD91FA753ECE4735354D,
planning commit cc4f4b17ccca428334689cc5ab381741470168c0.

Protected authority preserved: human Gate 1 and Gate 2 authority, WIP
non-authority, authoritative-source grounding, no silent bypass, scope
isolation, cross-repository boundaries, adopter ownership, endpoint
discipline, and tooling governance.

Same-change propagation:
- governance/framework/constitution.md
- governance/operations/constitution.md
- governance/framework/docs/specs/template/
- governance/operations/docs/specs/template/
- templates/project/
- root assistant adapters and context-routing documents
- contracts/, integrations/, bootstrap/, and verifier surfaces

Superseded architecture: the tracked projects/ tree at base commit
d3363238bb2d2f513f09b364926ff4146cc376ff. Its 60-file disposition is recorded
in docs/migrations/sdd-core-reset-v4/path-map.yaml.

Follow-up dependencies: Fusion Harness and Agent Workflow compatible immutable
releases; CentCom preservation draft PR #20; separate merge and release
authority.
-->

# Hana-X SDD-Core Constitution

SDD-Core is the source repository for an AI-native Spec-Driven Development
framework and its operational-governance contracts. It defines methodology,
authority boundaries, adoption, compatibility, and evidence rules. It does not
contain application projects, execute project missions, own portfolio state, or
govern an independent repository without that repository's deliberate adoption.

## Authority order and scopes

Within this repository, authority descends in this order:

1. this constitution in the **GLOBAL** scope;
2. the **FRAMEWORK-DEFINITION** scope under
   [governance/framework/](../../governance/framework/);
3. the **OPERATIONAL-GOVERNANCE** scope under
   [governance/operations/](../../governance/operations/);
4. approved specifications, plans, contracts, templates, and records within
   their declared scope.

FRAMEWORK-DEFINITION defines reusable principles, policies, standards, decision
rights, and framework specifications: the what and why.
OPERATIONAL-GOVERNANCE defines reusable procedures, runbooks, cadences, record
shapes, and evidence operations: the how and when. Operations depends one way
on framework definition and may not redefine it.

An adopter repository owns its requirements, implementation, runtime,
persistence, releases, approvals, Git history, conversations, and durable
evidence. SDD-Core adoption creates no live coupling and grants SDD-Core no
write authority over the adopter.

## Core principles

### I. Technology-neutral methodology

SDD-Core governs engineering outcomes, not a universal application stack.

- Adopters select and govern their own inference, persistence, runtime,
  language, cloud, deployment, and product architecture.
- Technology choices must be declared in adopter-owned specifications, grounded
  under Article IV, reproducible, security-reviewed, and subject to endpoint
  discipline.
- SDD-Core ships no project runtime and performs no model inference or mission
  execution merely because a repository is opened or operationalized.
- A new SDD-Core authoritative datastore or operational runtime requires a
  constitutional amendment. Rebuildable, non-authoritative indexes require an
  approved specification and can never replace Git-managed source authority.

### II. File-native authority and adopter ownership

SDD-Core constitutions, specifications, plans, tasks, contracts, templates,
standards, approvals, provenance, and migration records are Git-managed plain
files. They remain diffable, reviewable, content-addressable, and usable without
an application runtime.

- No database, dashboard, CI result, review service, integration, agent, model,
  or workflow state may become the authoritative source for these records.
- JSON is used for closed machine contracts and tool-call payloads.
- YAML is used for human-edited configuration and compatibility profiles.
- Markdown is used for atomic governance knowledge with strict YAML front
  matter, one primary topic per file, and relative cross-links.
- Project operational state and durable evidence remain project-owned.
  Agent Workflow may retain immutable references, never evidence ownership.
- No shared operational database and no unauthorized cross-repository write are
  permitted.

### III. Isolated scopes and cross-repository boundaries

Every write must be attributable to one authorized scope.

- GLOBAL work may amend repository-wide authority only through the governed
  lifecycle below.
- FRAMEWORK-DEFINITION work is confined to its domain and cannot operate
  controls, modify the operations domain, or claim adopter authority.
- OPERATIONAL-GOVERNANCE work is confined to its domain and cannot redefine
  framework policy, store live portfolio state, or claim adopter authority.
- An independent repository may be modified only under separate, explicit,
  repository-specific authority naming the action, source, target, and immutable
  base or digest.
- Machine-tier skills, plugins, credentials, settings, and install registries
  are outside repository jurisdiction. Repository documents may declare
  requirements but may not silently change machine state.

Cross-scope changes required by one approved constitutional amendment may land
atomically when the amendment's impact report names every propagated surface.
Otherwise, an agent must stop rather than infer expanded authority.

### IV. Authoritative-source grounding

Claims about an external framework, library, API, schema, tool, or repository
must be grounded in an authoritative source with immutable, verifiable identity.

- Consult [knowledge/instructions.md](../../knowledge/instructions.md) before
  authoring dependent work.
- Record the upstream source, immutable commit or release, local or official
  source path, and content digest.
- Use the registered source at its pin; never reconstruct an API from model
  recall.
- If identity, version, digest, package metadata, or behavior cannot be
  reconciled, stop.
- Grounding mechanisms are adopter-owned. SDD-Core uses ignored local mirrors
  under `reference/repos/` as its repository mechanism, but does not impose
  that mechanism on adopters.

### V. Spec-first lifecycle and human gates

Substantive change follows distinct artifacts in this order:

`spec.md -> plan.md -> tasks.md -> execute -> validate -> review`

Implementation requires an approved specification and plan. A material change
of direction returns to the specification and plan before work continues.

Only Agent Zero, or an explicitly recognized human authority source recorded by
Agent Zero, can originate approval:

- **Gate 1 — promotion:** an exact directive identifying the reviewed source,
  digest or revision, and formal target.
- **Gate 2 — implementation:** an exact directive identifying the approved
  specification or plan and its immutable digest or commit.

WIP, praise, discussion, review, CI, merge status, evidence, Agent Workflow,
Fusion Harness, or another agent cannot imply either gate. Evidence proves what
was observed; it never creates authority. Merge, release, deployment, external
writes, and remediation remain separate authority boundaries unless the exact
directive expressly includes them.

## Methodology core and adoption

SDD-Core is the methodology source, not an adopter of itself. An adopter binds
to a pinned release through a version-controlled adoption contract and its
local constitution.

No adoption, tailoring, exclusion, or local constitution may waive, rename
away, collapse, or silently omit:

1. human approval and the separate Gate 1 and Gate 2 meanings;
2. WIP non-authority;
3. distinct specification, plan, and task artifacts for substantive work;
4. spec-first implementation discipline;
5. authoritative-source grounding and stop-on-mismatch;
6. no silent bypass or inferred authority;
7. scope isolation and explicit cross-repository authority;
8. adopter ownership of implementation, releases, conversations, and evidence;
9. endpoint discipline and secret exclusion; or
10. governed tooling with machine-tier boundaries.

An adopter may select technology, map directory names, add stricter controls,
adapt non-core template fields, and explicitly exclude an inapplicable non-core
provision. Every tailoring requires rationale and approving authority in the
adoption contract. Omission without a record is nonconformance.

Operationalization installs the governance/adoption template plus required
integration bindings automatically. Read-only readiness may inspect allowlisted
metadata and assemble context. It performs no code execution, network access,
secret access, hook invocation, governed mutation, model call, or agent start.
Execution requires a separately verified mission envelope.

## Integration boundaries

- SDD-Core defines contracts and compatibility.
- Agent Workflow records, coordinates, and schedules authorized missions.
- Fusion Harness executes verified missions.
- Each project owns its work and evidence.
- CI and review services provide deterministic or advisory evidence.

No integration may mint authority, widen scope, mutate frozen policy, or treat
availability as approval. Workflow outage may yield DEGRADED only when an
adopter-authorized degraded policy and a valid pre-issued mission envelope both
exist. Otherwise the result is BLOCKED.

Autonomous remediation—including Claude Action, Agent Workflow remediation
scheduling, Fusion Harness remediation execution, Autofix, automatic commits,
pushes, merges, releases, and deployments—remains absent and disabled until a
future separately approved specification activates a bounded capability.

## WIP, maintenance, and tooling governance

The root [wip/](../../wip/) tree is collaborative but non-authoritative.
Nothing in WIP becomes a decision, plan, standard, approval, or implementation
authority because it is committed, reviewed, or merged.

A maintainer-directed bounded change may repair or align already-ratified
material when its explicit directive is durably recorded. It cannot amend this
constitution, substitute for Gate 1 or Gate 2, create new policy, implement WIP
on WIP authority, or cross an unnamed repository boundary.

Tool requirements are declared in
[knowledge/tooling.md](../../knowledge/tooling.md). Declaration never proves
installation. External tooling requires approved source, immutable pin, content
review, and machine Install Registry evidence. No agent self-approves a tool or
changes machine-tier state from repository authority.

## Governance and amendment procedure

This constitution supersedes subordinate instructions where they conflict.

- Violations stop dependent work and are recorded and remediated in the
  affected governed package.
- Amendments require a written proposal, impact list, human approval, SemVer
  change, and same-change propagation or an explicit deferred dependency.
- MAJOR means an incompatible jurisdiction or article change; MINOR adds
  material governance; PATCH clarifies without semantic change.
- Every release records the constitution version, immutable commit, tree
  digest, verification results, unresolved dependencies, and rollback path.
- Merge and release require separate explicit authority.

**Version**: 4.0.0 | **Ratified**: 2026-07-17 | **Last Amended**: 2026-07-28
