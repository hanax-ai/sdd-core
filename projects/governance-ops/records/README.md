# Evidence Records — Policy Home

Operational policy for governance-control execution evidence, operationalizing
the three evidence classes in this project's constitution (Article III). This
directory is the POLICY scaffold only — the evidence SYSTEM (intake flows,
dashboards, real record pipelines) arrives spec-first via `../docs/specs/` per
the constitution; do not build capability here without an approved spec.

## The three classes, operationalized

| Class | What | Where | Git status |
|-------|------|-------|-----------|
| 1 — Committed | Templates and SYNTHETIC examples only | `templates/` here | Tracked (re-included in `.gitignore`) |
| 2 — Machine-local | Real evidence records | This directory (files other than policy/templates) and/or `~/.sdd-core-ops/artifacts/gov-ops-evidence/<control-id>/` | Ignored by default (`projects/governance-ops/records/*`) |
| 3 — External | Evidence held in an approved external system of record | The external system | Only SAFE REFERENCES committed |

**Never commit real evidence.** Committing any real record requires explicit
maintainer approval PLUS a secrets/identity scan first (constitution Article
III). The `.gitignore` default enforces the safe direction; the re-include
patterns admit only `README.md` files and `*.template.md` under `templates/`.

## Record shape (one-way dependency contract)

Every evidence record — machine-local or externally referenced — carries at
least: control ID (register row in `../knowledge/instructions.md` §1);
policy/standard version implemented; effective date; execution date;
responsible ROLE (aliases/roles only, never personal data); result; evidence
location; exception or remediation status.

## Safe-reference format (class 3)

Committed citations of external evidence use exactly:

`[EXT] <system-alias> · <record-id> · <YYYY-MM-DD>`

System aliases are declared in the register — never raw URLs bearing hostnames,
tenant paths, or query tokens (root Endpoint Discipline).

## Retention (class 2 default)

Machine-local evidence is retained until the owning control's NEXT successful
review + 30 days, then the maintainer prunes; per-control overrides are
declared in the Runbook & Cadence Register row. Pruning is a maintainer act,
logged in the machine Install Registry Event Log. (Default set by maintainer
direction 2026-07-20; adjust by updating this policy through a governed
change.)

## Sync note

Conversation records and their sync policy live in `../conversations/` — a
DIFFERENT system (see `../conversations/SYNC-POLICY.md`). Nothing in this
directory syncs anywhere; class 2 material never leaves the machine except
into an approved class 3 system.
