#!/usr/bin/env bash
# skill-reminder.sh — UserPromptSubmit hook (ADVISORY ONLY).
# Injects a one-line pointer to the applicable governance skill when the prompt
# touches commit/registry work. Never blocks, never fails the prompt (always exit 0).
# This is a trigger aid, NOT mechanical enforcement — enforcement remains ADVISORY
# per the constitution's Article V extension (v1.1.0).

input=$(cat 2>/dev/null)
shopt -s nocasematch
out=""

if [[ $input =~ (commit|merge|atomic|governed[-\ ]change|clean[-\ ]tree) ]]; then
  out+="ADVISORY: governed-change skill applies — follow .claude/skills/governed-change/SKILL.md (clean tree, scoped edit set, one atomic commit, ownership logging, verify-layout, done-when evidence). "
fi

if [[ $input =~ (install[-\ ]registry|event[-\ ]log|inventory[-\ ]row|ownership[-\ ]manifest|registry[-\ ]logging|hash-object) ]]; then
  out+="ADVISORY: registry-logging skill applies — follow .claude/skills/registry-logging/SKILL.md (UTC timestamps, append-only Event Log, hash-object ownership entries, no secrets)."
fi

[ -n "$out" ] && printf '%s\n' "$out"
exit 0
