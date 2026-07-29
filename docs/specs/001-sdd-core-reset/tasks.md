---
id: SDD-RESET-001-TASKS
title: SDD-Core Reset Execution Tasks
artifact_type: task-breakdown
category: governance-architecture
authority_tier: root-global
status: ready-for-gate-2-review
version: 1.0.0-draft
created: 2026-07-28
updated: 2026-07-28
access_level: public
specification: spec.md
implementation_plan: plan.md
base_commit: d3363238bb2d2f513f09b364926ff4146cc376ff
gate_2: not-granted
implementation_authority: none
---

# SDD-Core Reset Execution Tasks

## Execution boundary

These tasks are an implementation map, not implementation authority. Do not
check any task or modify any implementation path until Agent Zero issues an
exact Gate 2 directive naming the reviewed
[implementation plan](plan.md) revision or digest.

The implementation cycle stops at a fully reviewed, merge-ready pull request.
Merge and release are separate authority boundaries.

## Format

`[ID] [P?] Description — exact repository paths`

- `[P]` means the task touches independent files and may run in parallel after
  its dependencies pass.
- Every task must record its evidence before it is checked complete.
- No task may modify another repository or machine-tier configuration.
- Any stop condition in [spec.md](spec.md) or [plan.md](plan.md) ends execution
  and returns control to Agent Zero.

---

### T001: Record Gate 2 and verify the immutable baseline

**Files**

- Create:
  `docs/specs/001-sdd-core-reset/records/implementation-authorization.md`
- Read: `docs/specs/001-sdd-core-reset/spec.md`
- Read: `docs/specs/001-sdd-core-reset/plan.md`

**Consumes:** An exact Agent Zero directive naming `plan.md` at a reviewed
revision or digest.

**Produces:** A durable authority record and a clean, identity-verified
implementation branch.

- [ ] Capture the Gate 2 directive verbatim with issuer, date, plan path,
  plan SHA-256, repository, base branch, base commit, allowed repositories,
  authorized outcomes, prohibited actions, and next authority boundary.
- [ ] Run:

  ```powershell
  git remote get-url origin
  git branch --show-current
  git rev-parse HEAD
  git status --short
  ```

  Expected: canonical `hanax-ai/sdd-core` origin; authorized implementation
  branch; HEAD
  `d3363238bb2d2f513f09b364926ff4146cc376ff`; no output from status.
- [ ] Fetch the authorized base without merging and stop if it moved in a way
  that changes the implementation base.
- [ ] Confirm no active claim or unrelated work overlaps the root,
  `projects/`, `governance/`, `contracts/`, `integrations/`, `bootstrap/`,
  `templates/`, verifier, CI, or migration-evidence surfaces.
- [ ] Run `bash verify-layout.sh`; expected baseline result is 181/181 checks
  passing.

### T002: Ground and pin contract validation

**Files**

- Modify: `knowledge/instructions.md`
- Create: `requirements-validation.txt`
- Local ignored sources:
  `reference/repos/json-schema-spec/`,
  `reference/repos/python-jsonschema/`, and `reference/repos/pyyaml/`

**Consumes:** T001 authority and root Article IV.

**Produces:** Pinned sources and deterministic dependency pins for schema/YAML
validation.

- [ ] Obtain official source mirrors at immutable commits for JSON Schema draft
  2020-12, `python-jsonschema/jsonschema`, and `yaml/pyyaml`; do not author
  dependent validation code first.
- [ ] Verify each local checkout's origin and commit, compute its SHA-256
  archive digest, and add a complete registry row to
  `knowledge/instructions.md`.
- [ ] Create `requirements-validation.txt` with exact package versions and
  hashes derived from the grounded sources; floating ranges are prohibited.
- [ ] Install into an isolated validation environment and run import/version
  probes on Windows and Linux-compatible Python.
- [ ] Stop if source identity, package identity, version, or digest cannot be
  reconciled.

### T003: Freeze the 60-file legacy inventory

**Files**

- Create:
  `docs/migrations/sdd-core-reset-v4/artifact-inventory.md`
- Create: `docs/migrations/sdd-core-reset-v4/path-map.yaml`

**Consumes:** T001 verified base.

**Produces:** One immutable inventory row and one disposition row for every
tracked legacy artifact.

