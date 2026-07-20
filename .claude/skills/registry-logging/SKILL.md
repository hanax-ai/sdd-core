---
name: registry-logging
description: Use when recording ANYTHING in the machine Install Registry — "log this to the event log", "flip the registry row", "record the ownership manifest entry", "add an inventory row", "log the backup hash". Governs entry shapes, append-only discipline, status transitions, and what must never enter the registry.
---

# Registry Logging — Install Registry Procedures

Procedures for `~/.sdd-core-ops/INSTALL-REGISTRY.md`, the machine-local installation
and audit record. The registry is the ownership manifest: "belongs to the plan/workspace"
is a lookup here, never a presumption.

## 1. Structure (never change it)

- **Inventory table** — one row per governed item:
  `Item | Kind | Install Path | Upstream Source | Pinned Version/Commit | Content
  Reviewed By / Date | Installed By Goal | Status | Notes`.
- **Event Log** — append-only:
  `Date | Goal | Event | Details / Artifact Location`.

## 2. When to log

- **At write time, not later.** Every artifact created or modified under governance
  gets its Event Log entry in the same work step that wrote it.
- Machine-tier file modifications: log the Gate 6 backup (path + hash) BEFORE the
  modification entry.
- Sign-offs, approvals, verification results, and proposal records are events too —
  log them when they occur, citing the directive or evidence.

## 3. Entry shapes

- **Timestamp:** UTC, `date -u +%Y-%m-%dT%H:%M:%SZ`. Never local time.
- **Ownership manifest (files):** path + `(created|modified)` + `git hash-object
  <path>` hash + the commit SHA when committed.
- **Ownership manifest (directories):** path only, marked "directory — logged by
  path" (directories cannot be content-hashed).
- **Event entries:** one row per event; pack related hashes into one row rather than
  scattering; escape `|` inside cells.

## 4. Append-only discipline

- Event Log rows are NEVER edited or deleted. A wrong entry is corrected by a new
  entry that names and supersedes it.
- Inventory rows ARE updated in place (status, Notes) — but only forward:
  `pending → complete` (with review record), `complete → removed` (uninstall),
  anything unattributed found on disk → `drift` (stop and review before touching).
- Only a `complete` row with a review record means installed. A `knowledge/tooling.md`
  declaration row never implies installation.

## 5. Never in the registry

Endpoint Discipline applies: no credentials, tokens, hostnames, IPs, tenant
identifiers, or personal data beyond public maintainer roles. Cite environment
aliases, commit SHAs, file paths, and role names only.

## 6. Quick reference

```bash
TS=$(date -u +%Y-%m-%dT%H:%M:%SZ)                 # timestamp
H=$(git hash-object <path>)                        # file hash
# append one Event Log row (heredoc keeps the table cell on one line):
cat >> ~/.sdd-core-ops/INSTALL-REGISTRY.md <<EOF
| $TS | <goal-or-post-plan> | <event name> | <details incl. \`$H\`> |
EOF
```
