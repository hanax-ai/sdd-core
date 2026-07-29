---
title: Project Adoption Contract
status: active
topic: adoption-contract
schema_version: "4.0.0"
---

# Project Adoption Contract

[project-adoption.schema.json](project-adoption.schema.json) is the closed,
draft-2020-12 contract by which an independent repository adopts a pinned
SDD-Core release.

The adopter owns its repository, constitution, tailoring, implementation,
releases, and evidence. The contract records source identity, digests,
authority, protected provisions, integration bindings, and supersession. It
does not grant SDD-Core write authority over the adopter.

Protected provisions cannot be omitted, tailored, or excluded. Every permitted
tailoring requires a treatment, rationale, and exact approving-authority
reference. Unknown fields, secret-like keys, secret-bearing allowed-field
values, connection material, and personal machine paths are rejected at any
contract depth. YAML is the human-edited installed form; JSON fixtures are
canonical validator cases.