- [ ] Generate the source list from:

  ```powershell
  git ls-tree -r --name-only d3363238bb2d2f513f09b364926ff4146cc376ff projects
  ```

  Expected: exactly 60 paths.
- [ ] For every path, record the Git blob ID, SHA-256, content class, current
  authority role, and whether unique authoritative content exists.
- [ ] Assign exactly one disposition: `moved`, `merged`, `superseded`, or
  `removed`.
- [ ] Record an exact target and rationale for every `moved` or `merged` row;
  record superseding authority/evidence for every `superseded` or `removed`
  row.
- [ ] Validate that source paths are unique, the count remains 60, and no row
  lacks a disposition.

### T004: Define validation-first fixtures and expected outcomes

**Files**

- Create: `contracts/adoption/fixtures/`
- Create: `contracts/authority/fixtures/`
- Create: `contracts/evidence/fixtures/`
- Create: `integrations/fusion-harness/fixtures/`
- Create: `integrations/agent-workflow/fixtures/`
- Create: `docs/migrations/sdd-core-reset-v4/validation-catalog.md`

**Consumes:** FR-010–FR-024 and T002 validation pins.

**Produces:** Named valid/invalid cases before schemas and profiles are
implemented.

- [ ] Enumerate every CC-005 through CC-011 case in
  `validation-catalog.md`, including expected `PASS`, `REJECT`, `BLOCKED`, or
  `DEGRADED`.
- [ ] Add adoption cases for protected omission/exclusion/tailoring, unknown
  fields, secret-like keys, and absolute personal paths.
- [ ] Add mission cases for missing signature, expiry, revocation,
  supersession, replay, scope expansion, frozen-policy change, and base
  mismatch.
- [ ] Add evidence cases that attempt to promote review, validation,
  integration, or workflow state into authority.
- [ ] Add Harness/Workflow cases for compatible, incompatible, unavailable,
  degraded-valid, and degraded-invalid states.
- [ ] Run the not-yet-implemented validation command and record the expected
  failure because schemas/validator entry points do not yet exist.

### T005: Migrate the framework-definition domain

**Files**

- Move: `projects/governance-framework/README.md` →
  `governance/framework/README.md`
- Move: `projects/governance-framework/.specify/memory/constitution.md` →
  `governance/framework/constitution.md`
- Move: `projects/governance-framework/docs/` →
  `governance/framework/docs/`
- Move: `projects/governance-framework/knowledge/` →
  `governance/framework/knowledge/`
- Move: `projects/governance-framework/reference/` →
  `governance/framework/reference/`
- Move: `projects/governance-framework/standards/` →
  `governance/framework/standards/`
- Move: `projects/governance-framework/.claude/skills/` →
  `governance/framework/skills/`

**Consumes:** T003 path map.

**Produces:** Preserved framework content under internal-domain paths.

- [ ] Use `git mv` for every mapped move; do not copy/delete manually.
- [ ] Remove empty legacy directories only after `git status --short` shows
  each file as a rename or an explicitly mapped disposition.
- [ ] Replace application-project identity with FRAMEWORK-DEFINITION domain
  identity in moved live files.
- [ ] Update internal links to target paths while preserving historical
  provenance text.
- [ ] Compare every moved file's pre-edit blob/content digest with the path map
  and explain every semantic edit in the inventory.

### T006: Migrate the operational-governance domain

**Files**

- Move: `projects/governance-ops/README.md` →
  `governance/operations/README.md`
- Move: `projects/governance-ops/.specify/memory/constitution.md` →
  `governance/operations/constitution.md`
- Move: `projects/governance-ops/docs/specs/template/` →
  `governance/operations/docs/specs/template/`
- Move: `projects/governance-ops/docs/specs/examples/` →
  `governance/operations/docs/specs/examples/`
- Move: `projects/governance-ops/knowledge/` →
  `governance/operations/knowledge/`
- Move: `projects/governance-ops/records/` →
  `governance/operations/records/`
- Move: `projects/governance-ops/reference/` →
  `governance/operations/reference/`
- Disposition:
  `projects/governance-ops/registers/deliverables.md`
- Disposition:
  `projects/governance-ops/docs/specs/002-centcom-phase-2-live-github-ingestion/`

**Consumes:** T003 path map and independent-repository boundary.

**Produces:** Preserved reusable operations material without live portfolio or
CentCom project state.

- [ ] Use `git mv` for every reusable mapped artifact and reframe it as
  OPERATIONAL-GOVERNANCE domain content.
