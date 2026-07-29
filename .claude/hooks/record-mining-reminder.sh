#!/usr/bin/env bash
# Advisory only. Fires for a record directly under root conversations/.
# It never grants authority and never writes an adopter repository.

input=$(cat 2>/dev/null)
fp=$(
  printf '%s' "$input" |
    sed -n 's/.*"file_path"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' |
    head -1
)
[ -n "$fp" ] || exit 0
fp=${fp//\\//}
case "$fp" in
  [A-Za-z]:/*)
    command -v cygpath >/dev/null 2>&1 || exit 0
    fp=$(cygpath -u "$fp")
    ;;
esac
root=$(git rev-parse --show-toplevel 2>/dev/null) || exit 0
root=$(cd "$root" 2>/dev/null && pwd -P) || exit 0
parent=${fp%/*}
base=${fp##*/}
case "$parent" in
  conversations | "$root/conversations") ;;
  *) exit 0 ;;
esac
case "$base" in
  README.md | SYNC-POLICY.md | TEMPLATE.md | _index.md) exit 0 ;;
esac
printf '%s' "$base" | grep -Eq '^[^/]+\.md$' || exit 0

cat <<'JSON'
{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":"ADVISORY: a root SDD-Core conversation record was written. Consider a skills-creator mining pass using governance/framework/skills/skills-creator/SKILL.md. Propose candidates only; no adapter or skill can self-approve authority."}}
JSON
exit 0
