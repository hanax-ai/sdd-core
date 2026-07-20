# WIP Collaboration Protocol

How multiple authorized root-scoped agents and human contributors work on the same WIP
items without collisions, silent overwrites, or approval confusion. This protocol
governs collaboration ONLY — it grants no promotion or implementation authority
(see [`README.md`](README.md); Agent Zero holds Gate 1 and Gate 2 exclusively).

## 1. Contributor roles

- **Contributor** — any authorized root-scoped agent or human adding research,
  alternatives, or drafts to an item. Identity is a stable UNIQUE name: humans use
  their GitHub handle; agents use `claude-<role>-<assigned-name-or-short-id>`
  (e.g. `claude-research-alpha`, `claude-research-beta`). A bare role
  (`claude-research`) is NOT a valid identifier — multiple simultaneous agents can
  share a role, so every agent instance gets its own suffix, used consistently in
  claims, contribution files, item metadata, and `_index.md`.
- **Synthesis lead** — one per item, named in the item README and `_index.md`.
  Default: the item's creator, until Agent Zero or the lead reassigns (recorded in
  both places).
- **Agent Zero** — approval authority only; may also contribute, but approvals are
  never implicit in contributions.

## 2. Synthesis-lead responsibilities

- Sole integrator of the canonical item `README.md` — reconciles contributions into
  the synthesis; nobody else edits that file (W10).
- Reviews contribution files, preserves competing proposals until reconciled, and
  records reconciliation rationale in the README.
- Keeps `_index.md` (status, contributors) and the item's metadata current.
- Detects stale work (§8) and runs handoffs (§10).
- A synthesis decision is an editorial act inside WIP — never a ratified workspace
  decision.

## 3. Workstream claiming — claim on `main` BEFORE any work

A claim is authoritative only once it is visible on `main`. A claim sitting on an
unmerged contributor branch is invisible to everyone else and reserves nothing.

1. Synchronize with the latest `main`; read this file, the item README, and every file
   under `coordination/claims/`.
2. Pick a bounded workstream not already claimed. If your intended work overlaps an
   existing claim: STOP and coordinate with the claim holder (or synthesis lead) —
   never proceed in parallel on a claimed scope (W9).
3. Create ONE claim file `coordination/claims/<your-unique-name>.md` (or
   `<workstream-name>.md` for a shared workstream with a named owner) stating: owner
   (unique identifier), scope (files + topic), start date, expected completion.
4. **Publish the claim to `main` FIRST** — a small claim-only commit (or claim-only
   PR), containing nothing but the claim file. Only after the claim is on `main` may
   the contribution branch be created.
5. **Push-race rule:** if the claim push is rejected (non-fast-forward), someone else
   just published — pull, re-read ALL claims, and only re-attempt if your workstream
   is still free. Git's push atomicity makes the first published claim win; the loser
   re-plans, never force-pushes.
6. One active claim file per workstream. Remove or close the claim (via `main`) after
   integration.

## 4. Branch and worktree conventions

- One isolated branch (or git worktree) per contributor or workstream:
  `wip/<item-slug>-<agent-or-workstream>` (e.g.
  `wip/evidence-based-skill-lifecycle-claude-research`).
- Always start by synchronizing with the latest `main`.
- Worktrees follow the same naming; delete them after merge.

## 5. File-ownership boundaries

- Contributors write ONLY within their claimed scope: their own
  `contributions/<their-name>.md` (or claimed workstream file) and their own claim
  file. `supporting-materials/` additions are fine when named for the contributor.
- NEVER overwrite or edit another contributor's file. Respond to it in your own file.
- Canonical `README.md`: synthesis lead only. `_index.md`: synthesis lead (or the
  creator when adding a new item row).
- Competing ideas stay in separate files until the lead reconciles them.

## 6. Standard workflow

1. Synchronize with latest `main`.
2. Read the WIP policy (`README.md`), this protocol, the item README, active claims.
3. Claim a bounded workstream and PUBLISH the claim to `main` (§3) — the branch comes
   only after the claim is visible to everyone.
4. Create your isolated branch/worktree (§4).
5. Write only within the claimed files and scope (§5).
6. Commit ONE coherent contribution.
7. Push the branch.
8. Open or prepare the contribution for review (§7).
9. Synthesis lead integrates accepted contributions into the canonical README.
10. Lead updates the item README + committed `_index.md`.
11. Remove/close the claim after integration; delete the merged branch.

## 7. Pull-request and review expectations

- Contributions merge to `main` via review — the synthesis lead (or a contributor the
  lead names) reviews; contributors do not merge their own contribution when
  independent review is required.
- Review scope: policy compliance (no secrets — W11, ownership boundaries respected,
  claim exists), NOT idea quality gatekeeping — bad ideas are reconciled by synthesis,
  not blocked at merge.
- **Merge approval is NEVER Gate 1 or Gate 2 approval.** A merged item remains
  `NOT APPROVED`.

## 8. Stale-work detection

- A claim untouched (no commits on its branch) for **14 days** is stale: the lead
  pings the owner; after 7 further days without response, the lead may close the
  claim (§10 abandonment) and note it in the item README.
- Stale contribution branches are synchronized with `main` before integration — never
  integrated from an outdated base.

## 9. No force-push rule

Never force-push shared branches, rewrite another contributor's history, or use
destructive rollbacks in `wip/`. Undo = new commit or normal `git revert` (W12).

## 10. Handoff and abandonment

- **Handoff:** outgoing owner updates the claim file (new owner, date, state of the
  work); new owner confirms in the same file; lead records it in the item README.
- **Abandonment:** lead closes the claim, marks the contribution file
  `(abandoned — available for adoption)` at its top, leaves content in place.
  Abandoned work is never deleted — it may be adopted via a fresh claim.

## 11. Agent Zero approval boundaries

Everything in this protocol operates WITHOUT Gate 1: creating items, contributing,
reviewing, synthesizing, committing, pushing, merging. The moment work would create or
modify an AUTHORITATIVE artifact (spec, proposal, amendment, skill/tooling, registry
declaration), it leaves this protocol's authority — hard stop, request the exact
directive: `Approved for promotion: <item> → <target>` (Gate 1) or
`Approved for implementation: <spec>` (Gate 2). Nothing a contributor, reviewer, or
synthesis lead does can substitute for either.
