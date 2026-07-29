---
title: SDD-Core Conversation Records
status: active
topic: conversation-routing
scope: GLOBAL
---

# SDD-Core Conversation Records

This is the single repository conversation-record home for ratified SDD-Core
outcomes. Application and adopter conversations remain in their independent
repositories.

## Domain routing

Every record declares exactly one `domain` value:

- `global` for repository-wide authority and architecture;
- `framework-definition` for principles, standards, and framework design; or
- `operational-governance` for procedures, cadences, and evidence operations.

A domain value routes the record; it does not create authority. Cross-domain
writes require the scope granted by the governing artifact.

## Usage

1. Read [SYNC-POLICY.md](SYNC-POLICY.md).
2. Copy [TEMPLATE.md](TEMPLATE.md) to
   `YYYY-MM-DD-<kebab-case-topic>.md`.
3. Fill every front-matter field and summarize outcomes; never paste a
   transcript.
4. Mark discussion without a ratifying artifact as unratified.
5. Before modifying an existing record, show the exact diff and obtain explicit
   confirmation.

Records and `_index.md` remain machine-local and Git-ignored. Committed
governance consists only of this README, the policy, and the template.

## Lifecycle

Records are not deleted. A replacement marks the prior record
`status: superseded` and cross-links both records. Material with no live
relevance becomes `archived`. Conversation state never grants Gate, merge,
release, or implementation authority.