- [ ] Verify the canonical independent home of the CentCom planning package
  read-only; stop if preservation cannot be proven.
- [ ] Record hashes and supersession evidence for the CentCom package without
  modifying its repository.
- [ ] Supersede the live deliverables register as portfolio operational state;
  preserve only its digest and disposition record.
- [ ] Confirm no application implementation plan, live portfolio register, or
  named project assignment remains authoritative inside SDD-Core.

### T007: Amend the root and domain authority model

**Files**

- Modify: `.specify/memory/constitution.md`
- Modify: `governance/framework/constitution.md`
- Modify: `governance/operations/constitution.md`

**Consumes:** FR-006–FR-009 and the T005/T006 domain paths.

**Produces:** Constitution `4.0.0` and subordinate internal-domain authority
documents.

- [ ] Rewrite the root identity and jurisdiction for a source-framework
  repository with independent adopters.
- [ ] Preserve the protected authority core and define root GLOBAL,
  FRAMEWORK-DEFINITION, and OPERATIONAL-GOVERNANCE scopes.
- [ ] Replace project inheritance with explicit adoption through the portable
  contract and local adopter constitution.
- [ ] Update the Sync Impact Report, amendment rationale, propagation list,
  version `4.0.0`, and amendment date.
- [ ] Rewrite both domain constitutions as subordinate scope documents; they
  must not claim repository, adopter, or Gate authority.
- [ ] Search the three files for live `projects/<name>` jurisdiction language;
  expected result: none outside marked history.

### T008: Consolidate conversations, WIP routing, and root documentation

**Files**

- Modify: `conversations/README.md`
- Modify: `conversations/SYNC-POLICY.md`
- Modify: `conversations/TEMPLATE.md`
- Modify: `wip/README.md`
- Modify: `wip/TEMPLATE.md`
- Modify: `wip/COLLABORATION.md`
- Modify: `wip/_index.md`
- Modify: `README.md`
- Modify: `CONTRIBUTING.md`
- Modify: `SECURITY.md`
- Modify: `CHANGELOG.md`
- Modify: `docs/README.md`
- Modify: `docs/deliverables-index.md`
- Modify: `docs/assets/process_flow.svg`

**Consumes:** T005–T007 target terminology and FR-025.

**Produces:** One coherent root-global narrative and domain-aware conversation
routing.

- [ ] Merge valid domain routing rules into the root conversation policy with
  required `domain` metadata values `framework-definition` and
  `operational-governance`.
- [ ] Remove fake application-project routing and keep machine-tier
  independent-repository routing explicitly deferred.
- [ ] Update README/process-flow structure and lifecycle without implying that
  readiness, CI, or Workflow state grants authority.
- [ ] Preserve Gate 1/Gate 2 and WIP non-authority wording in all contributor
  surfaces.
- [ ] Mark every historical `projects/` reference as superseded or migrate it
  to the path map/changelog.

### T009: Align adapters, tooling declarations, and ownership

**Files**

- Modify: `AGENTS.md`
- Modify: `knowledge/instructions.md`
- Modify: `knowledge/tooling.md`
- Modify: `.claude/settings.json`
- Modify: `.claude/skills/constitution-amendment/SKILL.md`
- Modify: `.claude/skills/conversation-records/SKILL.md`
- Modify: `.claude/skills/governed-change/SKILL.md`
- Modify: `.claude/skills/registry-logging/SKILL.md`
- Modify: `.claude/skills/session-capture/SKILL.md`
- Modify: `.claude/skills/wip-item-bookkeeping/SKILL.md`
- Modify: `.claude/hooks/skill-reminder.sh`
- Modify: `.claude/hooks/record-mining-reminder.sh`
- Modify: `.agents/skills/constitution-amendment/SKILL.md`
- Modify: `.agents/skills/conversation-records/SKILL.md`
- Modify: `.agents/skills/governed-change/SKILL.md`
- Modify: `.agents/skills/registry-logging/SKILL.md`
- Modify: `.agents/skills/session-capture/SKILL.md`
- Modify: `.agents/skills/wip-item-bookkeeping/SKILL.md`
- Modify: `.codex/hooks.json`
- Modify: `.codex/hooks/skill-reminder.sh`
- Modify: `.codex/hooks/record-mining-reminder.sh`
- Create: `governance/framework/ownership.md`
- Create: `governance/operations/ownership.md`

