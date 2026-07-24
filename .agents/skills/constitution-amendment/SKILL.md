---
name: constitution-amendment
description: Use when amending any constitution in this workspace — "amend the constitution", "bump the constitution version", "propagate the amendment", "update the Sync Impact Report", "is this MAJOR or MINOR or PATCH". Governs SemVer-for-governance computation, the Sync Impact Report shape, the version footer format (content-checked by verify-layout), same-change propagation to inheriting constitutions, and what does and does not get a registry row.
---

# Constitution Amendment

Operational procedure for the Amendment Procedure defined in
`.specify/memory/constitution.md` (Governance section) — that text is
normative; this skill is the checklist. Five amendments were executed manually
on 2026-07-20 alone; this skill keeps the shape uniform.

## 1. Compute the bump (SemVer for governance)

- **MAJOR** — backward-incompatible change, removal, or REDEFINITION of an
  article (e.g. a rescope that redefines every article).
- **MINOR** — new article/section, or MATERIALLY expanded guidance (e.g.
  adding a supremacy statement + routing table).
- **PATCH** — clarifications and non-semantic refinements (e.g. path/example
  refresh after renames).

Compute from the VERIFIED current version — read the footer, do not trust
memory. Mixed changes take the highest applicable bump; note lower-class
riders in the report.

## 2. Sync Impact Report (root constitution) / Amendments list (project)

- Root: REPLACE the top comment block: version change, bump rationale, the
  changes themselves, impact note listing every affected file, and the
  previous-reports line APPENDED with the outgoing version. Follow-up TODOs
  named or "none".
- Project constitutions: APPEND a dated entry to the `### Amendments` list —
  never rewrite prior entries (condensing needs an explicit note).

## 3. Footer — same change, exact shape

`**Version**: X.Y.Z | **Ratified**: YYYY-MM-DD | **Last Amended**: YYYY-MM-DD`

`verify-layout.sh` content-checks this pattern on all three constitutions —
run it before committing. Ratified date never changes; Last Amended = the
amendment date.

## 4. Propagation

Approved amendments propagate IN THE SAME CHANGE to every inheriting project
constitution and any template referencing the amended text. Per the v2.1.0
propagation exception, the root amendment plus its mandated propagation is
ONE root-authority act and lands as one commit (this is not a per-scope
violation — the constitution itself provides the exception). Where
same-change propagation is impracticable, the Sync Impact Report documents
the deviation and names the follow-up commits (the constitutional fallback,
v2.1.0).

## 5. Authority and audit

- Only the Workspace Maintainer approves amendments; agents never self-amend
  as a side effect of feature work; sub-projects propose upward.
- Audit: the amendment commit IS the record (git history). Install Registry
  rows only if the amendment changes TOOLING (registry-logging scope,
  narrowed 2026-07-20).

## 6. Done-when

- `verify-layout.sh` fully green (footer + invariant content checks).
- New version cited consistently anywhere the document self-references.
- Inheriting constitutions propagated or deviation documented.
