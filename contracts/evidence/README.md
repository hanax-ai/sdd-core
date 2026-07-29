---
title: Evidence Envelope
status: active
topic: evidence-contract
schema_version: "4.0.0"
---

# Evidence Envelope

[evidence-envelope.schema.json](evidence-envelope.schema.json) defines
content-addressable, adopter-owned evidence. It separates deterministic
validation, advisory review coverage, integration health, and workflow state.

Evidence cannot contain approval or authority transitions. Agent Workflow may
retain an immutable reference, but the independent project owns the durable
record and location. Evidence paths are repository-relative and reject `..`
segments in either slash style. A valid envelope proves an observation only.
