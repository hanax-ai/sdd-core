# Contributing to SDD-Core

SDD-Core is a governed source-framework repository. Contributions preserve its
human authority, internal-domain boundaries, adopter sovereignty, and
file-native audit trail.

## Ground rules

1. Read the [root constitution](.specify/memory/constitution.md), then the
   applicable internal-domain scope document.
2. Ideas begin in [wip/](wip/). WIP stays non-authoritative even when committed,
   reviewed, or merged.
3. Gate 1 promotes an exact item into a formal artifact. Gate 2 authorizes an
   exact specification or plan for implementation. Only Agent Zero or an
   explicitly recognized human authority source can issue either, and Agent
   Zero must record that recognized human authority source.
4. Framework changes stay in [governance/framework/](governance/framework/);
   operational-governance changes stay in
   [governance/operations/](governance/operations/). Repository-wide contracts
   and architecture use [docs/specs/](docs/specs/).
5. No cross-repository or machine-tier write occurs without separate exact
   authority.
6. Never commit credentials, connection strings, private host data, tenant
   identifiers, customer data, or personal machine paths.
7. Run `bash verify-layout.sh` and review the complete diff before proposing a
   merge.

## Contribution flow

```text
idea -> WIP -> Gate 1 -> spec -> plan -> tasks -> Gate 2
     -> implementation -> validation -> review -> separate merge authority
```

A review, CI pass, Workflow state, Harness result, or merge-ready label is
evidence only.

## Licensing

Contributions are licensed under the repository's
[Apache License 2.0](LICENSE).
