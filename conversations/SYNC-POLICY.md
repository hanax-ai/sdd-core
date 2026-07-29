# Sync Policy — SDD-Core Source Repository

Plain committed policy file, NOT a skill — read by the machine-tier `conversation-sync`
skill. Declares the repository-level sync destination. It may tighten the global skill's
rules; it may never loosen them.

## Declared sync destination

`conversations/` at the repository root is the only SDD-Core conversation
destination. Repository-wide records use `domain: global`. Internal-domain records
use `domain: framework-definition` or `domain: operational-governance`. The domain
metadata is mandatory and does not create a separate authority tier.

Adopter and application-project conversation records remain in their independent
repositories. They never sync into SDD-Core, and SDD-Core records never sync into an
adopter repository.

## Who may write (Article III scope)

Only agents or humans operating under explicit SDD-Core repository or internal-domain
scope may write. Internal-domain scope is limited to its declared domain; it cannot
write another domain's records or mint GLOBAL authority.

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
conventions in [`README.md`](README.md). Every record declares one of the three domain
values above. Records and `_index.md` are git-ignored (machine-local); only README,
this policy, and the template are committed.
