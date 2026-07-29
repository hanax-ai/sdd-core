---
id: sdd-core-new-project-bootstrap
title: New Project Operationalization
artifact_type: bootstrap-contract
category: adoption
authority_tier: root-global
status: release-candidate
version: 4.0.0-rc.1
access_level: public
---

# New Project Operationalization

## Purpose

Operationalization installs the file-native
[adopter template](../templates/project/README.md), verifies identity and
bindings, and assembles read-only context. It does not execute agents, call
models, mutate a project, or advance a governance gate.

## Deterministic prerequisites

The bootstrap evaluator MUST receive:

1. a repository URL and immutable commit;
2. a clean, readable target tree;
3. a schema-valid adoption record with no sentinel values;
4. a verified SDD-Core revision and digest;
5. a compatible immutable Fusion Harness binding;
6. an Agent Workflow registration target or an adopted outage policy; and
7. a writable disposable cache location outside governed repository state.

For every input it emits a content-addressed evidence record naming the check,
observed value, expected value, result, and source. Missing, mismatched, or
unverifiable prerequisites produce `BLOCKED`; they are never guessed or
repaired automatically.

## State machine

```text
UNINITIALIZED
  -> INSPECTING
  -> BLOCKED | READY_READ_ONLY
READY_READ_ONLY
  -> AUTHORIZED_MISSION_REQUIRED
AUTHORIZED_MISSION_REQUIRED
  -> EXECUTION_ELIGIBLE
```

`EXECUTION_ELIGIBLE` requires independent verification of an authenticated,
current, unrevoked, unsuperseded, replay-safe mission envelope whose
repository, paths, actions, policy digest, and base commit match the request.
Readiness alone never crosses that boundary.

## Read-only allowlist

During `INSPECTING` and `READY_READ_ONLY`, access is limited to:

- repository identity, remote URL, current commit, branch, and worktree status;
- allowlisted governance and adoption files;
- immutable integration manifests and installed-version metadata;
- file names, sizes, content digests, and declared cross-links; and
- non-secret process and platform capability metadata needed for compatibility.

The evaluator MUST NOT read application code, discover or access secrets,
initiate network activity, install or invoke hooks, open connections, call a
model, start an agent, invoke an MCP, mutate repository or machine state,
change integration state, or advance Gate 1, Gate 2, merge, release, or
deployment.

## Disposable cache

Read-only context indexes may be cached outside governed state under a
run-scoped identifier. Cache content is non-authoritative, contains no secrets,
is disposable, and MUST be invalidated when repository commit, adoption
digest, policy digest, or integration binding changes.

## Acceptance examples

| Scenario | Result | Reason |
|---|---|---|
| All identities and bindings verify | `READY_READ_ONLY` | Context assembly may proceed without mutation |
| Repository identity is missing | `BLOCKED` | The target cannot be proven |
| No compatible immutable Harness release exists | `BLOCKED` | A placeholder release is forbidden |
| Adoption record is invalid or contains sentinels | `BLOCKED` | Governance binding is incomplete |
| Workflow is unavailable with no adopted degraded policy | `BLOCKED` | Coordination prerequisite is unresolved |
| Workflow is unavailable with a valid adopted policy | `READY_READ_ONLY` | Readiness continues; execution still requires a valid pre-issued mission |

See the [adoption contract](../contracts/adoption/README.md), [mission
contract](../contracts/authority/README.md), [Harness
integration](../integrations/fusion-harness/README.md), and [Workflow
integration](../integrations/agent-workflow/README.md).
