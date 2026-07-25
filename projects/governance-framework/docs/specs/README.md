# Feature Lifecycle Folders

Each feature lives in a numbered folder: `001-feature-name/`, `002-.../`, and
so on. To start a feature, pick the template set matching the artifact class,
copy it to the next available number, and fill the files in order:
`spec.md` → `plan.md` → `tasks.md`.

## Template sets in this project

- `template/` — **normative-standard shape** (this project's default): for
  definitional artifacts — principles, policies, standards,
  framework-definition specs (the Definitional-Artifact Test). Validation
  Mode: `file-native`.
- `template-software/` — **software/product shape**: the workspace's single
  canonical software/product template home, retained here for FUTURE product
  projects (adopters copy it into their own tree). Validation Mode:
  `test-runtime` (classic TDD). Not for governance features in this project.

## Completed synthetic examples

- `examples/normative-standard-fixture/` — a completed package in the
  normative-standard shape.
- `examples/software-product-fixture/` — a completed package in the
  software/product shape.

Fixtures are banner-marked SYNTHETIC, live OUTSIDE numbered feature folders,
are excluded from feature numbering, and grant no authority. A material
template change re-baselines its fixture in the same scoped change.

## Gates

A feature may not advance to planning until every row of its
**Ambiguities & Clarifications** table in `spec.md` is Resolved.
