---
id: adopter-conversation-sync-policy
title: Adopter Conversation Sync Policy
artifact_type: policy
category: conversations
authority_tier: adopter
status: template
version: 1.0.0
access_level: public
---

# Adopter Conversation Sync Policy

Record durable decisions, directives, unresolved questions, and evidence
references in this repository. A conversation record preserves provenance; it
does not grant authority.

Each record MUST identify its repository, source, date, participants, scope,
authority state, and related artifact using repository-relative paths. For a
ratified decision or directive, it MUST also record the exact ratifying
artifact path, that artifact's immutable revision or digest, and the exact
directive or authority reference. Keep machine-tier or cross-repository
conversation routing outside this repository unless separately authorized.

Use [WIP](../wip/README.md) for exploratory work, the
[constitution](../.specify/memory/constitution.md) for authority rules, and
[knowledge instructions](../knowledge/instructions.md) for source grounding.
