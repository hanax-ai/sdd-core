#!/usr/bin/env bash
# commit-governed.sh — deterministic tail for a governed change.
# Stages EXACTLY the declared edit set, commits via -F (immune to shell
# quote-splitting defects), then re-runs verify-layout.
#
# Usage: commit-governed.sh <message-file> <path> [<path>...]
set -euo pipefail

msg="${1:-}"; shift || true
[ -n "$msg" ] && [ -f "$msg" ] || { echo "FAIL: message file missing"; exit 1; }
[ "$#" -ge 1 ] || { echo "FAIL: declare the edit set (paths to stage)"; exit 1; }

cd "$(git rev-parse --show-toplevel)"

# Precondition: nothing already staged (no mixing with unrelated work).
git diff --cached --quiet || { echo "FAIL: index already has staged changes"; exit 1; }

git add -- "$@"
echo "Staged (declared edit set):"
git diff --cached --name-status

git commit -F "$msg"

echo
echo "Post-commit tree:"
git status --short

if bash ./verify-layout.sh >/dev/null 2>&1; then
  echo "OK: commit $(git rev-parse --short HEAD); verify-layout green."
else
  echo "WARN: verify-layout FAILING after commit $(git rev-parse --short HEAD) — investigate before pushing."
  exit 2
fi
