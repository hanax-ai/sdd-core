---
id: adopter-template-readme
title: SDD-Core Adopter Template
artifact_type: readme
category: adoption
authority_tier: adopter
status: template
version: 1.0.0
access_level: public
---

# SDD-Core Adopter Template

This portable package adopts SDD-Core governance without prescribing product
architecture. The adopter retains ownership of its repository, implementation,
evidence, and local decisions.

Before adoption, replace every zero-value sentinel in
[the adoption record](.sdd-core/adoption.yaml) with verified immutable
identities and digests. The `0.0.0`, all-zero commit, epoch date, and all-zero
digest values are explicit unbound sentinels, not releases or authority.
Readiness MUST remain `BLOCKED` while any sentinel remains.

Start with the [constitution](.specify/memory/constitution.md), then read the
[WIP policy](wip/README.md), [conversation policy](conversations/SYNC-POLICY.md),
and [knowledge instructions](knowledge/instructions.md). Assistant-specific
files are subordinate adapters.
