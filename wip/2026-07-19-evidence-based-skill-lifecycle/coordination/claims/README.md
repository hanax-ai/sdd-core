# Claims

One file per active workstream: `<unique-contributor-or-workstream-name>.md`
(humans: GitHub handle; agents: `claude-<role>-<assigned-name-or-short-id>`).

**A claim reserves nothing until it is on `main`** — publish the claim as a claim-only
commit/PR BEFORE creating your contribution branch (COLLABORATION.md §3). If your
claim push is rejected (non-fast-forward), pull, re-read all claims, and re-attempt
only if your workstream is still free.

Claim file schema:

```markdown
# Claim: <workstream name>

- Owner: <unique identifier>
- Scope: <files + topic this claim covers>
- Started: YYYY-MM-DD
- Expected completion: YYYY-MM-DD
```

Close/remove the claim (via `main`) after integration. Stale: 14 days idle → lead
pings; +7 days silent → lead may close as abandoned (COLLABORATION.md §8, §10).
