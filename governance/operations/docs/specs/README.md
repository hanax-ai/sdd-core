# Feature Lifecycle Folders

Each feature lives in a numbered folder: `001-feature-name/`, `002-.../`, and
so on. To start a feature, copy `template/` to the next available number and
fill the files in order: `spec.md` → `plan.md` → `tasks.md`.

## Template set in this internal domain

- `template/` — **operational-capability shape** (this internal domain's default):
  for runbooks, cadences, and evidence capabilities (the Execution-Evidence
  Test). Validation Mode: `file-native`.
- Software/product features do NOT start here: the workspace's single
  canonical software/product template lives at
  `governance/framework/docs/specs/template-software/`
  (Validation Mode: `test-runtime`). This internal domain holds no copy.

## Completed synthetic example

- `examples/operational-capability-fixture/` — a completed package in the
  operational-capability shape.

Fixtures are banner-marked SYNTHETIC, live OUTSIDE numbered feature folders,
are excluded from feature numbering, and grant no authority. A material
template change re-baselines its fixture in the same scoped change.

## Gates

A feature may not advance to planning until every row of its
**Ambiguities & Clarifications** table in `spec.md` is Resolved.
