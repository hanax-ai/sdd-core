---
title: Mission Authority Envelope
status: active
topic: mission-authority
schema_version: "4.0.0"
---

# Mission Authority Envelope

[mission-envelope.schema.json](mission-envelope.schema.json) defines the closed
structural contract for an authorized mission.

Only Agent Zero or an explicitly recognized human authority source can
originate authority. Agent Workflow, Fusion Harness, CI, reviews, evidence, and
models cannot sign, supersede, widen, or mint it.

The canonical digest input is the UTF-8
`sdd-core-canonical-json-v1` representation of the envelope with sorted keys
and no insignificant whitespace, excluding only
`integrity.canonicalDigest` and `signature.value`. The validator recomputes the
SHA-256 digest and mechanically verifies the RS256 signature against the exact
public key and digest in [trust-profiles.json](trust-profiles.json). It never
trusts a recorded `verified` boolean.

The committed profile is a public synthetic fixture trust profile only. A real
adopter must bind its separately governed human-authority trust profile and
public key without storing a private key in SDD-Core.

The closed envelope also binds initiating authority, authority reference,
trigger, repository, branch, paths, actions, environments, capabilities,
tools, MCP operations, prohibited actions, validation/evidence requirements,
completion conditions, and time/attempt/retry/cost/memory limits. Semantic
validation rejects digest/signature mismatch, expiration, revocation,
supersession, replay, scope expansion, frozen-policy change, and base mismatch.