**Consumes:** T007 scope model and T002 grounding additions.

**Produces:** Tool-neutral canonical ownership with subordinate assistant
adapters.

- [ ] Rewrite context-loading paths for root and internal domains.
- [ ] Define exact ownership boundaries and the one-way
  framework-definition → operational-governance dependency.
- [ ] Preserve mirrored skill/hook behavior across Claude, Agents, and Codex
  adapters; no adapter may create authority.
- [ ] Remove project-local discovery assumptions and keep machine-tier
  installation state outside repository jurisdiction.
- [ ] Run a byte/semantic mirror comparison for corresponding assistant
  surfaces and record intentional adapter-specific differences.

### T010 [P]: Implement the adoption contract

**Files**

- Create: `contracts/adoption/README.md`
- Create: `contracts/adoption/project-adoption.schema.json`
- Complete: `contracts/adoption/fixtures/`

**Consumes:** T002 pins, T004 cases, FR-010–FR-011.

**Produces:** Closed adoption schema and passing/rejecting fixtures.

- [ ] Author draft 2020-12 schema with canonical `$id`, version, repository and
  release identity, constitution digest, authority, provision classifications,
  integration bindings, and supersession.
- [ ] Encode the protected provision set as required constants that cannot
  appear in tailored/excluded lists.
- [ ] Reject undeclared properties and fixture values matching secret,
  connection-string, or personal-path policies.
- [ ] Document field semantics, adopter ownership, and non-authority effects in
  `README.md`.
- [ ] Run only the adoption fixture slice; every catalog outcome must match.

### T011 [P]: Implement the mission authority contract

**Files**

- Create: `contracts/authority/README.md`
- Create: `contracts/authority/mission-envelope.schema.json`
- Complete: `contracts/authority/fixtures/`

**Consumes:** T002 pins, T004 cases, FR-012.

**Produces:** Structurally and semantically validated mission envelopes.

- [ ] Author the closed schema with all identity, issuer, signature, nonce,
  time, revocation, replay, scope, frozen policy/base, resource, evidence, and
  next-boundary fields.
- [ ] Define canonical digest input and signature-verification expectations
  without selecting or embedding a project runtime.
- [ ] Add semantic checks for expiry, revocation, supersession, replay,
  base mismatch, and scope expansion to `scripts/validate-contracts.py`.
- [ ] Document that only Agent Zero or an explicitly recognized human
  authority source can originate authority; integrations cannot mint it.
- [ ] Run only the mission fixture slice; every catalog outcome must match.

### T012 [P]: Implement the evidence contract

**Files**

- Create: `contracts/evidence/README.md`
- Create: `contracts/evidence/evidence-envelope.schema.json`
- Complete: `contracts/evidence/fixtures/`

**Consumes:** T002 pins, T004 cases, FR-013–FR-014.

**Produces:** Project-owned, content-addressable evidence that cannot become
authority.

- [ ] Author the closed schema with evidence identity, digest, producer,
  observation, validation, review-coverage, integration/workflow state,
  project-owned location, and immutable references.
- [ ] Exclude fields or transitions that grant approval or authority.
- [ ] Add semantic checks proving content-addressability and status separation.
- [ ] Document ownership and Workflow reference-only behavior.
- [ ] Run only the evidence fixture slice; every catalog outcome must match.

### T013: Create the architecture-neutral adopter template

**Files**

- Create: `templates/project/.sdd-core/adoption.yaml`
- Create: `templates/project/.specify/memory/constitution.md`
- Create: `templates/project/conversations/SYNC-POLICY.md`
- Create: `templates/project/knowledge/instructions.md`
- Create: `templates/project/wip/README.md`
- Create: `templates/project/AGENTS.md`
- Create: `templates/project/CLAUDE.md`
- Create: `templates/project/README.md`

**Consumes:** T010 adoption contract and T007 authority model.

**Produces:** A portable governance/adoption template with no application
architecture.

- [ ] Add strict YAML front matter to Markdown files and relative cross-links.
- [ ] Bind the sample adoption record to the schema without inventing a real
  repository, secret, user path, or external release.
- [ ] Preserve protected provisions and local adopter ownership.
- [ ] Keep assistant files as subordinate adapters.
- [ ] Search for language/framework/database/cloud/deployment and
  `ui|services|database` application layout prescriptions; expected result:
  none.
