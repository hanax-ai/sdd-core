# Evidence Records — Policy Home

Operational policy for governance-control execution evidence, operationalizing
the three evidence classes in the OPERATIONAL-GOVERNANCE domain scope. This
directory is the POLICY scaffold only — the evidence SYSTEM (intake flows,
dashboards, real record pipelines) belongs in an adopter or dedicated operational
repository. SDD-Core defines reusable procedures and record shapes; it does not hold
live portfolio state.

## The three classes, operationalized

| Class | What | Where | Git status |
|-------|------|-------|-----------|
| 1 — Committed | Templates and SYNTHETIC examples only | `templates/` here | Tracked (re-included in `.gitignore`) |
| 2 — Machine-local | Real evidence records | Adopter-owned machine-tier evidence location | Outside this repository |
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

System aliases are declared by the adopter — never raw URLs bearing hostnames,
tenant paths, or query tokens (root Endpoint Discipline).

## Retention (class 2 default)

Machine-local evidence retention is adopter-owned and must be declared in the
adopter's control definition. Pruning is a human-authorized operational act and its
evidence remains with the adopter, never in SDD-Core or the tooling Install Registry.

## Reusable register definition

A register definition may specify fields, allowed states, cadence, evidence
requirements, and the framework standard it implements. A live register containing
owners, assignments, adopter status, review dates, exceptions, or portfolio state is
not permitted in SDD-Core. That state belongs to the independent repository or
coordination system that owns the work.

## Sync note

Internal-domain conversation outcomes use the root
[`conversations/`](../../../conversations/) system with
`domain: OPERATIONAL-GOVERNANCE`. They are different from control-execution
evidence, which stays adopter-owned.
