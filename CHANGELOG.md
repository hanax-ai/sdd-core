# Changelog

Notable changes to the sdd-core template. Format follows
[Keep a Changelog](https://keepachangelog.com/) principles; the template is
consumed from `main` (no version tags yet — preservation tags like
`pre-rescope-sap-exemplar` mark historical states, not releases).

## 2026-07-20

### Added
- `LICENSE` (Apache-2.0), `CONTRIBUTING.md`, `SECURITY.md` (with threat model),
  `CHANGELOG.md`, issue/PR templates, advisory CI workflow running
  `verify-layout.sh` (least-privilege, SHA-pinned; not a merge gate).
- Workspace proposal home `docs/proposals/` with the Gate-1-promoted
  `evidence-based-skill-lifecycle.md` (committed Provenance section).
- `wip/2026-07-20-repo-maturity-backlog/` — maintainer-prioritized maturity
  backlog as a collaborative WIP item.

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
