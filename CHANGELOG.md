# Changelog

Notable changes to the sdd-core template. Format follows
[Keep a Changelog](https://keepachangelog.com/) principles; the template is
consumed from `main` (no version tags yet — preservation tags like
`pre-rescope-sap-exemplar` mark historical states, not releases).

## 2026-07-25

### Changed
- Root constitution amended to **v3.0.0** (MAJOR, Agent Zero directive
  2026-07-25, consolidated R2 amendment proposal): Article I rescoped to
  workspace-bounded **Inference Governance** (adopter-owned inference;
  SDD-Core's local-model target retained as project-local only); Article II
  redefined as **Persistence Governance** (file-native authoritative SDD-Core
  records; universal PostgreSQL/Qdrant mandate removed; reviewed-spec route
  for non-authoritative rebuildable indexes/caches; adopter-owned operational
  persistence; shared-database and cross-project-write prohibitions
  preserved); Article IV redefined as **Authoritative-Source Grounding**
  (grounding outcomes mandated, mechanisms project-owned — this workspace
  retains its local-mirror registries); new **Methodology Core & Adoption**
  section (source-project role, mandatory local installation, non-waivable
  core, tailoring classes, adoption manifest, jurisdiction).
- Same-change propagation (one commit, v2.1.0 propagation exception):
  project constitutions → governance-framework v3.1.2, governance-ops v1.1.2
  (PATCH entries); both plan templates (Storage / Complexity Tracking rows,
  grounding-registry wording); both tasks templates (grounding-check
  wording); `README.md` (load-order step 1, Authoritative-Source Grounding
  section, process-flow alt text); `AGENTS.md` (grounding wording);
  `knowledge/instructions.md` (reframed as the project-owned Article IV
  mechanism); `docs/assets/process_flow.svg` (grounding-registry label);
  `verify-layout.sh` (Article IV sentinel replaced; six v3 sentinels added).

## 2026-07-20

### Added
- `LICENSE` (Apache-2.0), `CONTRIBUTING.md`, `SECURITY.md` (with threat model),
  `CHANGELOG.md`, issue/PR templates, advisory CI workflow running
  `verify-layout.sh` (least-privilege, SHA-pinned; not a merge gate).
- Workspace proposal home `docs/proposals/` with the Gate-1-promoted
  `evidence-based-skill-lifecycle.md` (committed Provenance section).
- `wip/2026-07-20-repo-maturity-backlog/` — maintainer-prioritized maturity
  backlog as a collaborative WIP item.
- Evidence-class operationalization: `.gitignore` class patterns, evidence
  policy home `projects/governance-ops/records/` with class-1 templates.
- Paired deliverables model: framework standard ST-001, governance-ops living
  register, root navigation index.
- `verify-layout.sh` content checks (constitutional invariants) and `AGENTS.md`
  harness adapter with precedence beneath the constitution and load order.

### Changed
- Sub-projects rescoped: `project-a` → `governance-framework` (design layer)
  and `project-b` → `governance-ops` (operational layer), each fully
  provisioned (constitution, README, playbook, spec templates, sync policy).
- Root constitution amended to v2.0.1 (path/example refresh); framework
  constitution v3.0.0 → v3.1.0 and ops constitution v1.0.0 → v1.1.0 (Root
  GLOBAL supremacy, three-way authoritative routing, one-way dependency
  contract, evidence classes, spec routing).
- Process-flow diagram regenerated as `docs/assets/process_flow.svg`.

### Fixed
- Lifecycle WIP item: 8 adversarially confirmed consistency defects (Gate 1
  revision round).
- Project README spec-routing wording aligned with the three-way rule.

## 2026-07-19 and earlier

Initial workspace: root constitution v1.0.0 → v2.0.0 arc, mirror registries,
conversation-record and WIP governance, root skills (conversation-records,
session-capture, governed-change, registry-logging), project skills
(mirror-sync, skills-creator), `verify-layout.sh`. See git history and the
machine Install Registry for the full audit trail.