- [ ] Validate the template adoption fixture against T010.

### T014: Define deterministic project operationalization

**Files**

- Create: `bootstrap/new-project.md`

**Consumes:** T010, T013, FR-017–FR-019.

**Produces:** File-native operationalization and read-only readiness contract.

- [ ] Document initiation, deterministic prerequisites, evidence output, and
  `BLOCKED` behavior.
- [ ] Define the state machine from `UNINITIALIZED` through
  `READY_READ_ONLY` and `AUTHORIZED_MISSION_REQUIRED`.
- [ ] Restrict discovery to allowlisted metadata and explicitly prohibit code,
  network, secret, hook, connection, model, agent, MCP mutation, repository
  mutation, and gate advancement.
- [ ] Define disposable non-authoritative caching outside governed state.
- [ ] Add acceptance examples for success, missing identity, missing compatible
  Harness release, invalid adoption, and Workflow outage.

### T015 [P]: Define the Fusion Harness compatibility profile

**Files**

- Create: `integrations/fusion-harness/README.md`
- Create: `integrations/fusion-harness/binding.schema.json`
- Create: `integrations/fusion-harness/compatibility.yaml`
- Complete: `integrations/fusion-harness/fixtures/`

**Consumes:** T010–T014 and the immutable external Harness release inventory.

**Produces:** Versioned binding/readiness profile without executing Harness.

- [ ] Define canonical source, immutable version/digest, SDD compatibility,
  installation verification, capability policy, readiness, rollback, and
  contract-version fields.
- [ ] Return `BLOCKED` when no compatible immutable Harness release exists;
  do not create a placeholder release.
- [ ] Require a valid mission envelope before any execution-eligible state.
- [ ] Keep installation/binding mandatory for operationalization while keeping
  readiness non-mutating.
- [ ] Validate all Harness fixtures without invoking the Harness repository.

### T016 [P]: Define the Agent Workflow compatibility profile

**Files**

- Create: `integrations/agent-workflow/README.md`
- Create: `integrations/agent-workflow/registration.schema.json`
- Create: `integrations/agent-workflow/status.schema.json`
- Complete: `integrations/agent-workflow/fixtures/`

**Consumes:** T010–T014 and the independent Workflow boundary.

**Produces:** Read-only registration, mission-status, and degraded-mode
contracts.

- [ ] Define repository, SDD-Core, Harness, compatibility, authority-reference,
  mission/work-order, evidence-reference, outbox, and reconciliation fields.
- [ ] Separate registration/readiness, execution, evidence, and authority
  states.
- [ ] Encode `DEGRADED` only for a valid adopted policy plus pre-issued,
  authenticated, current, replay-safe mission envelope.
- [ ] Forbid Workflow from executing agents, mutating projects, or minting
  authority.
- [ ] Validate all Workflow fixtures without invoking or modifying Workflow.

### T017: Establish the review-only CI/CD profile

**Files**

- Create: `integrations/ci-cd/README.md`
- Modify: `.github/pull_request_template.md`
- Modify: `.github/ISSUE_TEMPLATE/bug-report.md`
- Modify: `.github/ISSUE_TEMPLATE/idea.md`

**Consumes:** FR-023–FR-024 and T012 evidence status model.

**Produces:** Deterministic validation plus advisory review with no remediation.

- [ ] Define separate validation, AI-review coverage, tool health, integration,
  workflow, and human-authority states.
- [ ] State that CodeRabbit/equivalent is an evidence producer only.
- [ ] Add explicit disabled/deferred entries for Claude Action, Workflow
  scheduling, Harness remediation, Autofix, automatic commit/push/PR/merge,
  release, and deployment.
- [ ] Update contribution templates to request authority and evidence without
  inferring approval.
- [ ] Search `.github/` and `integrations/ci-cd/` for write-capable agent
  actions or mutation permissions; expected result: none.

### T018: Replace structural and contract verification

**Files**

- Modify: `verify-layout.sh`
- Create: `scripts/validate-contracts.py`
- Modify: `.github/workflows/verify-layout.yml`

**Consumes:** T002, T004–T017 and CC-001–CC-013.

**Produces:** One deterministic verifier on Linux and Windows.

- [ ] Replace legacy required-path checks with target paths and a hard failure
  on tracked `projects/`.
