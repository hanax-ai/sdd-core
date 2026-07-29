---
title: FRAMEWORK-DEFINITION Domain
status: active
topic: domain-guidance
domain: FRAMEWORK-DEFINITION
---

# FRAMEWORK-DEFINITION — the what and why

This internal SDD-Core domain defines reusable governance principles, policies,
standards, decision rights, control definitions, maturity models, and
framework specifications. It does not operate recurring controls, own adopter
state, or grant Gate authority.

Its [scope constitution](constitution.md) is subordinate to the root
constitution. Its [ownership boundary](ownership.md) permits a one-way
dependency: [OPERATIONAL-GOVERNANCE](../operations/README.md) may implement
ratified definitions, but operational state cannot redefine them.

## Live structure

```text
governance/framework/
├── README.md
├── constitution.md
├── ownership.md
├── docs/specs/
│   ├── template/
│   ├── template-software/
│   └── examples/
├── knowledge/instructions.md
├── reference/
├── skills/
└── standards/
```

Root conversations and WIP serve this domain through explicit
`domain: framework-definition` metadata. Assistant adapters live at the
repository root or under `skills/`; no domain-local `.specify/`, `.claude/`, or
conversation tree exists.

## Boundary and lifecycle

An artifact belongs here when it defines a reusable governance rule or model.
Recurring procedure, evidence definition, runbook shape, or control execution
belongs in OPERATIONAL-GOVERNANCE. Application delivery belongs in its
independent adopter repository.

New normative work follows spec → plan → tasks. WIP remains non-authoritative,
Gate 1 promotes only the named artifact into formal planning, and Gate 2
authorizes only the named reviewed implementation plan.
