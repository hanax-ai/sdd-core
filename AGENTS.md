# AGENTS.md — SDD-Core Harness Adapter

Instructions for AI coding agents and harnesses operating in this repository.

## Precedence

This adapter is a pointer and creates no authority. Read:

1. `.specify/memory/constitution.md`;
2. `knowledge/instructions.md`;
3. the applicable internal-domain scope document:
   `governance/framework/constitution.md` or
   `governance/operations/constitution.md`;
4. the exact approved specification, plan, and tasks; and
5. the grounded source files required by the work.

If this adapter conflicts with a higher artifact, it is defective.

## Non-negotiables

- SDD-Core contains internal governance domains, not application projects.
- FRAMEWORK-DEFINITION and OPERATIONAL-GOVERNANCE writes remain inside their
  exact scope. Operations depends one way on ratified framework definitions.
- An adopter or external repository may be written only under separate,
  repository-specific authority naming the action, target, and immutable base.
- WIP, review, CI, evidence, Workflow, Harness, or merge state never implies
  Gate 1 or Gate 2.
- No implementation without an approved specification and plan.
- Ground external claims in registered sources at immutable pins.
- Do not commit secrets, connection strings, private host data, tenant
  identifiers, customer data, or personal machine paths.
- Machine-tier installation state is outside repository jurisdiction.
- Run `bash verify-layout.sh`; a pass is evidence, not merge authority.

## Integration boundary

SDD-Core defines. Agent Workflow coordinates and records. Fusion Harness
executes verified missions. Each adopter owns its work and evidence. No
assistant adapter, hook, skill, model, integration, or CI service can mint
authority.
