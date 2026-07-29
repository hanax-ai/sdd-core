---
id: agent-workflow-integration
title: Agent Workflow Coordination Contract
artifact_type: integration-contract
category: coordination
authority_tier: root-global
status: release-candidate
version: 4.0.0-rc.1
access_level: public
---

# Agent Workflow Coordination Contract

Agent Workflow is the durable coordination and execution-control system for
SDD-Core-governed missions. It records and schedules authorized work; Fusion
Harness performs that work.

Every operationalized adopter is registered in read-only readiness. The
[registration schema](registration.schema.json) holds pinned repository,
SDD-Core, and Harness identities plus compatibility, authority, mission,
work-order, evidence, outbox, and reconciliation references. Workflow stores
references to adopter-owned evidence; it does not own that evidence.

The [status schema](status.schema.json) separates registration/readiness,
execution, evidence, and human-authority state. Workflow cannot call models,
access project networks, invoke hooks, mutate governed state, start agents, or
mint authority.

A Workflow outage normally produces `BLOCKED`. `DEGRADED` is valid only when
the adopter already has an adopted degraded-mode policy and the status binds a
pre-issued mission by mission ID, nonce, repository-relative envelope
reference, and SHA-256 envelope digest. The validator loads that immutable
envelope, compiles it against the authority schema, recomputes its canonical
digest, verifies its RS256 signature against the approved trust profile, and
checks expiry, revocation, supersession, replay, frozen policy, base, and
scope. Degraded mode cannot create or expand a mission and always requires
later reconciliation. See the [fixtures](fixtures/) for bounded examples.