- [ ] Add live legacy-reference scanning with explicit historical allowlists.
- [ ] Add schema compilation, valid-fixture acceptance, invalid-fixture
  rejection, semantic mission/evidence checks, front-matter checks, link checks,
  secret/path checks, and adapter invariants.
- [ ] Configure an Ubuntu/Windows matrix to install the exact validation pins
  and run `bash verify-layout.sh` against the same commit.
- [ ] Run:

  ```powershell
  bash -n verify-layout.sh
  python scripts/validate-contracts.py
  bash verify-layout.sh
  ```

  Expected: syntax pass, all catalog cases match, and verifier exits 0.

### T019: Complete migration evidence and rollback design

**Files**

- Complete:
  `docs/migrations/sdd-core-reset-v4/artifact-inventory.md`
- Create:
  `docs/migrations/sdd-core-reset-v4/migration-evidence.md`
- Create: `docs/migrations/sdd-core-reset-v4/rollback.md`
- Modify: `docs/migrations/sdd-core-reset-v4/path-map.yaml`

**Consumes:** T003 and the full candidate tree.

**Produces:** Reviewable migration provenance before commit closure.

- [ ] Record canonical origin, base branch/commit, baseline verifier, target
  constitution and contract versions, release candidate, and every
  disposition.
- [ ] Document pre-merge rollback as branch reset and post-merge rollback as
  separately authorized whole-commit reverts; forbid partial restoration.
- [ ] List unresolved external dependencies, including compatible Harness,
  Workflow, and machine-tier conversation routing releases.
- [ ] Recompute source/target hashes and confirm all 60 source rows are closed.
- [ ] Leave migration commit/tree fields explicitly described as
  evidence-closure fields populated by T023, not as vague placeholders.

### T020: Run the full local validation gate

**Files**

- Read all changed files
- No planned writes; a failure returns to the task that owns the affected exact
  path

**Consumes:** T005–T019.

**Produces:** A clean candidate tree before independent review.

- [ ] Run `git diff --check`; expected: no output.
- [ ] Run `bash -n verify-layout.sh`; expected: exit 0.
- [ ] Run `python scripts/validate-contracts.py`; expected: every catalog case
  matches.
- [ ] Run `bash verify-layout.sh`; expected: 100% target compliance.
- [ ] Run a relative Markdown-link checker across tracked Markdown; expected:
  zero unresolved local links.
- [ ] Parse all tracked JSON, YAML, and SVG files; expected: zero parse errors.
- [ ] Run secret/personal-path scanning; expected: zero findings.
- [ ] Confirm `git ls-files projects` produces no output.

### T021: Perform independent governance and preservation review

**Files**

- Create:
  `docs/migrations/sdd-core-reset-v4/independent-review.md`

**Consumes:** T020 green candidate and all CC-001–CC-015.

**Produces:** A reviewer verdict independent from the implementation author.

- [ ] Give the reviewer the approved proposal, spec, plan, tasks, base commit,
  path map, diff, and validation output.
- [ ] Require explicit findings for authority non-inference, protected
  provisions, domain separation, adopter sovereignty, readiness non-mutation,
  degraded mission integrity, external-repository isolation, and all 60 source
  dispositions.
- [ ] Require a verdict of `ACCEPT`, `ACCEPT WITH NON-BLOCKING NOTES`, or
  `REJECT`, with each finding tied to a path and requirement.
- [ ] Resolve blocking findings in the candidate tree and repeat T020/T021;
  do not waive them.
- [ ] Stop unless the final independent verdict is `ACCEPT` or
  `ACCEPT WITH NON-BLOCKING NOTES`.

### T022: Create the atomic migration commit

**Files**

- Stage every implementation path except later evidence-closure fields

**Consumes:** T020 green validation and T021 accepted review.

**Produces:** One atomic migration commit.

- [ ] Verify the staged diff contains the complete structure, authority,
  contract, routing, adapter, verifier, and CI migration.
- [ ] Verify there is no unrelated file and no external-repository change.
- [ ] Create one commit whose message cites the exact Gate 2 authority record
  and states that merge/release authority remains absent.
- [ ] Record the commit SHA and tree SHA without editing the commit.
- [ ] Re-run `bash verify-layout.sh` on the committed tree; expected: pass.

### T023: Obtain remote review and close evidence

**Files**

- Modify:
  `docs/migrations/sdd-core-reset-v4/migration-evidence.md`
