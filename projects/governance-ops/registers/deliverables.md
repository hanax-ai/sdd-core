# Deliverables Register (living)

Implements: governance-framework standard **ST-001 v1.0.0**
(`../../governance-framework/standards/deliverables-ownership.md`) — see it for
definitions, roles, decision rights, and this register's maintenance rules
(90-day row reviews; stale >30 days → at-risk). This register assigns; it
never defines.

| ID | Layer | Artifact set | Owner | Operating agent | Status | Last review | Next review due | Exceptions |
|----|-------|--------------|-------|-----------------|--------|-------------|-----------------|------------|
| DEL-001 | Root GLOBAL | Root constitution (`.specify/memory/constitution.md`, v2.0.1) | hanax-ai | claude-root-alpha | active | 2026-07-20 | 2026-10-18 | none |
| DEL-002 | Root GLOBAL | Knowledge registries (`knowledge/instructions.md`, `knowledge/tooling.md`) | hanax-ai | claude-root-alpha | active | 2026-07-20 | 2026-10-18 | none |
| DEL-003 | Root GLOBAL | Conversation-record governance (`conversations/` policy+template+README) | hanax-ai | claude-root-alpha | active | 2026-07-20 | 2026-10-18 | none |
| DEL-004 | Root GLOBAL | WIP governance + live items (`wip/`) | hanax-ai | claude-root-alpha | active | 2026-07-20 | 2026-10-18 | none |
| DEL-005 | Root GLOBAL | Workspace proposals (`docs/proposals/`) | hanax-ai | claude-root-alpha | active | 2026-07-20 | 2026-10-18 | none |
| DEL-006 | Root GLOBAL | Root skills + advisory hooks (`.claude/`) | hanax-ai | claude-root-alpha | active | 2026-07-20 | 2026-10-18 | none |
| DEL-007 | Root GLOBAL | Verification + CI (`verify-layout.sh`, `.github/workflows/`) | hanax-ai | claude-root-alpha | active | 2026-07-20 | 2026-10-18 | none |
| DEL-008 | Root GLOBAL | OSS/legal corpus (LICENSE, CONTRIBUTING, SECURITY, CHANGELOG, issue/PR templates) | hanax-ai | claude-root-alpha | active | 2026-07-20 | 2026-10-18 | none |
| DEL-009 | framework | governance-framework constitution (v3.1.0) + README + playbook | hanax-ai | claude-root-alpha | active | 2026-07-20 | 2026-10-18 | none |
| DEL-010 | framework | Standards registry (`standards/`, currently ST-001) | hanax-ai | claude-root-alpha | active | 2026-07-20 | 2026-10-18 | none |
| DEL-011 | framework | Project skills (`mirror-sync`, `skills-creator`) | hanax-ai | claude-root-alpha | active | 2026-07-20 | 2026-10-18 | placement revisit rides lifecycle spec (WIP item riders, commit fe05792) |
| DEL-012 | ops | governance-ops constitution (v1.1.0) + README + playbook | hanax-ai | claude-root-alpha | active | 2026-07-20 | 2026-10-18 | none |
| DEL-013 | ops | Operational registers (`registers/`) | hanax-ai | claude-root-alpha | active | 2026-07-20 | 2026-10-18 | none |
| DEL-014 | ops | Evidence policy + templates (`records/`) | hanax-ai | claude-root-alpha | active | 2026-07-20 | 2026-10-18 | none |

**Template row (copy, fill, append):**

| DEL-0NN | Root GLOBAL \| framework \| ops | `<artifact set>` | `<GitHub handle>` | `<claude-…>` or — | active \| at-risk \| retiring \| retired | YYYY-MM-DD | YYYY-MM-DD | none \| `<exception, owner role, due>` |
