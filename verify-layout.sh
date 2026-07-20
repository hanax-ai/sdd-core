#!/usr/bin/env bash
# verify-layout.sh — validate the sdd-core SDD workspace structure.
# Prints [OK] / [MISSING] for every required path, a compliance summary,
# then a directory tree visualization.
set -u
cd "$(dirname "$0")" || exit 1

REQUIRED_PATHS=(
  ".gitignore"
  "README.md"
  "verify-layout.sh"
  ".specify/memory/constitution.md"
  "knowledge/instructions.md"
  "docs"
  "reference"
  "reference/repos"
  "projects"
  "projects/project-a/.specify/memory/constitution.md"
  "projects/project-a/docs/specs"
  "projects/project-a/docs/specs/template/spec.md"
  "projects/project-a/docs/specs/template/plan.md"
  "projects/project-a/docs/specs/template/tasks.md"
  "projects/project-a/knowledge/instructions.md"
  "projects/project-a/reference"
  "projects/project-a/.claude/skills/mirror-sync/SKILL.md"
  "projects/project-a/.claude/skills/skills-creator/SKILL.md"
  "projects/project-a/conversations/SYNC-POLICY.md"
  "projects/project-a/conversations"
  "knowledge/tooling.md"
  "conversations"
  "conversations/README.md"
  "conversations/SYNC-POLICY.md"
  "conversations/TEMPLATE.md"
  ".claude/skills/conversation-records/SKILL.md"
  ".claude/skills/session-capture/SKILL.md"
  "projects/project-b/.specify/memory"
  "projects/project-b/docs/specs"
  "projects/project-b/knowledge"
  "projects/project-b/reference"
)

missing=0
total=${#REQUIRED_PATHS[@]}
echo "Verifying sdd-core workspace layout..."
echo
for p in "${REQUIRED_PATHS[@]}"; do
  if [ -e "$p" ]; then
    printf '[OK]      %s\n' "$p"
  else
    printf '[MISSING] %s\n' "$p"
    missing=$((missing + 1))
  fi
done

echo
if [ "$missing" -eq 0 ]; then
  echo "RESULT: 100% compliance — all $total required paths present."
else
  echo "RESULT: $missing of $total required paths missing."
fi

echo
echo "Directory tree:"
if command -v tree >/dev/null 2>&1; then
  tree -a -I '.git' .
else
  find . -path ./.git -prune -o -print | sort \
    | sed -e 's|^\./||' -e '/^\.$/d' -e 's|[^/]*/|    |g'
fi

[ "$missing" -eq 0 ]
