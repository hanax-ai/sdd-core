#!/usr/bin/env bash
# Advisory only. Fires for a record directly under root conversations/.
# It never grants authority and never writes an adopter repository.

input=$(cat 2>/dev/null)
fp=$(printf '%s' "$input" | grep -o '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1)
printf '%s' "$fp" | grep -Eiq 'conversations[/\\][^/\\"]+\.md' || exit 0
printf '%s' "$fp" | grep -Eiq '(README|SYNC-POLICY|TEMPLATE|_index)\.md' && exit 0

cat <<'JSON'
{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":"ADVISORY: a root SDD-Core conversation record was written. Consider a skills-creator mining pass using governance/framework/skills/skills-creator/SKILL.md. Propose candidates only; no adapter or skill can self-approve authority."}}
JSON
exit 0
