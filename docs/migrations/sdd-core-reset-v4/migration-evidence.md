---
title: SDD-Core Reset v4 Migration Evidence
status: pre-commit-validated
topic: reset-migration-provenance
scope: GLOBAL
base_commit: d3363238bb2d2f513f09b364926ff4146cc376ff
source_count: 60
---

# SDD-Core Reset v4 Migration Evidence

## Identity and authority

| Field | Value |
|---|---|
| Canonical repository | `https://github.com/hanax-ai/sdd-core.git` |
| Authorized base branch | `release/sdd-core-v3.0.0-rc.1` |
| Authorized base commit | `d3363238bb2d2f513f09b364926ff4146cc376ff` |
| Gate 2 plan | `docs/specs/001-sdd-core-reset/plan.md` |
| Plan SHA-256 | `C83198CE8CDAA85E27696273A2DE13F543D8CB1B45C2AD91FA753ECE4735354D` |
| Planning commit | `cc4f4b17ccca428334689cc5ab381741470168c0` |
| Baseline verifier | `181/181` checks at the authorized base |
| Target constitution | `4.0.0` |
| Target release candidate | `4.0.0-rc.1` |
| Adoption/mission/evidence contracts | `4.0.0` |

The exact authority record is
[implementation-authorization.md](../../specs/001-sdd-core-reset/records/implementation-authorization.md).
Merge, release, adopter update, and external runtime work remain unauthorized.

## Source closure

The [path map](path-map.yaml) contains 60 unique source paths and exactly one
disposition per source:

| Disposition | Count | Closure |
|---|---:|---|
| Moved | 39 | Preserved in SDD-Core internal-domain paths, then intentionally reframed |
| Merged | 3 | Unique reusable rules incorporated into root/domain guidance |
| Superseded | 16 | 15 CentCom artifacts preserved byte-for-byte externally; one live portfolio register retained by source digest only |
| Removed | 2 | Empty directory sentinels replaced by root conversation routing |
| **Total** | **60** | **60/60 closed** |

