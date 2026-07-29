---
id: fusion-harness-integration
title: Fusion Harness Compatibility Profile
artifact_type: integration-contract
category: execution
authority_tier: root-global
status: blocked
version: 4.0.0-rc.1
access_level: public
---

# Fusion Harness Compatibility Profile

Fusion Harness is the mandatory execution plane for operationalized adopters.
During separately authorized operationalization, installation and binding are
automatic and mandatory. SDD-Core defines and validates the contract but
performs no machine-tier installation; the Harness performs only work
authorized by a valid mission envelope.

Installation is automatic and mandatory, but initial readiness is read-only:
context assembly may inspect allowlisted metadata without model calls, network
access, hook invocation, governed mutation, or agent starts. `READY` does not
grant execution authority. Execution requires a separately verified mission.

The current [compatibility record](compatibility.yaml) is `BLOCKED` because no
compatible immutable Harness release has been verified. Null release fields
are an explicit absence, not a placeholder release. The
[binding schema](binding.schema.json) and [fixtures](fixtures/) define
validation without invoking or modifying the independent Harness repository.

Harness evidence remains evidence. It cannot approve a gate, mint authority,
expand mission scope, or change the adopter's frozen policy or base.
