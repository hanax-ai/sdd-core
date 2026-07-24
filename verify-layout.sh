#!/usr/bin/env bash
# verify-layout.sh — validate the sdd-core SDD workspace structure.
# Prints [OK] / [MISSING] for every required path, a compliance summary,
# then a directory tree visualization.
set -u
cd "$(dirname "$0")" || exit 1

REQUIRED_PATHS=(
  ".gitignore"
  "LICENSE"
  "AGENTS.md"
  "README.md"
  "verify-layout.sh"
  ".specify/memory/constitution.md"
  "knowledge/instructions.md"
  "docs"
  "docs/proposals"
  "docs/proposals/evidence-based-skill-lifecycle.md"
  "docs/deliverables-index.md"
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
  "projects/governance-framework/standards/deliverables-ownership.md"
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
  ".claude/skills/governed-change/scripts/commit-governed.sh"
  ".claude/skills/registry-logging/SKILL.md"
  ".claude/skills/wip-item-bookkeeping/SKILL.md"
  ".claude/skills/constitution-amendment/SKILL.md"
  ".claude/hooks/skill-reminder.sh"
  ".claude/hooks/record-mining-reminder.sh"
  ".claude/settings.json"
  ".agents/skills/conversation-records/SKILL.md"
  ".agents/skills/session-capture/SKILL.md"
  ".agents/skills/governed-change/SKILL.md"
  ".agents/skills/governed-change/scripts/commit-governed.sh"
  ".agents/skills/registry-logging/SKILL.md"
  ".agents/skills/wip-item-bookkeeping/SKILL.md"
  ".agents/skills/constitution-amendment/SKILL.md"
  ".codex/hooks.json"
  ".codex/hooks/skill-reminder.sh"
  ".codex/hooks/record-mining-reminder.sh"
  ".github/workflows/verify-layout.yml"
  ".github/pull_request_template.md"
  ".github/ISSUE_TEMPLATE/bug-report.md"
  ".github/ISSUE_TEMPLATE/idea.md"
  "CONTRIBUTING.md"
  "SECURITY.md"
  "CHANGELOG.md"
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
  "projects/governance-ops/registers/README.md"
  "projects/governance-ops/registers/deliverables.md"
  "projects/governance-ops/records/README.md"
  "projects/governance-ops/records/templates/README.md"
  "projects/governance-ops/records/templates/control-execution.template.md"
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
echo "Verifying constitutional invariants (content checks)..."
echo
ROOT_CONST=".specify/memory/constitution.md"
FW_CONST="projects/governance-framework/.specify/memory/constitution.md"
OPS_CONST="projects/governance-ops/.specify/memory/constitution.md"

check_content() {
  # $1 = file, $2 = grep -E pattern, $3 = label
  total=$((total + 1))
  if [ -f "$1" ] && grep -Eq "$2" "$1"; then
    printf '[OK]      %s: %s\n' "$1" "$3"
  else
    printf '[MISSING] %s: %s\n' "$1" "$3"
    missing=$((missing + 1))
  fi
}

# Version footers (pattern, not pinned number — amendments must keep the shape)
for c in "$ROOT_CONST" "$FW_CONST" "$OPS_CONST"; do
  check_content "$c" '^\*\*Version\*\*: [0-9]+\.[0-9]+\.[0-9]+ \| \*\*Ratified\*\*: [0-9]{4}-[0-9]{2}-[0-9]{2} \| \*\*Last Amended\*\*: [0-9]{4}-[0-9]{2}-[0-9]{2}$' 'SemVer version footer'
done
# Root GLOBAL supremacy + non-delegable gates + inheritance strictness (both projects)
for c in "$FW_CONST" "$OPS_CONST"; do
  check_content "$c" 'Root GLOBAL supremacy' 'Root GLOBAL supremacy statement'
  check_content "$c" 'cannot be delegated' 'non-delegable gate authority'
  check_content "$c" 'stricter rule' 'stricter-rule inheritance clause'
  check_content "$c" '\| Root constitution, WIP policy, tooling declaration, workspace proposals \| Root GLOBAL \|' 'three-way routing table sentinel row'
done
# Layer boundary tests
check_content "$FW_CONST" 'Definitional-Artifact Test' 'framework boundary test article'
check_content "$OPS_CONST" 'Execution-Evidence Test' 'ops boundary test article'
check_content "$OPS_CONST" 'Evidence classes' 'evidence-class definitions'
check_content "$OPS_CONST" 'One-way dependency contract' 'one-way dependency contract'
# Root constitution load-bearing articles
check_content "$ROOT_CONST" 'Isolated Agent Scopes' 'Article III present'
check_content "$ROOT_CONST" 'Mirror-Check Mandate' 'Article IV present'
# Gate directive formats (wip policy)
check_content "wip/README.md" 'Approved for promotion:' 'Gate 1 directive format'
check_content "wip/README.md" 'Approved for implementation:' 'Gate 2 directive format'
# Paired deliverables model wired both ways
check_content "projects/governance-ops/registers/deliverables.md" 'ST-001' 'register cites its standard'
check_content "projects/governance-framework/standards/deliverables-ownership.md" 'registers/deliverables\.md' 'standard cites its register'
# Portability adapter smoke checks (item 7): precedence beneath governance + canonical order anchor
check_content "AGENTS.md" 'BENEATH the governance' 'adapter precedence statement'
check_content "AGENTS.md" 'canonical five-step CONTEXT-LOADING order' 'adapter cites canonical load order'
check_content "AGENTS.md" '\.specify/memory/constitution\.md' 'adapter points to root constitution'

echo
if [ "$missing" -eq 0 ]; then
  echo "RESULT: 100% compliance — all $total required checks pass (paths + content invariants)."
else
  echo "RESULT: $missing of $total required checks failing."
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
