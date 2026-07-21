# AGENTS.md — Harness Adapter

Instructions for ANY AI coding agent or harness operating in this repository
(Codex, Cursor, Gemini, Claude Code, and others that read this file).

## Precedence — this file is BENEATH the governance, never above it

This adapter only points; it holds no authority. Binding order:

1. Root constitution — `.specify/memory/constitution.md`
2. The canonical five-step CONTEXT-LOADING order (below, defined in
   `README.md`)
3. Project constitutions — `projects/<name>/.specify/memory/constitution.md`
   (stricter rule wins)
4. Playbooks and policies the above name
5. This file — a convenience pointer only. If anything here appears to
   conflict with the above, the above wins and this file is defective.

## The canonical five-step CONTEXT-LOADING order

1. **Root constitution** — `.specify/memory/constitution.md`
2. **Root mirror registry** — `knowledge/instructions.md`
3. **Project constitution** — `projects/<name>/.specify/memory/constitution.md`
4. **Project mirror registry/playbook** — `projects/<name>/knowledge/instructions.md`
5. **Active feature folder** — `projects/<name>/docs/specs/NNN-feature-name/`

## Non-negotiables for every harness

- **Scope isolation:** project-scoped work writes ONLY inside its
  `projects/<name>/` tree; the global tier is read-only from project scope.
- **Approval gates:** `wip/` content is never authority; Gate 1
  (`Approved for promotion: …`) and Gate 2 (`Approved for implementation: …`)
  are issued only by the Workspace Maintainer's directing authority
  (Agent Zero) — no harness, agent, or merged PR substitutes.
- **Spec-first:** no implementation without an approved `spec.md` + `plan.md`.
- **Mirror grounding:** framework-dependent code cites registered local
  mirrors (`knowledge/instructions.md`), never recall.
- **No secrets:** no credentials, hostnames, tenant identifiers, or personal
  data beyond public maintainer roles — environment aliases only. Public repo.
- **Verification:** `bash verify-layout.sh` must stay green (CI runs it as
  advisory feedback).

## Compatibility matrix

| Harness | Pickup mechanism | Status |
|---------|-----------------|--------|
| Claude Code | Native (`.claude/` skills + hooks) + this file | Exercised in this workspace |
| OpenAI Codex | Reads `AGENTS.md` | Expected — untested here |
| Cursor | Reads `AGENTS.md` | Expected — untested here |
| Gemini CLI | Reads `AGENTS.md` (or configure as context file) | Expected — untested here |
| Other AGENTS.md-aware tools | Reads `AGENTS.md` | Expected — untested here |

Statuses are honest: only rows marked "exercised" have been validated. A
harness that cannot read this file still works — the governance is plain
Markdown at the paths above; point the harness at the five-step order manually.
