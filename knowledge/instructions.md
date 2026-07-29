# Global Grounding Registry — Agent Instructions

This file is the **mandatory first stop** for any agent — GLOBAL, internal-domain, or adopter-facing — before writing, proposing, or planning code that depends on an external framework. It is this repository's GLOBAL mechanism implementing root constitution Article IV (Authoritative-Source Grounding): the registry routes agents to registered grounding sources — this workspace's chosen mechanism is local, offline mirrors of framework source code and documentation held under [`../reference/repos/`](../reference/repos/) — so that every framework-facing claim (API names, signatures, config keys, file layouts) is grounded in real files at their pins rather than recalled from training data. Consulting this registry before touching framework-dependent work is a hard requirement of the workspace constitution ([`../.specify/memory/constitution.md`](../.specify/memory/constitution.md)); it exists to eliminate hallucinated APIs. Mirrors are plain directories on disk — reading them requires no tools beyond opening files.

Workspace tooling requirements (skills, plugins, conduct rulesets, MCP tools) are declared
separately in [`tooling.md`](tooling.md) — the committed requirement declaration with its
new-machine bootstrap procedure. A declaration row never implies installation; machine
state lives in each machine's `~/.sdd-core-ops/INSTALL-REGISTRY.md`. Workspace-root
skills are reliably discovered only by sessions started inside the repository — start
governance-work sessions in the repo root (README, activation note).

**WIP routing and approval gate:** early-stage ideas live in the root
[`../wip/`](../wip/) directory and are NON-AUTHORITATIVE — nothing there is a spec,
decision, plan, or authorization, **regardless of being committed, reviewed, or merged
on GitHub**. WIP items are Git-tracked and collaborative: root-scoped contributors work
under the protocol in [`../wip/COLLABORATION.md`](../wip/COLLABORATION.md) (claims,
contributor-owned files, synthesis-lead integration); internal-domain agents read only
(Article III). Agents may explore and refine WIP content on request but MUST NOT
implement, install, promote, or modify authoritative artifacts from it without Agent
Zero's explicit, item-and-action-specific approvals defined in
[`../wip/README.md`](../wip/README.md): Gate 1 (`Approved for promotion: <item> →
<target>`) authorizes promotion into the routed formal artifact (feature spec,
workspace proposal, amendment procedure, or governed tooling workflow); Gate 2
(`Approved for implementation: <spec>`) authorizes execution. Requests to implement
unapproved WIP content get a hard stop and an approval request. WIP never bypasses
this registry, the constitution, or the spec-first lifecycle.

---

## 1. Grounding Registry (local-mirror mechanism)

| Framework | Local Mirror Path | Upstream URL | Pinned Version/Commit | Archive SHA-256 | Notes |
|-----------|-------------------|--------------|-----------------------|----------------|-------|
| JSON Schema draft 2020-12 | `../reference/repos/json-schema-spec/` | https://github.com/json-schema-org/json-schema-spec | `601a66c8b0f25246bf0e1fb488c5b5f030a79b72` (`2020-12`) | `298f0ccd249b910a2d129bc07408a04b5aa0c6de6e893cff93bd24475b66a6a9` | Read `README.md`, `schema.json`, `jsonschema-core.xml`, and `jsonschema-validation.xml`. Digest is for `git archive --format=tar HEAD`. |
| python-jsonschema | `../reference/repos/python-jsonschema/` | https://github.com/python-jsonschema/jsonschema | `a7277432b0f7bcd0551f6e589d30457017125df4` (`v4.26.0`) | `801bcb60dd3c06ac311609bd69391534938c8473453e505e0aaf491c1b3fa75b` | Read `README.rst`, `pyproject.toml`, and `jsonschema/validators.py`. Package pin: `jsonschema==4.26.0`. Digest is for `git archive --format=tar HEAD`. |
| PyYAML | `../reference/repos/pyyaml/` | https://github.com/yaml/pyyaml | `49790e73684bebad1df05ef8d828fa12f685bffb` (`6.0.3`) | `a0651ba0c9bb655ac7dceb399672b2fcec1d9b789e0d174dbf29e1a5bc923b09` | Read `README.md`, `setup.py`, and `lib/yaml/__init__.py`. Package pin: `PyYAML==6.0.3`. Digest is for `git archive --format=tar HEAD`. |
| shadcn/ui *(illustrative seed row — mirror not yet cloned)* | `../reference/repos/shadcn/` | https://github.com/shadcn-ui/ui | `9f1a2b3c` (placeholder — update on mirror refresh) | `placeholder` | Component registry lives in `apps/www/registry/`; docs in `apps/www/content/docs/`. Read `README.md` first, then the registry source for the specific component before citing any prop or variant. |
| `<framework-name>` | `../reference/repos/<framework-name>/` | `<upstream-repo-url>` | `<commit-hash-or-tag>` | `<git-archive-sha256>` | `<entry-point files/docs agents should read first; known caveats>` |

