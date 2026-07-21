#!/usr/bin/env bash
# verify-layout.sh — validate the sdd-core SDD workspace structure.
# Prints [OK] / [MISSING] for every required path, a compliance summary,
# then a directory tree visualization.
set -u
cd "$(dirname "$0")" || exit 1

REQUIRED_PATHS=(
  ".gitignore"
  "LICENSE"
  "README.md"
  "verify-layout.sh"
  ".specify/memory/constitution.md"
  "knowledge/instructions.md"
  "docs"
  "docs/proposals"
  "docs/proposals/evidence-based-skill-lifecycle.md"
  "reference"
  "reference/repos"
  "projects"
  "projects/governance-framework/README.md"
  "projects/governance-framework/.specify/memory/constitution.md"
  "projects/governance-framework/docs/specs"
  "projects/governance-framework/docs/specs/template/spec.md"
  "projects/governance-framework/docs/specs/template/plan.md"
  "projects/governance-framework/docs/specs/template/tasks.md"
  "projects/governance-framework/knowledge/instructions.md"
  "projects/governance-framework/reference"
  "projects/governance-framework/.claude/skills/mirror-sync/SKILL.md"
  "projects/governance-framework/.claude/skills/skills-creator/SKILL.md"
  "projects/governance-framework/conversations/SYNC-POLICY.md"
  "projects/governance-framework/conversations"
  "knowledge/tooling.md"
  "conversations"
  "conversations/README.md"
  "conversations/SYNC-POLICY.md"
  "conversations/TEMPLATE.md"
  "wip"
  "wip/README.md"
  "wip/TEMPLATE.md"
  "wip/COLLABORATION.md"
  "wip/_index.md"
  ".claude/skills/conversation-records/SKILL.md"
  ".claude/skills/session-capture/SKILL.md"
  ".claude/skills/governed-change/SKILL.md"
  ".claude/skills/registry-logging/SKILL.md"
  ".claude/hooks/skill-reminder.sh"
  ".claude/hooks/record-mining-reminder.sh"
  ".claude/settings.json"
  "projects/governance-ops/README.md"
  "projects/governance-ops/.specify/memory/constitution.md"
  "projects/governance-ops/docs/specs"
  "projects/governance-ops/docs/specs/template/spec.md"
  "projects/governance-ops/docs/specs/template/plan.md"
  "projects/governance-ops/docs/specs/template/tasks.md"
  "projects/governance-ops/knowledge/instructions.md"
  "projects/governance-ops/reference"
  "projects/governance-ops/conversations"
  "projects/governance-ops/conversations/SYNC-POLICY.md"
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
echo "Verifying collaborative WIP items..."
echo
ITEM_REQUIRED=("README.md" "contributions/README.md" "coordination/README.md" "coordination/claims/README.md" "supporting-materials")
for item in wip/[0-9]*/; do
  [ -d "$item" ] || continue
  name=$(basename "$item")
  for req in "${ITEM_REQUIRED[@]}"; do
    total=$((total + 1))
    if [ -e "$item$req" ]; then
      printf '[OK]      %s%s\n' "$item" "$req"
    else
      printf '[MISSING] %s%s\n' "$item" "$req"
      missing=$((missing + 1))
    fi
  done
  total=$((total + 1))
  if grep -q "^| $name " wip/_index.md 2>/dev/null; then
    printf '[OK]      %s indexed in wip/_index.md\n' "$name"
  else
    printf '[MISSING] %s row in wip/_index.md\n' "$name"
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
