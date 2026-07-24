#!/usr/bin/env bash
# commit-governed.sh — deterministic tail for a governed change.
# Enforces the governed-change invariants: the tree may hold ONLY the
# declared edit set, verify-layout runs BEFORE the commit, staging is
# EXACTLY the declared set, the commit is made via -F (immune to shell
# quote-splitting defects), and afterward the committed path set and a
# clean tree are asserted — not just printed.
#
# Usage: commit-governed.sh <message-file> <path> [<path>...]
set -euo pipefail

msg="${1:-}"; shift || true
[ -n "$msg" ] && [ -f "$msg" ] || { echo "FAIL: message file missing"; exit 1; }
[ "$#" -ge 1 ] || { echo "FAIL: declare the edit set (paths to stage)"; exit 1; }

# Resolve the message file to an absolute path BEFORE cd-ing to the repo root,
# so a relative path given from a subdirectory still resolves at commit time.
msg="$(cd "$(dirname -- "$msg")" && pwd)/$(basename -- "$msg")"
[ -f "$msg" ] || { echo "FAIL: message file missing after resolution: $msg"; exit 1; }

cd "$(git rev-parse --show-toplevel)"

declared=("$@")

# True iff $1 is one of, or lies under, the declared paths.
in_declared_set() {
  local p="$1" d
  for d in "${declared[@]}"; do
    d="${d%/}"
    case "$p" in "$d"|"$d"/*) return 0 ;; esac
  done
  return 1
}

# Precondition: nothing already staged (no mixing with unrelated work).
git diff --cached --quiet || { echo "FAIL: index already has staged changes"; exit 1; }

# Precondition: every dirty path lies inside the declared edit set — a
# governed change starts from a tree clean of everything but this change.
while IFS= read -r line; do
  [ -n "$line" ] || continue
  p="${line:3}"; p="${p##* -> }"; p="${p#\"}"; p="${p%\"}"
  in_declared_set "$p" || { echo "FAIL: dirty path outside declared edit set: $p"; exit 1; }
done < <(git -c core.quotePath=false status --porcelain -uall)

# Verify BEFORE committing — the tree now contains exactly the change.
bash ./verify-layout.sh || { echo "FAIL: verify-layout failing pre-commit — fix before committing"; exit 1; }

git add -- "$@"
echo "Staged (declared edit set):"
git diff --cached --name-status

git commit -F "$msg"

# Postcondition: the commit touches only declared paths.
while IFS= read -r p; do
  [ -n "$p" ] || continue
  in_declared_set "$p" || { echo "FAIL: commit contains undeclared path: $p"; exit 1; }
done < <(git -c core.quotePath=false diff-tree --no-commit-id --name-only -r HEAD)

# Postcondition: clean tree after the commit.
test -z "$(git status --short)" || {
  echo "FAIL: working tree is not clean after commit"
  git status --short
  exit 1
}

echo "OK: commit $(git rev-parse --short HEAD); committed paths:"
git -c core.quotePath=false diff-tree --no-commit-id --name-only -r HEAD
