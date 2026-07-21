# Sync Policy — governance-framework

This is a plain committed policy file, NOT a skill. It is read by the machine-tier
`conversation-sync` skill (the only skill of that name), which carries all sync rules;
this file only declares this project's destination and restates the non-negotiables.
A policy file may tighten the global rules; it may never loosen them.

## Declared sync destination

`projects/governance-framework/conversations/` — records land in this directory and nowhere else.
No default destination exists; no cross-project destination is permitted.

## Must never sync (restated from the global skill)

- Credentials, tokens, API keys, secrets of any kind.
- Hostnames, IP addresses, ports, connection strings.
- Tenant identifiers, customer/org identifiers.
- Personal data (names beyond public maintainer roles, emails, phone numbers, …).
- Verbatim conversation transcripts — summaries of ratified outcomes only.

Endpoint Discipline applies to synced content: treat every record as if it will leave
this machine. When in doubt, leave it out and say so.

## Update validation — ADVISORY diff-and-confirm

Before modifying an existing record: show the exact diff (current vs proposed) and obtain
explicit user confirmation before writing. Never silently overwrite or rewrite history.
This safeguard is advisory guidance to the model, not a mechanical guarantee; if reliable
enforcement is ever required, sync writes must be routed through a reviewed script with
confirmation and path validation (future amendment).

## Git visibility note

Other contents of this directory are git-ignored by the workspace `.gitignore` rule
(`projects/*/conversations/*` with re-includes for `.gitkeep` and this file). Synced
records therefore stay LOCAL to this machine unless a future amendment deliberately
changes that rule. Do not commit record files; do not weaken the ignore rule to make
them committable without a maintainer-approved amendment.
