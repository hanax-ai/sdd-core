# Sync Policy — Workspace Root (GLOBAL tier)

Plain committed policy file, NOT a skill — read by the machine-tier `conversation-sync`
skill. Declares the workspace-level sync destination. It may tighten the global skill's
rules; it may never loosen them.

## Declared sync destination

`conversations/` at the workspace root — for **workspace-level records only**:
decisions, constraints, and outcomes ratified at the GLOBAL tier that belong to no
single sub-project. Project-scoped records NEVER land here; they go to the owning
project's `projects/<name>/conversations/` under that project's own policy. No
cross-project destination exists in either direction.

## Who may write (Article III scope)

Only agents explicitly operating at root-level (GLOBAL) scope. Project-scoped agents:
READ-ONLY. This is the constitution's isolated-scope rule applied to this directory —
not a new mechanism.

## Must never sync (restated from the global skill)

- Credentials, tokens, API keys, secrets of any kind.
- Hostnames, IP addresses, ports, connection strings.
- Tenant identifiers, customer/org identifiers.
- Personal data (names beyond public maintainer roles, emails, phone numbers, …).
- Verbatim conversation transcripts — summaries of ratified outcomes only.

Endpoint Discipline applies: treat every record as if it will leave this machine.
When in doubt, leave it out and say so.

## Update validation — ADVISORY diff-and-confirm

Before modifying an existing record: show the exact diff and obtain explicit user
confirmation. Never silently overwrite or rewrite history. Advisory guidance to the
model, not a mechanical guarantee; reliable enforcement, if ever required, is a
future reviewed-script amendment.

## Format

Records follow [`TEMPLATE.md`](TEMPLATE.md) and the naming/metadata/indexing/archival
conventions in [`README.md`](README.md). Records and `_index.md` are git-ignored
(machine-local); only README, this policy, and the template are committed.
