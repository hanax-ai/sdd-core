---
title: OPERATIONAL-GOVERNANCE Domain
status: active
topic: domain-guidance
domain: OPERATIONAL-GOVERNANCE
---

# OPERATIONAL-GOVERNANCE — the how and when

This internal SDD-Core domain defines reusable procedures, runbook shapes,
cadences, control patterns, record templates, and evidence definitions. It
does not execute an adopter mission, own live portfolio state, or grant Gate
authority.

Its [scope constitution](constitution.md) is subordinate to the root
constitution. Its [ownership boundary](ownership.md) consumes ratified
[FRAMEWORK-DEFINITION](../framework/README.md) material through a one-way
dependency.

## Live structure

```text
governance/operations/
├── README.md
├── constitution.md
├── ownership.md
├── docs/specs/
│   ├── template/
│   └── examples/
├── knowledge/instructions.md
├── records/
│   ├── README.md
│   └── templates/
└── reference/
```

Root conversations and WIP serve this domain through explicit
`domain: operational-governance` metadata. There is no live portfolio
register, domain-local `.specify/`, or domain-local conversation tree. Real
execution evidence remains adopter-owned or in an approved external system of
record; committed records here are definitions and synthetic templates only.

## Boundary and lifecycle

An artifact belongs here when it defines how a ratified governance rule is
operated or evidenced. The rule itself belongs in FRAMEWORK-DEFINITION.
Application execution and live evidence belong in the adopter repository.

New operational capabilities follow spec → plan → tasks. Routine use of an
already ratified procedure follows its record discipline but creates no new
authority.
