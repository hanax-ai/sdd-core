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
| `governance/framework/skills/mirror-sync/SKILL.md` | `a2142fbc6811615fdba4da90d4d734ab32c0da8e7aef66eab806c3be98d7ea31` |
| `governance/framework/skills/skills-creator/SKILL.md` | `d15d206442eb9c67c7c2a6d7b24e86439673c251ce9ea12128d640044edb888e` |
| `governance/framework/constitution.md` | `3b3a311b5f29662cf1b8721aa2cb164fb64548a1f3e6d93620a951120fca7216` |
| `governance/framework/README.md` | `fecab625c90546e169d884072cd64c5cacdd873ffff324ba43bd643467b4e714` |
| `governance/framework/docs/specs/README.md` | `fd74701181433f559ed106b5123917c337747df11eb983834ecfe0888904b662` |
| `governance/framework/docs/specs/examples/normative-standard-fixture/plan.md` | `1f33ab46f69daf1eceb07925b96f74e6cee1c2118e849486d74e1f832ab35728` |
| `governance/framework/docs/specs/examples/normative-standard-fixture/spec.md` | `0b1bcb26c9b34114e085196c26faef63898190e6cb738ba6d6207044eee4a3a3` |
| `governance/framework/docs/specs/examples/normative-standard-fixture/tasks.md` | `0d41a7e59ddfae87551a4014d6d17e4190a04a57d8406183fe1c9b0cf3d1b244` |
| `governance/framework/docs/specs/examples/software-product-fixture/contracts/message-of-the-day-api.md` | `a554df1454a78ad88c41be2495c193922e3f833ef6de247498dc0b47fc417519` |
| `governance/framework/docs/specs/examples/software-product-fixture/data-model.md` | `bb9cca46f8b67ac09d1a08ffbd6dbde87773e685bff5442b07deac956b139ae4` |
| `governance/framework/docs/specs/examples/software-product-fixture/plan.md` | `45adb7968559c3dbad189e2c4c2facc240437006592ea3bdef9e2f0f8adc6b9a` |
| `governance/framework/docs/specs/examples/software-product-fixture/quickstart.md` | `81e51d70362666f73939ac1682e44466f0450e2da4ac874abab0d269bcba6fba` |
| `governance/framework/docs/specs/examples/software-product-fixture/research.md` | `87be3abe388bef3edd4f232fb94b548380a6cb840595185da9dfc129d89153da` |
| `governance/framework/docs/specs/examples/software-product-fixture/spec.md` | `59ccaf8e7dc868f08c22b9d40b9ade359d9c8a6ecb98fb0e39c3fc125393fc51` |
| `governance/framework/docs/specs/examples/software-product-fixture/tasks.md` | `2345d07e3470d01dd3fdcfab1d7396e286b2792e124aeb2d69c58751fc7c01ec` |
| `governance/framework/docs/specs/template-software/plan.md` | `435d488bd1830d040e2277ff4c7eb474f9e349ff20b43f2897f72fde39eea46d` |
| `governance/framework/docs/specs/template-software/spec.md` | `66997d6991925b1282a9fab783f786a76fe3ff59edab6ad103905073bc03de2e` |
| `governance/framework/docs/specs/template-software/tasks.md` | `981d9962ef65d584fc4e474b27a66ef9ef82e288150e40dee5a9fbfc20c75954` |
| `governance/framework/docs/specs/template/plan.md` | `38b450ec2113383d4d93cda4a9e29579d188703b16b433fb698eb3996d521d6e` |
| `governance/framework/docs/specs/template/spec.md` | `03b8a2a01b18d175efd35849a568927efd9a0d06af5d45c8d35b0fa5aad0b139` |
| `governance/framework/docs/specs/template/tasks.md` | `95ec7dc57bc08d9637164a104ff69241ecd57907e750ba77e2a1ff522489efd0` |
| `governance/framework/knowledge/instructions.md` | `0a6b4c68816b4ed50ada5e02eb5ca292717cb877bee83275e6f3460e97df3347` |
| `governance/framework/reference/README.md` | `35741acf31336b930c06b50d1687b90056017d4c49eaa8491f4d1a324bf110c0` |
| `governance/framework/standards/deliverables-ownership.md` | `96081c79068ec8cc6a27d67e1c6be21a5793017d281bd144edfd9a0a1a31f51e` |
| `governance/operations/constitution.md` | `042bb938f1a55576ef4fc41ee85c3175cb820af111bc436c1812f7d30d5f07b6` |
| `governance/operations/README.md` | `a2a219d4a5df439ac4354ca9fd15b0eccb555872c8c71aaa63edb265ac235bb1` |
| `governance/operations/docs/specs/README.md` | `f35b789dc49dbb823797fe59299dc7911ba1311b907d8e6d98783202c4fd6dd5` |
| `governance/operations/docs/specs/examples/operational-capability-fixture/plan.md` | `ad5d838f5503d2748c9ff1e12e6d240b0ad0b5a302ea324f0cb2dd0a60b919c0` |
| `governance/operations/docs/specs/examples/operational-capability-fixture/research.md` | `179a4831261b0afdb0487127a337869060e0d4149fd5cb0843c5bca0380e7973` |
| `governance/operations/docs/specs/examples/operational-capability-fixture/spec.md` | `44b19fb941f46ef6de107a8df94f097e077d4718deb0065489b13b4b2d7e2958` |
| `governance/operations/docs/specs/examples/operational-capability-fixture/tasks.md` | `7a58b3ab8c8e00e8cebe52f3a5a241328085425285475a2d2b3ceeed194ea54b` |
| `governance/operations/docs/specs/template/plan.md` | `f2323f1e0af23c7b25d7e3b36a5db4a27606b42527a4d28e2b6d52c713237c10` |
| `governance/operations/docs/specs/template/spec.md` | `1c4d835049d2b2f82b7d5c0adfbeae65af526f1f7c150f55c008851010071399` |
| `governance/operations/docs/specs/template/tasks.md` | `36a011ab72841dda1e5bc3e33657b9c40172d64f5310db8729cdeabde6c9c02b` |
| `governance/operations/knowledge/instructions.md` | `f6025ab39b110637262a5756cd16aaab7eca169fa595e6b0032247c23a49b27e` |
| `governance/operations/records/README.md` | `6d204f3010443c4bbfcbed16e3e7cc51b759afb050d8c034b8b3d38bdce13266` |
| `governance/operations/records/templates/README.md` | `272abdd6ca92c7ca9f92fcab86a5e5ee205ddaeb12481a20e43629284aa5c819` |
| `governance/operations/records/templates/control-execution.template.md` | `cfc40cbd4e4aa35bbd04e7b3eed9d0c31946589df3509b9f06db4e1425879630` |
| `governance/operations/reference/README.md` | `f5d3ea4069f24062c94ad559c123a80a7ead562006def08f5b35421cec0b99c1` |

## Validation state

Local deterministic verification currently passes **118/118** checks on
Windows using Git Bash and Python 3.11. A direct
`python scripts/validate-contracts.py` invocation creates a private,
unpredictable, process-scoped temporary environment outside the repository
when exact hash-locked dependencies are absent and deletes it automatically;
this changes no repository or machine-tier configuration. The validator
compiles every schema,
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
