# Global Mirror Registry — Agent Instructions

This file is the **mandatory first stop** for any agent — global or per-project — before writing, proposing, or planning code that depends on an external framework. Its job is to route agents to local, offline mirrors of framework source code and documentation held under [`../reference/repos/`](../reference/repos/), so that every framework-facing claim (API names, signatures, config keys, file layouts) is grounded in real files rather than recalled from training data. Consulting this registry before touching framework-dependent code is a hard requirement of the workspace constitution ([`../.specify/memory/constitution.md`](../.specify/memory/constitution.md)); it exists to eliminate hallucinated APIs. Mirrors are plain directories on disk — reading them requires no tools beyond opening files.

Workspace tooling requirements (skills, plugins, conduct rulesets, MCP tools) are declared
separately in [`tooling.md`](tooling.md) — the committed requirement declaration with its
new-machine bootstrap procedure. A declaration row never implies installation; machine
state lives in each machine's `~/.sdd-core-ops/INSTALL-REGISTRY.md`.

---

## 1. Mirror Registry

| Framework | Local Mirror Path | Upstream URL | Pinned Version/Commit | Notes |
|-----------|-------------------|--------------|-----------------------|-------|
| shadcn/ui *(illustrative seed row — mirror not yet cloned)* | `../reference/repos/shadcn/` | https://github.com/shadcn-ui/ui | `9f1a2b3c` (placeholder — update on mirror refresh) | Component registry lives in `apps/www/registry/`; docs in `apps/www/content/docs/`. Read `README.md` first, then the registry source for the specific component before citing any prop or variant. |
| `<framework-name>` | `../reference/repos/<framework-name>/` | `<upstream-repo-url>` | `<commit-hash-or-tag>` | `<entry-point files/docs agents should read first; known caveats>` |

Registry rules:

- One row per mirrored framework. The table above is the single source of truth for what is mirrored globally.
- The **Pinned Version/Commit** column must always reflect the exact commit or tag checked out on disk. If it says "placeholder", the mirror is unverified — treat it as suspect and confirm against the actual files.
- Sub-projects may maintain additional or overriding rows in their own `projects/<name>/knowledge/instructions.md` (see [`../projects/project-a/knowledge/instructions.md`](../projects/project-a/knowledge/instructions.md) for the example sub-project).

## 2. Registering a New Mirror

For developers adding a framework mirror (a one-time human setup step; the SDD workflow itself never requires running any tool):

1. **Obtain the source.** Clone or otherwise copy the framework repository into `reference/repos/<framework-name>/` at the workspace root. This path is git-ignored by design — mirrors stay local to each machine and are never committed.
2. **Pin the version.** Record the exact commit hash (or release tag) of the copy you placed on disk. Do not leave a mirror floating on a moving branch.
3. **Add a registry row.** Duplicate the blank template row in the table above and fill in every column: framework name, local mirror path, upstream URL, and the pinned commit/tag.
4. **Document the entry points.** In the Notes column, name the key files or directories an agent should read first — top-level `README`, API reference docs, type definitions, canonical examples. Good entry-point notes are what make a mirror usable in seconds instead of minutes.
5. **(If project-scoped)** If the mirror is only relevant to one sub-project, place it under `projects/<name>/reference/` and register it in that project's `knowledge/instructions.md` instead of here.

## 3. Lookup Protocol for Agents

> **Lookup order is not load order.** This section defines the MIRROR-LOOKUP precedence
> rule — project registry before global — a constitution Article IV *resolution order*
> applied while working on framework-dependent tasks. It is distinct from, and does not
> compete with, the canonical five-step CONTEXT-LOADING order established in the
> workspace `README.md` (constitutions and registries loaded global-tier-first). Loading
> reads governance top-down; lookups resolve mirrors bottom-up.

Follow these rules **in order** whenever a task involves an external framework:

1. **Check for local overrides first.** When working inside a sub-project (`projects/<name>/`), read that project's `knowledge/instructions.md` before this file. Project-level entries override global ones for that project's scope.
2. **Consult the Mirror Registry** (Section 1, plus any project-level registry) before proposing any framework-dependent code, spec text, or plan step. Never rely on memory of a framework's API.
3. **Ground every claim in mirror files.** When a spec (`spec.md`), plan (`plan.md`), or task list (`tasks.md`) references framework behavior, cite the concrete mirror file path you verified it against — e.g. `reference/repos/shadcn/apps/www/registry/new-york/ui/button.tsx` — not just the framework name.
4. **No mirror? STOP.** If the framework is absent from every applicable registry, do not guess or reconstruct its API. Halt framework-dependent work and record a `[NO MIRROR]` entry in the ambiguities block of the active feature spec (`projects/<name>/docs/specs/<NNN>-<feature>/spec.md`), naming the missing framework and the decision that is blocked. A developer then registers the mirror per Section 2 before work resumes.
5. **Respect the pin.** Verify behavior against the pinned commit listed in the registry, not against newer upstream knowledge. If the pinned version genuinely lacks something the task needs, surface that as a spec ambiguity — do not silently assume a newer API.

## 4. Maintenance

- **Refreshing mirrors.** Update the on-disk copy deliberately (fetch/checkout or re-copy at a chosen release), then immediately update the registry row's pinned commit and re-check the Notes for moved entry-point files. A mirror and its registry row must never disagree.
- **Bumping pinned commits.** Treat a version bump as a change with blast radius: scan active specs and plans that cite the mirror's file paths and confirm those paths and APIs still hold at the new commit before updating the row.
- **Retiring stale entries.** When a framework is dropped from the architecture, delete its registry row and remove the directory under `reference/repos/`. Leave no orphan rows — an entry pointing at a missing or outdated mirror is worse than no entry, because agents will trust it.
- **Auditing.** Periodically confirm each registered path exists and matches its pinned commit. Any row that cannot be verified should be marked with "placeholder" in the Pinned Version/Commit column until re-verified.
