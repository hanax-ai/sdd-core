#!/usr/bin/env bash
# Advisory only. Fires for a record directly under root conversations/.
# It never grants authority and never writes an adopter repository.

input=$(cat 2>/dev/null)
json_python=""
if command -v python >/dev/null 2>&1; then
  json_python=python
elif command -v python3 >/dev/null 2>&1; then
  json_python=python3
else
  exit 0
fi
fp=$(
  printf '%s' "$input" |
    "$json_python" -c '
import json
import sys

try:
    payload = json.load(sys.stdin)
except (json.JSONDecodeError, UnicodeDecodeError):
    raise SystemExit(1)

value = payload.get("file_path") if isinstance(payload, dict) else None
if not isinstance(value, str) and isinstance(payload, dict):
    tool_input = payload.get("tool_input")
    if isinstance(tool_input, dict):
        value = tool_input.get("file_path")
if not isinstance(value, str) or not value:
    raise SystemExit(1)
sys.stdout.write(value)
'
) || exit 0
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
case "$fp" in
  /*) ;;
  *) fp="$root/$fp" ;;
esac
command -v realpath >/dev/null 2>&1 || exit 0
fp=$(realpath -m -- "$fp" 2>/dev/null) || exit 0
parent=${fp%/*}
base=${fp##*/}
case "$parent" in
  "$root/conversations") ;;
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
