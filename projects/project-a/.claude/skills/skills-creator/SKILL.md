---
name: skills-creator
description: Use when authoring a new workspace skill, converting guidance into a skill, or deciding where a skill belongs — "create a skill", "write a SKILL.md", "should this be a skill", "where does this skill live". Covers required frontmatter, trigger-oriented descriptions, machine-vs-project tier placement, and the mandatory governance registrations.
---

# Skills Creator

Instructions for authoring new skills in this workspace. Follow all four parts; the
governance registrations in part 4 are not optional.

## 1. Required frontmatter

Every SKILL.md starts with YAML frontmatter containing exactly the required keys:

```yaml
---
name: kebab-case-name
description: One paragraph. What the skill does AND when to invoke it.
---
```

- `name`: kebab-case, unique across every tier on the machine (check the machine's
  Install Registry and existing skill listings before choosing — name shadowing between
  tiers is a defect, see `conversation-sync` for the pattern of one global skill +
  per-project policy files instead of duplicate skills).
- `description`: the loader shows this to the model at trigger time — it is the trigger,
  see part 2.
- Invalid or missing frontmatter → the skill silently fails to load. Verify after
  writing: the skill must appear in a fresh session's skill listing.

## 2. Description-as-trigger guidance

The `description` decides whether the skill fires. Write it as: "Use when …" followed by
the concrete task phrasings a user would actually type, in quotes, then a one-line scope
statement.

- Name the tasks, not the topic: "Use when asked to record a decision across sessions"
  beats "Manages conversation state".
- Include 3–5 quoted example phrasings ("create a skill", "write a SKILL.md").
- State what the skill governs so the model knows to defer to it once loaded.
- Do NOT put rules in the description — rules live in the body; the description only has
  to get the skill opened.

## 3. Tier placement rules

Two tiers exist for skills on this machine:

- **Machine tier** (`~/.claude/skills/<name>/`): conduct and cross-project behavior that
  must apply in EVERY local session regardless of cwd. Not committed; per-machine;
  affects non-SDD projects too — placement here needs the blast-radius acknowledgment
  recorded in the Install Registry.
- **Project tier** (`projects/<name>/.claude/skills/<name>/`): workspace-native,
  committed, template-shareable. Loads when the session works with files under that
  project (nested directory-scoped skills; sessions needing them immediately should
  start inside the project directory).

Decision rule: if the skill's rules mention project paths, registries, or artifacts, it
belongs in the project tier. If it must constrain sessions that never touch this repo,
machine tier. When both seem true, split: one global skill + a per-project policy file
(the `conversation-sync` pattern) — never two skills with one name.

## 4. Mandatory governance registrations

Anything new — skill, plugin, policy file, MCP tool — requires BOTH registrations before
it is considered installed:

1. **Workspace requirement declaration:** add a row to `knowledge/tooling.md` (committed,
   created by Goal 8 of the canonical plan; 8-column schema — follow the header block in
   that file). A declaration row states what the workspace requires; it never implies the
   item is installed on any machine.
2. **Machine Install Registry:** add an Inventory row (and Event Log entries at write
   time: artifact paths + `git hash-object` hashes) to `~/.sdd-core-ops/INSTALL-REGISTRY.md`
   on each machine where the item is installed. Only a `complete` row here, with a review
   record, means installed.

External sources additionally require: maintainer-approved source entry, pinned
commit/version, content review before install, and post-install verification — per the
canonical plan's Goal 2 pattern. No agent self-approves.
