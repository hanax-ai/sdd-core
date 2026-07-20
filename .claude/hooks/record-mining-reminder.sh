#!/usr/bin/env bash
# record-mining-reminder.sh — PostToolUse hook (ADVISORY ONLY).
# When a Write/Edit lands a conversation RECORD (root conversations/ or any
# projects/*/conversations/), inject a pointer to run a skills-creator mining pass.
# Scaffolding files (README, SYNC-POLICY, TEMPLATE, _index, .gitkeep) do not count.
# Never blocks, always exit 0. Advisory trigger aid — NOT mechanical enforcement
# (constitution Article V extension, v1.1.0).

input=$(cat 2>/dev/null)
fp=$(printf '%s' "$input" | grep -o '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1)

# Must be a .md inside a conversations directory (forward slash, single or
# JSON-escaped double backslash all match the [/\\] class).
printf '%s' "$fp" | grep -Eiq 'conversations[/\\][^"]*\.md' || exit 0
# Scaffolding is not a record.
printf '%s' "$fp" | grep -Eiq '(README|SYNC-POLICY|TEMPLATE|_index)\.md' && exit 0

cat <<'JSON'
{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":"ADVISORY: a new conversation record was just written. Consider a skills-creator mining pass over it (.claude/skills/skills-creator + projects/project-a/.claude/skills/skills-creator): identify recurring manual procedures in the record and PROPOSE skill candidates (proposals only — no self-approval; registrations per skills-creator part 4 on maintainer approval)."}}
JSON
exit 0
