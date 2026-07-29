---
title: Evidence Envelope
status: active
topic: evidence-contract
schema_version: "4.0.0"
---

# Evidence Envelope

[evidence-envelope.schema.json](evidence-envelope.schema.json) defines
content-addressable, project-owned evidence. It separates deterministic
validation, advisory review coverage, integration health, and workflow state.

Evidence cannot contain approval or authority transitions. Agent Workflow may
retain an immutable reference, but the independent project owns the durable
record and location. A valid envelope proves an observation only.