- Modify:
  `docs/migrations/sdd-core-reset-v4/artifact-inventory.md`
- Modify: `docs/migrations/sdd-core-reset-v4/rollback.md`
- Modify:
  `docs/specs/001-sdd-core-reset/records/implementation-authorization.md`

**Consumes:** T022 atomic commit.

**Produces:** A reviewed evidence-closure commit and merge-ready pull request.

- [ ] Push the implementation branch without force and create a draft pull
  request targeting the separately confirmed release branch.
- [ ] Obtain passing Linux and Windows verifier jobs and a completed advisory
  CodeRabbit review; a skipped or pending review is not clean evidence.
- [ ] If review requires migration-content changes, stop and return to Agent
  Zero rather than appending a non-atomic repair.
- [ ] Populate evidence with the T022 commit/tree SHA, CI run URLs/results,
  review verdict, unresolved dependencies, and rollback identifiers.
- [ ] Commit only the evidence-closure files, push without force, and obtain
  passing CI/review again.
- [ ] Mark the pull request ready only when all required checks are green and
  all blocking threads are resolved.

### T024: Stop at the next authority boundary

**Files**

- Read: `docs/migrations/sdd-core-reset-v4/migration-evidence.md`
- Read:
  `docs/specs/001-sdd-core-reset/records/implementation-authorization.md`

**Consumes:** T023 merge-ready pull request.

**Produces:** An evidence-backed handoff to Agent Zero.

- [ ] Report the exact PR URL, base/head, atomic migration commit/tree, evidence
  closure commit, file counts, path-map closure, cross-platform results,
  independent review, CodeRabbit state, unresolved dependencies, and rollback.
- [ ] State explicitly that no external repository or machine-tier state
  changed.
- [ ] State explicitly that remediation remains disabled.
- [ ] Do not merge, tag, release, update adopters, or start Harness/Workflow
  work.
- [ ] Request the next item-specific authority decision.

---

## Dependencies

- T001 blocks every implementation task.
- T002 blocks T004 and T010–T012.
- T003 blocks T005–T006 and T019.
- T004 blocks T010–T012 and T015–T016.
- T005–T006 block T007–T009.
- T007 blocks T008–T016.
- T010–T012 may run in parallel after T002/T004/T007.
- T013 requires T010.
- T014 requires T010 and T013.
- T015–T016 may run in parallel after T010–T014.
- T017 requires T012.
- T018 requires T004–T017.
- T019 requires the candidate tree from T005–T018.
- T020 → T021 → T022 → T023 → T024 are strictly sequential.

## Requirement coverage

| Requirements | Tasks |
|---|---|
| FR-001, FR-002, FR-003, FR-004, FR-005 | T003, T005–T007, T022 |
| FR-006, FR-007, FR-008, FR-009 | T007–T009, T021 |
| FR-010, FR-011, FR-012, FR-013, FR-014, FR-015, FR-016 | T002, T004, T010–T013, T018 |
| FR-017, FR-018, FR-019 | T014, T018 |
| FR-020, FR-021, FR-022, FR-023, FR-024 | T015–T018 |
| FR-025, FR-026, FR-027, FR-028, FR-029, FR-030 | T003, T006, T008–T009, T017–T024 |
| CC-001, CC-002, CC-003, CC-004, CC-005, CC-006, CC-007, CC-008, CC-009, CC-010, CC-011, CC-012, CC-013, CC-014, CC-015 | T003–T004, T018–T024 |

## Validation checklist

- [x] Every specification requirement maps to at least one task.
- [x] Every conformance criterion maps to validation or review.
- [x] Every task identifies exact repository paths or an exact read-only
  command surface.
- [x] Parallel tasks touch independent files after common prerequisites.
- [x] The atomic migration and evidence-closure commits are distinct.
- [x] External repositories and machine-tier state are read-only.
- [x] Merge and release remain outside this task package.
- [x] No task treats evidence, CI, Workflow, or review as authority.
- [x] No unresolved planning marker remains.
- [ ] Gate 2 names the reviewed implementation plan revision or digest.

## Related artifacts

- [Specification](spec.md)
- [Implementation plan](plan.md)
- [Approved architecture proposal](../../proposals/sdd-core-reset-architecture.md)
- [Root constitution](../../../.specify/memory/constitution.md)
- [Global grounding instructions](../../../knowledge/instructions.md)
