---
name: mirror-sync
description: Use before citing, reading, or planning against any external framework or reference document in this workspace — "check the mirror", "is this framework mirrored", "ground this API claim", "load the mirrored metadata", or any task that depends on external framework/source facts. Operationalizes constitution Article IV — routes lookups through the mirror registries and manifests, and stops on validation failures instead of guessing.
---

# Mirror Sync — Mirror Registry Engine

Operationalizes constitution Article IV (grounding and pin discipline) using EXISTING
mechanisms only — the registry tables and `_index.md` manifests that already exist. No new
metadata format is introduced by this skill; the registries remain normative, this skill is
an implementation aid.

## 1. Targets

Exactly two mirror locations are recognized by the constitution and registries:

- **Global:** `reference/repos/` (workspace root) — framework source/doc mirrors shared by
  all projects.
- **Project:** `projects/governance-framework/reference/` — project-specific mirrors (e.g.
  pinned exports of external standards or framework documents).

No other directory is a mirror. Never treat ad-hoc clones, node_modules, or files found
elsewhere on disk as grounding sources.

## 2. Sources of truth

Resolution order per the Lookup Protocol (global playbook §3):

1. **Project overrides first:** the Markdown registry table in
   `projects/governance-framework/knowledge/instructions.md` §4 (Local Mirror Overrides) — within
   this project, its rows override same-named global rows.
2. **Global registry:** the Mirror Registry table in `knowledge/instructions.md` §1 —
   fallback when no project row matches.
3. **Per-document manifests:** the `_index.md` manifest mandated by playbook §2 for every
   sliced document — the only authority on what slices exist and what each covers.

These tables and manifests are the ONLY sources of truth. A mirror directory on disk that
appears in no registry row does not exist for grounding purposes.

## 3. Slicing

- **Manifest-first:** always read the sliced document's `_index.md` before any slice.
- **Task-relevant slices only:** load exactly the slices whose scope notes match the task
  — never the full slice set by default, never an entire mirrored repository.
- **Existing regime only:** slices follow playbook §2 — `<doc-name>.part-NN.md`
  zero-padded ordered naming, ~400-line/~4k-token cap per slice, split at natural
  boundaries. This skill introduces NO parallel slicing regime; if material needs
  slicing, apply playbook §2 as written.

## 4. Validation gates — report and stop, never guess

Run these checks during every lookup. On failure: report precisely, stop
framework-dependent work. Never reconstruct an API from memory, never silently continue.

- **(a) Framework absent from every applicable registry** (project §4 then global §1):
  record a `[NO MIRROR]` entry in the ambiguities block of the active feature spec
  (`projects/governance-framework/docs/specs/<NNN>-<feature>/spec.md`), naming the missing framework
  and the blocked decision. If no feature folder exists yet, report to the operator and
  log to the machine Install Registry's Event Log (`~/.sdd-core-ops/INSTALL-REGISTRY.md`)
  until a spec exists to carry the entry.
- **(b) Registry row whose Local Mirror Path is missing on disk:** the row is unusable —
  report the row and the missing path; do not cite the mirror; do not fall back to
  memory.
- **(c) Pin column reading `placeholder`:** the mirror is unverified — treat it as
  suspect; report it; require re-verification (registry §4 Maintenance) before any claim
  is grounded on it.
- **(d) Sliced document missing `_index.md`:** the document is unreadable under
  manifest-first rules — report it; require the manifest (playbook §2 template) before
  consuming any slice.
- **(e) Manifest listing nonexistent slices:** the manifest and disk disagree — report
  the phantom slice names; trust neither until reconciled; do not read the remaining
  slices as if the manifest were sound.

Failure of any gate is a data-integrity signal about the registries themselves — surface
it to the maintainer; fixing rows/manifests is a human step, not something this skill
does silently.
