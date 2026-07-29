---
title: SDD-Core Reset v4 Adapter Comparison
status: implementation-evidence
topic: assistant-adapter-parity
scope: GLOBAL
---

# SDD-Core Reset v4 Adapter Comparison

## Skill mirrors

The six corresponding files under `.claude/skills/` and `.agents/skills/`
are byte-identical:

- `constitution-amendment`
- `conversation-records`
- `governed-change`
- `registry-logging`
- `session-capture`
- `wip-item-bookkeeping`

Observed mismatch count on 2026-07-28: **0**.

## Hook mirrors

`record-mining-reminder.sh` is byte-identical across `.claude/hooks/` and
`.codex/hooks/`.

`skill-reminder.sh` has one intentional adapter difference: the Claude hook
points to `.claude/skills/`, while the Codex hook points to the byte-identical
`.agents/skills/` mirror. Trigger conditions, advisory language, non-blocking
behavior, and authority boundaries are otherwise equivalent.

The settings wrappers differ only because Claude and Codex use their own
repository configuration paths. Both JSON documents parse successfully and
both hooks remain advisory; neither adapter can grant authority.