Registry rules:

- One row per mirrored framework. The table above is the single source of truth for what is mirrored globally.
- The **Pinned Version/Commit** column must always reflect the exact commit or tag checked out on disk. The **Archive SHA-256** must match `git archive --format=tar HEAD`. If either says "placeholder", the mirror is unverified — treat it as suspect and confirm against the actual files.
- Internal domains may maintain narrower rows in
  [`../governance/framework/knowledge/instructions.md`](../governance/framework/knowledge/instructions.md)
  or
  [`../governance/operations/knowledge/instructions.md`](../governance/operations/knowledge/instructions.md).
  Adopter repositories own their separate grounding registries.

## 2. Registering a New Mirror

For developers adding a framework mirror (a one-time human setup step; the SDD workflow itself never requires running any tool):

1. **Obtain the source.** Clone or otherwise copy the framework repository into `reference/repos/<framework-name>/` at the repository root. This path is git-ignored by design — mirrors stay local to each machine and are never committed.
2. **Pin the version.** Record the exact commit hash (or release tag) of the copy you placed on disk. Do not leave a mirror floating on a moving branch.
3. **Add a registry row.** Duplicate the blank template row in the table above and fill in every column: framework name, local mirror path, upstream URL, pinned commit/tag, archive SHA-256, and notes.
4. **Document the entry points.** In the Notes column, name the key files or directories an agent should read first — top-level `README`, API reference docs, type definitions, canonical examples. Good entry-point notes are what make a mirror usable in seconds instead of minutes.
5. **(If internal-domain scoped)** Register a narrower source in that domain's
   `knowledge/instructions.md`. Adopter-specific sources remain in the adopter
   repository; SDD-Core does not mirror them as project state.

## 3. Lookup Protocol for Agents

> **Lookup and load order:** global -> applicable internal domain -> adopter.
> A narrower source may refine the scope of a broader source but may never
> override GLOBAL authority. Conflicting identities, pins, digests, or rules
> are a stop condition, not an override.

Follow these rules **in order** whenever a task involves an external framework:

1. **Consult this GLOBAL registry first.** Never rely on memory of a
   framework's API.
2. **Check the applicable internal-domain registry next.** A domain row may
   refine the global row for domain scope but cannot replace or contradict its
   authority, identity, pin, or digest.
3. **Check the adopter registry last, when operating in an adopter.** Adopter
   sources may refine adopter-local use only and cannot override GLOBAL or
   domain governance.
4. **Ground every claim in mirror files.** When a spec (`spec.md`), plan
   (`plan.md`), or task list (`tasks.md`) references framework behavior, cite
   the concrete mirror file path you verified against — e.g.
   `reference/repos/shadcn/apps/www/registry/new-york/ui/button.tsx` — not just
   the framework name.
5. **No mirror? STOP.** If the framework is absent from every applicable
   registry, do not guess or reconstruct its API. Record `[NO MIRROR]` in the
   active specification under `docs/specs/` or the applicable
   `governance/<domain>/docs/specs/` path, naming the blocked decision.
   If no active feature specification exists, report the blocked decision to
   the operator and preserve the existing machine Install Registry Event Log
   boundary by recording only a blocked event there until a specification
   exists. That event grants no installation, tooling, mutation, or approval
   authority and cannot substitute for the missing specification.
6. **Respect the pin.** Verify behavior against the pinned commit listed in
   the registry, not against newer upstream knowledge. If the pinned version
   genuinely lacks something the task needs, surface that as a spec ambiguity
   — do not silently assume a newer API.

## 4. Maintenance

- **Refreshing mirrors.** Update the on-disk copy deliberately (fetch/checkout or re-copy at a chosen release), then immediately update the registry row's pinned commit and re-check the Notes for moved entry-point files. A mirror and its registry row must never disagree.
- **Bumping pinned commits.** Treat a version bump as a change with blast radius: scan active specs and plans that cite the mirror's file paths and confirm those paths and APIs still hold at the new commit before updating the row.
- **Retiring stale entries.** When a framework is dropped from the architecture, delete its registry row and remove the directory under `reference/repos/`. Leave no orphan rows — an entry pointing at a missing or outdated mirror is worse than no entry, because agents will trust it.
- **Auditing.** Periodically confirm each registered path exists and matches its pinned commit. Any row that cannot be verified should be marked with "placeholder" in the Pinned Version/Commit column until re-verified.
