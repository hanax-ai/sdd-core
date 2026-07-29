---
title: FRAMEWORK-DEFINITION Scope Constitution
scope_document_version: 1.0.0
root_constitution_version: 4.0.0
status: subordinate
domain: FRAMEWORK-DEFINITION
---

# FRAMEWORK-DEFINITION Scope Constitution

This document governs the internal FRAMEWORK-DEFINITION domain of SDD-Core. It
is subordinate to the [root constitution](../../.specify/memory/constitution.md)
and creates no repository-wide, adopter, Gate, merge, release, or machine-tier
authority.

## Purpose

The domain defines reusable principles, policy, standards, decision rights,
terminology, lifecycle specifications, and normative framework artifacts—the
what and why of SDD-Core.

## Jurisdiction

The domain owns only:

- this scope document;
- [README.md](README.md);
- [docs/](docs/) framework specifications, templates, and synthetic examples;
- [standards/](standards/) normative reusable standards;
- [knowledge/](knowledge/) domain grounding instructions;
- [reference/](reference/) non-authoritative source guidance; and
- [skills/](skills/) canonical repository-owned framework skill content.

It may read root authority and grounded external sources. It may not:

- execute recurring controls or project missions;
- redefine GLOBAL authority or operational procedures;
- write the OPERATIONAL-GOVERNANCE domain;
- prescribe an adopter's product architecture;
- store application, portfolio, or project state;
- originate Gate 1, Gate 2, merge, release, or deployment authority; or
- modify an adopter repository or machine-tier installation.

## Dependency and change rules

OPERATIONAL-GOVERNANCE may implement this domain's ratified standards through a
one-way dependency. Framework definition must not depend on live operational
state.

Substantive changes follow the root spec-first lifecycle and human gates.
Domain evidence and reviews remain evidence only. Conversation outcomes use the
root [conversation system](../../conversations/) with
`domain: FRAMEWORK-DEFINITION`.

If this document conflicts with the root constitution, the root constitution
prevails.
