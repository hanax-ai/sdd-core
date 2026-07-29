#!/usr/bin/env bash
# Deterministic SDD-Core v4 structure and contract verifier.
set -u
cd "$(dirname "$0")" || exit 1

REQUIRED_PATHS=(
  ".gitignore"
  "LICENSE"
  "AGENTS.md"
  "README.md"
  "CONTRIBUTING.md"
  "SECURITY.md"
  "CHANGELOG.md"
  ".specify/memory/constitution.md"
  "knowledge/instructions.md"
  "knowledge/tooling.md"
  "conversations/README.md"
  "conversations/SYNC-POLICY.md"
  "conversations/TEMPLATE.md"
  "wip/README.md"
  "wip/TEMPLATE.md"
  "wip/COLLABORATION.md"
  "wip/_index.md"
  "governance/framework/README.md"
  "governance/framework/constitution.md"
  "governance/framework/ownership.md"
  "governance/framework/docs/specs/template/spec.md"
  "governance/framework/docs/specs/template/plan.md"
  "governance/framework/docs/specs/template/tasks.md"
  "governance/framework/docs/specs/template-software/spec.md"
  "governance/framework/docs/specs/template-software/plan.md"
  "governance/framework/docs/specs/template-software/tasks.md"
  "governance/framework/knowledge/instructions.md"
  "governance/framework/standards/deliverables-ownership.md"
  "governance/framework/skills/mirror-sync/SKILL.md"
  "governance/framework/skills/skills-creator/SKILL.md"
  "governance/operations/README.md"
  "governance/operations/constitution.md"
  "governance/operations/ownership.md"
  "governance/operations/docs/specs/template/spec.md"
  "governance/operations/docs/specs/template/plan.md"
  "governance/operations/docs/specs/template/tasks.md"
  "governance/operations/knowledge/instructions.md"
  "governance/operations/records/README.md"
  "governance/operations/records/templates/control-execution.template.md"
  "contracts/adoption/README.md"
  "contracts/adoption/project-adoption.schema.json"
  "contracts/adoption/fixtures/valid"
  "contracts/adoption/fixtures/invalid"
  "contracts/authority/README.md"
  "contracts/authority/mission-envelope.schema.json"
  "contracts/authority/trust-profiles.json"
  "contracts/authority/fixtures/valid"
  "contracts/authority/fixtures/invalid"
  "contracts/evidence/README.md"
  "contracts/evidence/evidence-envelope.schema.json"
  "contracts/evidence/fixtures/valid"
  "contracts/evidence/fixtures/invalid"
  "templates/project/.sdd-core/adoption.yaml"
  "templates/project/.specify/memory/constitution.md"
  "templates/project/conversations/SYNC-POLICY.md"
  "templates/project/knowledge/instructions.md"
  "templates/project/wip/README.md"
  "templates/project/AGENTS.md"
  "templates/project/CLAUDE.md"
  "templates/project/README.md"
  "bootstrap/new-project.md"
  "integrations/fusion-harness/README.md"
  "integrations/fusion-harness/binding.schema.json"
  "integrations/fusion-harness/compatibility.yaml"
  "integrations/fusion-harness/fixtures"
  "integrations/agent-workflow/README.md"
  "integrations/agent-workflow/registration.schema.json"
  "integrations/agent-workflow/status.schema.json"
  "integrations/agent-workflow/fixtures"
  "integrations/ci-cd/README.md"
  "docs/migrations/sdd-core-reset-v4/path-map.yaml"
  "docs/migrations/sdd-core-reset-v4/artifact-inventory.md"
  "docs/migrations/sdd-core-reset-v4/validation-catalog.md"
  "docs/migrations/sdd-core-reset-v4/adapter-comparison.md"
  "docs/migrations/sdd-core-reset-v4/migration-evidence.md"
  "docs/migrations/sdd-core-reset-v4/rollback.md"
  "docs/specs/001-sdd-core-reset/records/implementation-authorization.md"
  "requirements-validation.txt"
  "scripts/validate-contracts.py"
  ".claude/settings.json"
  ".codex/hooks.json"
  ".github/workflows/verify-layout.yml"
  ".github/pull_request_template.md"
  ".github/ISSUE_TEMPLATE/bug-report.md"
  ".github/ISSUE_TEMPLATE/idea.md"
)

missing=0
total=0

pass_check() {
  total=$((total + 1))
  printf '[OK]      %s\n' "$1"
}

fail_check() {
  total=$((total + 1))
  missing=$((missing + 1))
  printf '[FAIL]    %s\n' "$1"
}

check_content() {
  if [ -f "$1" ] && grep -Eq "$2" "$1"; then
    pass_check "$1: $3"
  else
    fail_check "$1: $3"
  fi
}

check_absent() {
  if [ -f "$1" ] && ! grep -Eq "$2" "$1"; then
    pass_check "$1: $3"
  else
    fail_check "$1: $3"
  fi
}

