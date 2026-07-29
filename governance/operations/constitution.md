---
title: OPERATIONAL-GOVERNANCE Scope Constitution
scope_document_version: 1.0.0
root_constitution_version: 4.0.0
status: subordinate
domain: OPERATIONAL-GOVERNANCE
---

# OPERATIONAL-GOVERNANCE Scope Constitution

This document governs the internal OPERATIONAL-GOVERNANCE domain of SDD-Core.
It is subordinate to the
[root constitution](../../.specify/memory/constitution.md) and the normative
framework definitions it implements. It creates no repository-wide, adopter,
Gate, merge, release, or machine-tier authority.

## Purpose

The domain defines reusable procedures, runbooks, cadences, register shapes,
control-execution patterns, and evidence operations—the how and when of
SDD-Core governance.

## Jurisdiction

The domain owns only:

- this scope document;
- [README.md](README.md);
- [docs/](docs/) operational templates and synthetic examples;
- [knowledge/](knowledge/) control definitions and grounding instructions;
- [records/](records/) reusable evidence definitions and templates;
- [reference/](reference/) non-authoritative source guidance; and
- future runbooks created through approved specifications.

It may implement ratified framework standards through a one-way
FRAMEWORK-DEFINITION to OPERATIONAL-GOVERNANCE dependency. It may not:

- redefine framework principles, policy, or human authority;
- contain an application implementation plan;
- retain live assignments, deliverables, portfolio state, or project evidence;
- operate Fusion Harness or Agent Workflow;
- originate or infer Gate 1, Gate 2, merge, release, or deployment authority;
- modify an adopter repository or machine-tier installation; or
- treat review, CI, integration health, workflow state, or evidence as approval.

## Records and execution boundary

SDD-Core defines record shapes; adopters own real records and durable evidence.
Agent Workflow may retain immutable references. Fusion Harness may return
execution evidence. Neither integration owns project truth or creates
authority.

Substantive changes follow the root spec-first lifecycle and human gates.
Conversation outcomes use the root
[conversation system](../../conversations/) with
`domain: OPERATIONAL-GOVERNANCE`.

If this document conflicts with the root or framework authority, the higher
authority prevails.
