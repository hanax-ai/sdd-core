# Contributing to sdd-core

This repository is a governed Spec-Driven Development workspace template. All
contributions flow through its own governance — there is no separate
contribution process to learn beyond the one the repository itself documents.

## Ground rules

1. **The constitutions govern.** Read the root constitution
   (`.specify/memory/constitution.md`) first; project trees add their own
   (`projects/<name>/.specify/memory/constitution.md`, stricter rule wins).
2. **Ideas start in `wip/`.** Early-stage proposals are collaborative WIP items
   under the protocol in `wip/COLLABORATION.md`: publish a claim to `main`
   before branching, write only your own contribution files, the synthesis lead
   integrates. Committing or merging WIP content grants NO implementation
   authority — promotion requires the maintainer's explicit Gate 1 directive,
   implementation additionally requires Gate 2 (see `wip/README.md`).
3. **Changes are governed.** Repository changes follow the discipline in
   `.claude/skills/governed-change/SKILL.md`: clean tree, declared edit set,
   one atomic commit per change-set, structural additions update
   `verify-layout.sh` and the README layout tree in the same change.
4. **Scope isolation (root Article III).** Work scoped to a project stays
   inside that project's tree; the global tier is read-only from project scope.
5. **No secrets, ever.** No credentials, hostnames, IPs, tenant identifiers,
   customer data, or personal data beyond public maintainer roles — in any
   file, including WIP items and examples. Environment aliases only. This is a
   public repository.
6. **Spec-first.** Feature work begins by copying
   `projects/<name>/docs/specs/template/` and completing `spec.md` → `plan.md`
   → `tasks.md` in order (root Article V).

## Practical flow for an external contribution

1. Open an issue (or a WIP-item proposal) describing the idea.
2. For WIP collaboration: add your claim file, then your contribution file,
   per `wip/COLLABORATION.md`.
3. For direct fixes (typos, broken links, structural defects): a focused PR
   with a scoped edit set; `verify-layout.sh` must still pass (CI runs it as
   advisory feedback).
4. Maintainer review applies the constitutions; approval authority for
   promotions and implementations rests solely with the Workspace Maintainer's
   directing authority (Agent Zero) and is never delegated.

## Licensing

By contributing, you agree your contributions are licensed under the
repository's [Apache License 2.0](LICENSE) (see its Section 5, Submission of
Contributions).
