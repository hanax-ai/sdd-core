# Tooling Requirements Declaration
<!-- Declares what this workspace REQUIRES or PERMITS. It is NOT installation state.  -->
<!-- Machine state lives in each machine's ~/.sdd-core-ops/INSTALL-REGISTRY.md.        -->
<!-- Schema v1. Columns are mandatory; Status ∈ {required, optional, deferred, excluded}. -->

| Item | Category | Status | Tier | Expected Location | Approved Source | Defining Spec | Notes |
|------|----------|--------|------|-------------------|-----------------|---------------|-------|
| caveman | conduct & methodology | required | machine | plugin manager (user scope) | https://github.com/JuliusBrussee/caveman (pinned per Install Registry) | Canonical plan G2 | Conduct plugin, hook-backed. Install via marketplace `JuliusBrussee/caveman` → `caveman@caveman`. Content review before install; manifest-hash verify after. |
| superpowers | conduct & methodology | required | machine | plugin manager (user scope) | https://github.com/obra/superpowers via marketplace `obra/superpowers-marketplace` | Canonical plan G2 | Methodology plugin (skills + hooks). Install ONLY `superpowers`; sibling marketplace plugins NOT approved. |
| karpathy-rules | conduct & methodology | required | machine | `~/.claude/CLAUDE.md` sdd-core block | https://github.com/multica-ai/andrej-karpathy-skills (review-only) | Canonical plan G2 (review) / G3 (merge) | NOT an installed component — reviewed ruleset merged into the machine CLAUDE.md block, reviewed SHA cited in-block. |
| conversation-sync | conversation sync | required | machine | `~/.claude/skills/conversation-sync/SKILL.md` | — (authored in-workspace) | Canonical plan G5 | The ONLY skill of this name, machine-wide. Carries all sync rules; projects contribute policy files, never a second skill. |
| project sync policy | conversation sync | required | project | `projects/<name>/conversations/SYNC-POLICY.md` | — (authored in-workspace) | Canonical plan G6 | Committed policy file, not a skill. Declares the project's sole sync destination; may tighten, never loosen, the global skill's rules. |
| root conversations policy | conversation sync | required | global (workspace) | `conversations/SYNC-POLICY.md` (+ README.md, TEMPLATE.md) | — (authored in-workspace) | Maintainer directive 2026-07-19 (post-plan) | Workspace-level records destination — GLOBAL-tier resource, root-scope writes only (Article III); record content git-ignored. Project destinations unchanged. |
| conversation-records | conversation sync | required | global (workspace) | `.claude/skills/conversation-records/SKILL.md` | — (authored in-workspace) | Maintainer directive 2026-07-19 (post-plan) | Root-scoped lifecycle skill (capture/locate/update/summarize/archive) for `conversations/`. Operates UNDER conversation-sync + root SYNC-POLICY.md; deliberately NOT named conversation-sync (name reserved, no shadowing). |
| session-capture | conversation sync | required | global (workspace, serves sub-projects via ancestor discovery) | `.claude/skills/session-capture/SKILL.md` | — (authored in-workspace) | Maintainer directive 2026-07-19 (post-plan) | Orchestrator: reviews the current session, routes the record by scope (root vs project tier), applies the governing tier's rules, validates, reports. One skill for both levels — no per-tier duplicates. |
| governed-change | workspace-native skills | required | global (workspace) | `.claude/skills/governed-change/SKILL.md` | — (authored in-workspace) | Maintainer approval 2026-07-19 (skill-proposals artifact, candidate 1) | Repo-writing discipline checklist (D9-derived): clean tree, scoped edit set, one atomic commit, ownership logging, verify-layout, done-when evidence, revert-based rollback. Constitution/registries remain normative. |
| registry-logging | workspace-native skills | required | global (workspace) | `.claude/skills/registry-logging/SKILL.md` | — (authored in-workspace) | Maintainer approval 2026-07-19 (skill-proposals artifact, candidate 2) | Install Registry procedures: entry shapes, UTC timestamps, append-only Event Log, status transitions, Endpoint Discipline. Registry file itself is machine-local. |
| skill-reminder hook | workspace-native skills | required | global (workspace, repo settings) | `.claude/hooks/skill-reminder.sh` + `.claude/settings.json` (UserPromptSubmit) | — (authored in-workspace) | Maintainer directive 2026-07-19 ("appropriate hooks/triggers") | ADVISORY ONLY: injects a one-line skill pointer on commit/registry-topic prompts; never blocks, always exit 0. NOT mechanical enforcement — Article V extension's advisory stance unchanged. Requires bash on PATH; Claude Code prompts for project-hook consent. |
| record-mining hook | workspace-native skills | required | global (workspace, repo settings) | `.claude/hooks/record-mining-reminder.sh` + `.claude/settings.json` (PostToolUse, Write\|Edit) | — (authored in-workspace) | Maintainer directive 2026-07-19 (record-added trigger) | ADVISORY ONLY: after a Write/Edit lands a conversation RECORD (root or project tier; scaffolding excluded), injects a pointer to run a skills-creator mining pass (proposals only). Never blocks, exit 0 always; same bash/consent caveats. |
| wip policy | workspace governance | required | global (workspace) | `wip/README.md` + `wip/COLLABORATION.md` (+ TEMPLATE.md, `_index.md`) | — (authored in-workspace) | Agent Zero directives 2026-07-19/20 (post-plan) | NON-AUTHORITATIVE brainstorming space, Git-tracked and collaborative (2026-07-20): items shared via GitHub under the COLLABORATION.md protocol; publication/review/merge grants NO authority; two-gate approval (Agent Zero exclusive: `Approved for promotion: <item> → <target>`, then `Approved for implementation: <spec>`), item-and-action-specific. Only `wip/.local/` + temp files git-ignored. Article III: root-scope writes only. Category `workspace governance` introduced post-constitution-v1.1.0 (policy artifact, not a skill); constitutional category-list refresh queued for the next amendment. |
| skills-creator | workspace-native skills | required | project | `projects/project-a/.claude/skills/skills-creator/SKILL.md` | — (authored in-workspace) | Canonical plan G6 | Skill-authoring instructions: frontmatter, trigger descriptions, tier placement, mandatory registrations (this file + machine Install Registry). |
| mirror-sync | workspace-native skills | required | project | `projects/project-a/.claude/skills/mirror-sync/SKILL.md` | — (authored in-workspace) | Canonical plan G7 | Mirror Registry Engine: operationalizes constitution Article IV; implementation aid — registries and pin discipline remain normative. |
| playwright | MCP tools | deferred | project | `.mcp.json` (absent — deferred) | https://github.com/microsoft/playwright-mcp (`@playwright/mcp`) — NOT approved for install | Canonical plan Gate 7 (deferral) | Absent from every gating artifact. Reactivation only via a future feature spec naming a concrete browser surface + maintainer amendment (flips this row, restores source approval, adds `.mcp.json` + verify-layout entry). |
| context7 | MCP tools | excluded | — | — | — | Canonical plan (exclusions) | Excluded: contradicts Article IV grounding/pin discipline (live external docs bypass pinned mirrors). |
| front-end-design | conduct & methodology | excluded | — | — | — | Canonical plan (exclusions) | Excluded: project-a has no front-end surface. |

## Bootstrap (new machine or template consumer)

Executed on any machine that adopts the workspace (new maintainer, template consumer,
rebuilt machine):

1. Read `knowledge/tooling.md`; list rows with Status `required`.
2. If `~/.sdd-core-ops/` is absent: create it (`review-archive/`, `artifacts/`, `backups/`) and
   seed `INSTALL-REGISTRY.md` with one `pending` Inventory row per required item + empty Event Log
   (this is Goal 1's machine-tier half, re-runnable standalone).
3. For each required row, compare declared Expected Location against the machine: plugin present
   (`claude plugin list`), skill/file present on disk. Update the registry row: `complete`
   (present + previously reviewed), `pending` (absent), or `drift` (present but unattributed —
   stop and review before touching it).
4. For every `pending` row, execute that item's install goal from the canonical plan (review →
   pin → install → verify), recording rows/events as the plan specifies.
5. Finish by running the plan's Goal 9 audit checks for machine-tier artifacts plus
   `./verify-layout.sh` for the repo tier. A declaration row NEVER implies installation — only a
   `complete` registry row with a review record does.
