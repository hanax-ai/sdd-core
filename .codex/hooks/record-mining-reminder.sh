#!/usr/bin/env bash
# record-mining-reminder.sh — PostToolUse hook (ADVISORY ONLY).
# When a Write/Edit lands a conversation RECORD (root conversations/ or any
# projects/<name>/conversations/), inject a pointer to run a skills-creator mining pass.
# Scaffolding files (README, SYNC-POLICY, TEMPLATE, _index, .gitkeep) do not count.
# Never blocks, always exit 0. Advisory trigger aid — NOT mechanical enforcement
# (constitution Article V extension, v1.1.0).

input=$(cat 2>/dev/null)
fpv=$(printf '%s' "$input" | grep -o '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 |
      sed -E 's/.*"file_path"[[:space:]]*:[[:space:]]*"([^"]*)".*/\1/')
[ -n "$fpv" ] || exit 0

root=$(git rev-parse --show-toplevel 2>/dev/null) || exit 0

# Normalize separators (JSON-escaped backslashes arrive doubled) and compare
# case-insensitively (Windows paths).
shopt -s nocasematch
norm=$(printf '%s' "$fpv" | tr '\\' '/' | sed 's#//*#/#g')
rootn=$(printf '%s' "$root" | tr '\\' '/' | sed 's#//*#/#g')

# Prefix test via [[ ]] so nocasematch applies (parameter-expansion stripping is
# always case-sensitive); then slice rel by length.
[[ $norm == "$rootn"/* ]] || exit 0  # not under this repo root
rel="${norm:$(( ${#rootn} + 1 ))}"

# Exactly the documented tiers, filename directly inside conversations/ and
# ending in .md: conversations/<file>.md or projects/<name>/conversations/<file>.md
f=""
case "$rel" in
  conversations/*.md)
    f="${rel#conversations/}"
    ;;
  projects/*/conversations/*.md)
    mid="${rel#projects/}"
    rest="${mid#*/}"
    case "$rest" in
      conversations/*.md) f="${rest#conversations/}" ;;
      *) exit 0 ;;
    esac
    ;;
  *) exit 0 ;;
esac
case "$f" in */*) exit 0 ;; esac  # no nested directories — records sit directly in the tier

# Scaffolding is not a record — exact filenames only (nocasematch keeps it case-robust).
case "$f" in
  README.md|SYNC-POLICY.md|TEMPLATE.md|_index.md) exit 0 ;;
esac

cat <<'JSON'
{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":"ADVISORY: a new conversation record was just written. Consider a skills-creator mining pass over it (projects/governance-framework/.claude/skills/skills-creator): identify recurring manual procedures in the record and PROPOSE skill candidates (proposals only — no self-approval; registrations per skills-creator part 4 on maintainer approval)."}}
JSON
exit 0