echo "Verifying SDD-Core v4 target layout..."
for path in "${REQUIRED_PATHS[@]}"; do
  if [ -e "$path" ]; then
    pass_check "$path"
  else
    fail_check "$path"
  fi
done

echo
echo "Verifying WIP package shape..."
ITEM_REQUIRED=("README.md" "contributions/README.md" "coordination/README.md" "coordination/claims/README.md" "supporting-materials")
for item in wip/[0-9]*/; do
  [ -d "$item" ] || continue
  name=$(basename "$item")
  for required in "${ITEM_REQUIRED[@]}"; do
    if [ -e "$item$required" ]; then
      pass_check "$item$required"
    else
      fail_check "$item$required"
    fi
  done
  if grep -q "^| $name " wip/_index.md 2>/dev/null; then
    pass_check "$name indexed in wip/_index.md"
  else
    fail_check "$name indexed in wip/_index.md"
  fi
done

echo
echo "Verifying migration boundaries..."
if tracked_projects=$(git ls-files projects 2>/dev/null); then
  if [ -z "$tracked_projects" ]; then
    pass_check "no tracked projects/ artifacts"
  else
    fail_check "tracked projects/ artifacts remain"
    printf '%s\n' "$tracked_projects"
  fi
else
  fail_check "Git repository identity is unavailable"
fi

legacy_refs=$(
  grep -RInE 'projects/(governance-framework|governance-ops)' . \
    --exclude-dir=.git --exclude-dir=repos 2>/dev/null \
  | grep -vE '^\./(CHANGELOG\.md|docs/(migrations/|specs/001-sdd-core-reset/|proposals/sdd-core-reset-architecture\.md)|wip/|conversations/)' \
  || true
)
if [ -z "$legacy_refs" ]; then
  pass_check "no live legacy projects/ references"
else
  fail_check "live legacy projects/ references remain"
  printf '%s\n' "$legacy_refs"
fi

echo
echo "Verifying authority and integration sentinels..."
check_content ".specify/memory/constitution.md" '^\*\*Version\*\*: 4\.0\.0 ' "v4 constitution footer"
check_content ".specify/memory/constitution.md" 'GLOBAL' "GLOBAL authority scope"
check_content ".specify/memory/constitution.md" 'FRAMEWORK-DEFINITION' "framework-definition scope"
check_content ".specify/memory/constitution.md" 'OPERATIONAL-GOVERNANCE' "operational-governance scope"
check_content "wip/README.md" 'Approved for promotion:' "exact Gate 1 format"
check_content "wip/README.md" 'Approved for implementation:' "exact Gate 2 format"
check_content "bootstrap/new-project.md" 'AUTHORIZED_MISSION_REQUIRED' "mission-required readiness boundary"
check_content "integrations/fusion-harness/compatibility.yaml" 'readiness: "BLOCKED"' "unavailable Harness is BLOCKED"
check_content "integrations/agent-workflow/README.md" '`DEGRADED`' "bounded degraded mode"
check_content "integrations/ci-cd/README.md" 'explicitly disabled and deferred' "remediation disabled"
check_content "contracts/authority/mission-envelope.schema.json" '"canonicalDigest"' "canonical mission digest required"
check_content "contracts/authority/mission-envelope.schema.json" '"prohibitedActions"' "mission prohibitions required"
check_absent "contracts/authority/mission-envelope.schema.json" '"verified"' "no trusted verification boolean"
check_content "integrations/agent-workflow/status.schema.json" '"envelopeDigest"' "DEGRADED binds immutable mission"
check_absent "governance/framework/README.md" 'This project|neither project|├── \.specify/|├── \.claude/|├── conversations/' "no stale project identity or structure"
check_absent "governance/operations/README.md" 'This project|neither project|├── \.specify/|├── conversations/|├── registers/' "no stale project identity or structure"
check_absent ".github/workflows/verify-layout.yml" '(contents|pull-requests|issues|actions|checks|deployments|id-token):[[:space:]]*write' "no write permission"

architecture_findings=$(
  grep -RInEi '(language|framework|database|cloud|deployment|ui/|services/|database/)' templates/project \
    --include='*.md' --include='*.yaml' 2>/dev/null || true
)
if [ -z "$architecture_findings" ]; then
  pass_check "adopter template is architecture-neutral"
else
  fail_check "adopter template contains architecture prescriptions"
  printf '%s\n' "$architecture_findings"
fi

echo
echo "Running contract, metadata, link, parser, safety, and adapter validation..."
PYTHON_BIN="${PYTHON:-python}"
if "$PYTHON_BIN" scripts/validate-contracts.py; then
  pass_check "scripts/validate-contracts.py"
else
  fail_check "scripts/validate-contracts.py"
fi

echo
if [ "$missing" -eq 0 ]; then
  echo "RESULT: 100% compliance — all $total deterministic checks pass."
else
  echo "RESULT: $missing of $total deterministic checks failing."
fi

[ "$missing" -eq 0 ]