The 15-file CentCom package is preserved at commit
[`201dde50268650e6ad489f483d5c57d3eeef2f3f`](https://github.com/hanax-ai/sdd-core-centcom-dashboard/commit/201dde50268650e6ad489f483d5c57d3eeef2f3f)
and draft [PR #20](https://github.com/hanax-ai/sdd-core-centcom-dashboard/pull/20).
The verified source archive SHA-256 is
`A56A64A4132324C0CF2BB8DA5A5AFE58DA5E6D78BFBFAE5BB0F986EEF6F8E204`.

## Recomputed moved-target hashes

These SHA-256 values cover every moved target after its authorized
domain-identity and link updates.

| Target | SHA-256 |
|---|---|
| `governance/framework/skills/mirror-sync/SKILL.md` | `adab72d6c6f186538d253039e4aeb961b2df4d64f66e810ab1fa4e6846216a68` |
| `governance/framework/skills/skills-creator/SKILL.md` | `d15d206442eb9c67c7c2a6d7b24e86439673c251ce9ea12128d640044edb888e` |
| `governance/framework/constitution.md` | `3b3a311b5f29662cf1b8721aa2cb164fb64548a1f3e6d93620a951120fca7216` |
| `governance/framework/README.md` | `fecab625c90546e169d884072cd64c5cacdd873ffff324ba43bd643467b4e714` |
| `governance/framework/docs/specs/README.md` | `fd74701181433f559ed106b5123917c337747df11eb983834ecfe0888904b662` |
| `governance/framework/docs/specs/examples/normative-standard-fixture/plan.md` | `4e2caa2a2847a2aee6187ef0fbba715f71f419830424f798e93458847f2a4d44` |
| `governance/framework/docs/specs/examples/normative-standard-fixture/spec.md` | `1f3132b5da61e6960a7ae3d9dff3b04eb9b6b2d936c525e37b5b22335220cc99` |
| `governance/framework/docs/specs/examples/normative-standard-fixture/tasks.md` | `9938e2e2615e36b6c708fed4393920e1931f87eba6435b059927c08e699161fc` |
| `governance/framework/docs/specs/examples/software-product-fixture/contracts/message-of-the-day-api.md` | `7ae163ab373d4efb1274ce3b314944979a4d8abad49538a90eb4154e9618ee4c` |
| `governance/framework/docs/specs/examples/software-product-fixture/data-model.md` | `85e3ace2371578dfdcf19d4dffb18c0855d9f6a53ad0a5b8edff241bcaf01b0e` |
| `governance/framework/docs/specs/examples/software-product-fixture/plan.md` | `b8cade3b59563849a35448c856aecc01ca21243a4a883e1bfbcf542b51a71be3` |
| `governance/framework/docs/specs/examples/software-product-fixture/quickstart.md` | `cb21074973fab48d85edf2a3af3061ab0855a41f7ff531fa0e6bd68146761221` |
| `governance/framework/docs/specs/examples/software-product-fixture/research.md` | `87be3abe388bef3edd4f232fb94b548380a6cb840595185da9dfc129d89153da` |
| `governance/framework/docs/specs/examples/software-product-fixture/spec.md` | `018d1d876c0122370c3e3a06fffa9cfec3d927223727fdc87bda8921b205aa60` |
| `governance/framework/docs/specs/examples/software-product-fixture/tasks.md` | `cc90b72dc376e054e16bcf9699e825fd30baec3e474a3e31861168b6261283d8` |
| `governance/framework/docs/specs/template-software/plan.md` | `435d488bd1830d040e2277ff4c7eb474f9e349ff20b43f2897f72fde39eea46d` |
| `governance/framework/docs/specs/template-software/spec.md` | `0803cd4ffad7dca329303cc12785f329c931c2cef685afaef34a521f43ad0b68` |
| `governance/framework/docs/specs/template-software/tasks.md` | `e88e466df9419691d54d0dba69d70b126eb1b586801b05c2bb1c90a4b8273896` |
| `governance/framework/docs/specs/template/plan.md` | `35f097aba84bce98c31f9f87d487eceacef412e2b3d3c4a05567ac1d8aecc729` |
| `governance/framework/docs/specs/template/spec.md` | `0660074d45447e7bd2a1e4558b78dfae322629e5eb3826587a2d4b87c7fb3a37` |
| `governance/framework/docs/specs/template/tasks.md` | `ebb7df755815230b8f63a4caaf5b207abb287469f56923850b5e30637ba009b7` |
| `governance/framework/knowledge/instructions.md` | `5450d2c4fed1e461e1975f17a8df865d61b65772fd063ef008aa720aa468bfa1` |
| `governance/framework/reference/README.md` | `28a25bee85e1a9fef6528accdc251aca7b0cd4c53deda0bed60ab88f4279d514` |
| `governance/framework/standards/deliverables-ownership.md` | `2b9015b759bc0a97f39010c3f37a38acd7fb757825833b788f2d81f036f3d4b5` |
| `governance/operations/constitution.md` | `042bb938f1a55576ef4fc41ee85c3175cb820af111bc436c1812f7d30d5f07b6` |
| `governance/operations/README.md` | `a2a219d4a5df439ac4354ca9fd15b0eccb555872c8c71aaa63edb265ac235bb1` |
| `governance/operations/docs/specs/README.md` | `f35b789dc49dbb823797fe59299dc7911ba1311b907d8e6d98783202c4fd6dd5` |
| `governance/operations/docs/specs/examples/operational-capability-fixture/plan.md` | `44df35c7d2ba1ee294170d63be86d29f6e250123c102af5350def75895b4f261` |
| `governance/operations/docs/specs/examples/operational-capability-fixture/research.md` | `179a4831261b0afdb0487127a337869060e0d4149fd5cb0843c5bca0380e7973` |
| `governance/operations/docs/specs/examples/operational-capability-fixture/spec.md` | `679e7d5041ecd90432afbee5f49ff1d4243a306c8fef123efd387d87b598c4ea` |
| `governance/operations/docs/specs/examples/operational-capability-fixture/tasks.md` | `7a58b3ab8c8e00e8cebe52f3a5a241328085425285475a2d2b3ceeed194ea54b` |
| `governance/operations/docs/specs/template/plan.md` | `2ff26bbe10f98d6008dfc5c9d5b9996409294b6206f0912912b93ade03f15c50` |
| `governance/operations/docs/specs/template/spec.md` | `c2d0be9988e8ae516ace3a93aac9ba6e93640133108fa4330fd652a36735618a` |
| `governance/operations/docs/specs/template/tasks.md` | `1b12a955383d11e4ab75e5af0ed0d487039d5f64a47eea6eb77e7aa156d2758f` |
| `governance/operations/knowledge/instructions.md` | `ee58f8131145e50daa4d5cb3765c89725523a6580e5a2f46920278a8417ead8a` |
| `governance/operations/records/README.md` | `d585782f0f941f4514b5412494f210ee8639419255f0a39be6eb452e9b3f5e40` |
| `governance/operations/records/templates/README.md` | `272abdd6ca92c7ca9f92fcab86a5e5ee205ddaeb12481a20e43629284aa5c819` |
| `governance/operations/records/templates/control-execution.template.md` | `1a0eaaf29b1f7ba70811f2cfcc7652c43c63f4920f31e8582c4fe079a74f89bd` |
| `governance/operations/reference/README.md` | `127f23c8067ad9c80b0f5ce079e5e6ea13f23a487be97878dd6f16e09a8c3208` |

## Validation state

Local deterministic verification currently passes **118/118** checks on
Windows using Git Bash and Python 3.11. A direct
`python scripts/validate-contracts.py` invocation creates or reuses a
disposable, requirements-digest-keyed environment when the exact hash-locked
dependencies are absent; this changes no repository or machine-tier
configuration. The validator compiles every schema,
matches every valid/invalid fixture outcome, checks new authoritative
front matter and links, parses repository JSON/YAML/SVG, scans personal paths
and write-capable automation, verifies adapter parity, and confirms that
`git ls-files projects` is empty.

## Evidence-closure fields

These fields have a defined producer and transition; they are not inferred or
represented by placeholder identifiers.

| Field | Current state | Producer |
|---|---|---|
| Atomic migration commit SHA | `NOT_YET_CREATED` | T022 creates it after T021 acceptance; T023 records it |
| Atomic migration tree SHA | `NOT_YET_CREATED` | T022 reads it without amending the commit; T023 records it |
| Draft pull request | `NOT_YET_CREATED` | T023 after the atomic commit |
| Linux CI result/URL | `NOT_YET_RUN` | T023 remote matrix |
| Windows CI result/URL | `NOT_YET_RUN` | T023 remote matrix |
| Advisory CodeRabbit verdict | `NOT_YET_RUN` | T023 remote review |
| Independent governance verdict | `NOT_YET_PERFORMED` | T021 independent reviewer |
| Evidence-closure commit | `NOT_YET_CREATED` | T023 after remote evidence exists |

## Unresolved external dependencies

- No compatible immutable Fusion Harness release has been verified; binding
  readiness is correctly `BLOCKED`.
- No immutable Agent Workflow compatibility release has been verified.
- Machine-tier independent-repository conversation routing remains deferred.
- Agentic remediation, Autofix, scheduling, Harness remediation, automatic
  commit/push/PR/merge, release, and deployment remain disabled.
- Remote Linux/Windows CI and CodeRabbit review await T023.

See [rollback.md](rollback.md) for recovery boundaries.
