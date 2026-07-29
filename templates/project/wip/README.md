---
id: adopter-wip-policy
title: Adopter WIP Policy
artifact_type: policy
category: collaboration
authority_tier: adopter
status: template
version: 1.0.0
access_level: public
---

# Adopter WIP Policy

WIP is the repository's collaborative thinking space. Drafts, plans, reviews,
recommendations, readiness results, and tool output in WIP grant no authority.

Promotion requires this exact human Gate 1 shape:

`Approved for promotion: <exact-wip-item-path>@<immutable-revision> -> <exact-target-artifact-path>`

It identifies the exact WIP item, target artifact, and immutable revision.
Implementation requires this separate exact human Gate 2 shape:

`Approved for implementation: <exact-specification-path> + <exact-reviewed-plan-path>@<immutable-revision-or-digest>`

It identifies the exact approved specification and reviewed plan plus their
immutable revision or digest. Praise, discussion, review completion, or a
passing check is not approval.

Follow the [constitution](../.specify/memory/constitution.md) and preserve
durable context under the [conversation policy](../conversations/SYNC-POLICY.md).
