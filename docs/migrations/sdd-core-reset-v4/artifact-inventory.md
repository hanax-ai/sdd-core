---
title: SDD-Core Reset v4 Legacy Artifact Inventory
status: atomic-migration-verified
topic: legacy-artifact-disposition
base_commit: d3363238bb2d2f513f09b364926ff4146cc376ff
source_count: 60
---

# SDD-Core Reset v4 Legacy Artifact Inventory

This inventory freezes every tracked artifact under `projects/` at the
authorized base. The machine-readable disposition source is
[path-map.yaml](path-map.yaml).

## Preservation boundary

The 15-file CentCom package is preserved byte-for-byte in independent
repository commit
[`201dde50268650e6ad489f483d5c57d3eeef2f3f`](https://github.com/hanax-ai/sdd-core-centcom-dashboard/commit/201dde50268650e6ad489f483d5c57d3eeef2f3f)
and draft [PR #20](https://github.com/hanax-ai/sdd-core-centcom-dashboard/pull/20).
The PR remains unmerged and is recorded as an external release dependency; its
existence does not grant implementation or merge authority.

## Counts

| Measure | Count |
|---|---:|
| Base artifacts | 60 |
| Moved | 39 |
| Merged | 3 |
| Superseded | 16 |
| Removed | 2 |
| Rows with a disposition | 60 |

## Artifact inventory

| # | Source | Git blob | SHA-256 | Class | Current authority role | Unique authoritative content | Disposition |
|---:|---|---|---|---|---|:---:|---|
| 1 | `projects/governance-framework/.claude/skills/mirror-sync/SKILL.md` | `4259f62bc35b514e8af0ef02e1d80db15687eabf` | `be3d09d9bdb375a72f705fedbfc2471b108696af8a19e9fbad654dfa9c649e72` | skill | canonical-framework-skill | yes | moved |
| 2 | `projects/governance-framework/.claude/skills/skills-creator/SKILL.md` | `111de87abccbf384e4497d323b99bd402cebcabb` | `bb5827f9be461e07d2ed15fd6bb44fe05ab0ac19588e942562a7ac638fedc3c6` | skill | canonical-framework-skill | yes | moved |
| 3 | `projects/governance-framework/.specify/memory/constitution.md` | `2f777aa589f73f297e77f695ef57e2d5b313e470` | `d3dc13e4b9e06dadbe03e223923be9e1be5da0343d81f9f87b3a59d5f1d06775` | constitution | subordinate-domain-authority | yes | moved |
| 4 | `projects/governance-framework/README.md` | `4353465f6cca6bc0a8c08e0970ab1798105b368e` | `b0be7851ea365e999589c4ac1b6255fd65b23204a3a05b879c83e00ba83ccd11` | guidance | framework-definition-guidance | yes | moved |
| 5 | `projects/governance-framework/conversations/.gitkeep` | `e69de29bb2d1d6434b8b29ae775ad8c2e48c5391` | `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855` | directory-sentinel | none | no | removed |
| 6 | `projects/governance-framework/conversations/SYNC-POLICY.md` | `085311f9e7d773a5ac0d453210df22b4d152070b` | `5001863c625a74ede597def514bd2eb926a67397f6dd54a1a5510215ff1082c2` | routing-policy | legacy-domain-routing | yes | merged |
| 7 | `projects/governance-framework/docs/specs/README.md` | `2ae51ef9eb76c0962cc10beda6cd597c5d1fe557` | `3fa54d3467bad4e32b70097c803bb442141bd5391d80dd3ebe5b2660d2055363` | guidance | framework-definition-guidance | yes | moved |
| 8 | `projects/governance-framework/docs/specs/examples/normative-standard-fixture/plan.md` | `69ecd27b4ffb7b7f06a87196db4fa3e40c465400` | `0f347b3e161d74a505cb0a2e1ca934e055eb243da5ea8b5c59a3b173ca87e96c` | synthetic-example | framework-definition-guidance | yes | moved |
| 9 | `projects/governance-framework/docs/specs/examples/normative-standard-fixture/spec.md` | `199ddc0c443de018437ee555b468309f2d6fcca9` | `7f6aba21c732fd89fc8b535acb5789795524c6c647c7cdf756f4206cf4f0d7c5` | synthetic-example | framework-definition-guidance | yes | moved |
| 10 | `projects/governance-framework/docs/specs/examples/normative-standard-fixture/tasks.md` | `a4ac016c5b941717d82a601c53cabf8cb93295b3` | `dd1acd1af8297e98f138455dcedf9e7db63629c6b9dcef2d6a36c1f01865bc8d` | synthetic-example | framework-definition-guidance | yes | moved |
| 11 | `projects/governance-framework/docs/specs/examples/software-product-fixture/contracts/message-of-the-day-api.md` | `e580981a8ac96c38ad677607e4c1b8d2a94b8a01` | `7ae163ab373d4efb1274ce3b314944979a4d8abad49538a90eb4154e9618ee4c` | synthetic-example | framework-definition-guidance | yes | moved |
| 12 | `projects/governance-framework/docs/specs/examples/software-product-fixture/data-model.md` | `8eb3df2f542f8fad183f61519dbe2a67542eb2b5` | `85e3ace2371578dfdcf19d4dffb18c0855d9f6a53ad0a5b8edff241bcaf01b0e` | synthetic-example | framework-definition-guidance | yes | moved |
| 13 | `projects/governance-framework/docs/specs/examples/software-product-fixture/plan.md` | `9e5b557aa7635607bccd380120fb5947a8d91353` | `001176b6fb296708aca8103837bd8b2d059cbf0761dc9fdd6aead33169ea7902` | synthetic-example | framework-definition-guidance | yes | moved |
| 14 | `projects/governance-framework/docs/specs/examples/software-product-fixture/quickstart.md` | `30233e1fa51915519560ad887712b6d27d143ad9` | `cb21074973fab48d85edf2a3af3061ab0855a41f7ff531fa0e6bd68146761221` | synthetic-example | framework-definition-guidance | yes | moved |
| 15 | `projects/governance-framework/docs/specs/examples/software-product-fixture/research.md` | `0c01a28c64e92a2039d932e835ed11237116029e` | `87be3abe388bef3edd4f232fb94b548380a6cb840595185da9dfc129d89153da` | synthetic-example | framework-definition-guidance | yes | moved |
| 16 | `projects/governance-framework/docs/specs/examples/software-product-fixture/spec.md` | `502c5b3006b3c39395c892048056568d93592583` | `5bb3ac75313b434ee38d5afd145feff53b9d8e8f9f0d2eb66eaa58d07a5fd15c` | synthetic-example | framework-definition-guidance | yes | moved |
| 17 | `projects/governance-framework/docs/specs/examples/software-product-fixture/tasks.md` | `a9b3d241a3ef9df7b761b942eb2999cd8fec3130` | `cc90b72dc376e054e16bcf9699e825fd30baec3e474a3e31861168b6261283d8` | synthetic-example | framework-definition-guidance | yes | moved |
| 18 | `projects/governance-framework/docs/specs/template-software/plan.md` | `127d8ab2bed06d3e188c66582cd1afcbf2ae4a3a` | `0c3fbe7981349f1c2e41b8e36656a9667469f4a00251059af8a784b920bb369d` | specification-template | framework-definition-guidance | yes | moved |
| 19 | `projects/governance-framework/docs/specs/template-software/spec.md` | `bd09fa6c3e622d9b0a94f93dc827a10c088dcd9a` | `d00226c3ad1351ec67191d10dcaf6e25cc451d32ce24c79e2617fa5b98f98324` | specification-template | framework-definition-guidance | yes | moved |
| 20 | `projects/governance-framework/docs/specs/template-software/tasks.md` | `d1ffe6383424a20f5665660a24bbfead8afc37b5` | `785bd351ee5e17bf7b3f13cb69e5042f8cd5efae0fc1c8db0316b369dd464071` | specification-template | framework-definition-guidance | yes | moved |
| 21 | `projects/governance-framework/docs/specs/template/plan.md` | `0c28942cfaa5cb8958088a87e838f17a10d14cd5` | `23ee417d3385db3af65b84fe8935146f027be8c43f227710e185e3998b17ade2` | specification-template | framework-definition-guidance | yes | moved |
| 22 | `projects/governance-framework/docs/specs/template/spec.md` | `ca382c8c99469261c7a142c0f785a5735c9fc5f0` | `cebc6da793b12f6230b56d39dfe1a88c338a8e2d3f7cf5a75657dddafda8bbcd` | specification-template | framework-definition-guidance | yes | moved |
| 23 | `projects/governance-framework/docs/specs/template/tasks.md` | `34c06963063b2b08861838e9c98a12cf45f30320` | `7b11d7d45c278ab0153a8445584fb2ff84aaa37d0f19374ac80ad458c946c4c2` | specification-template | framework-definition-guidance | yes | moved |
| 24 | `projects/governance-framework/knowledge/instructions.md` | `b0c886801b44209a4480b7bab78902403715f5f6` | `132ec4a32763ac5af7f157df2cb32cfd0ba0cb6b44957a7e41196159b66d18ff` | grounding-instructions | framework-definition-guidance | yes | moved |
| 25 | `projects/governance-framework/reference/README.md` | `730780c077215bea91a80df4db59ac7dcb3a1051` | `28a25bee85e1a9fef6528accdc251aca7b0cd4c53deda0bed60ab88f4279d514` | guidance | framework-definition-guidance | yes | moved |
| 26 | `projects/governance-framework/standards/deliverables-ownership.md` | `4601ed3d691d1122c32fbb4ed79db5da3238970f` | `f8cdcf108cc247abeafd0450cbd34c03247339f6f5b37e243f96ff5570a92f4f` | standard | normative-framework-standard | yes | moved |
| 27 | `projects/governance-ops/.specify/memory/constitution.md` | `3850b7c8e03785928187c5829664481549da4a78` | `f414e5ff5f4be30b76468871dd02dd96589efb19a1f64d90ec99d4711dfa5a59` | constitution | subordinate-domain-authority | yes | moved |
| 28 | `projects/governance-ops/README.md` | `829f16d129c5b5e95fedb689e0b14490030b1c89` | `688c74b69c39c6d7b8b895b9941b0584abe0a2fe0cf93a5bb114da34ea60d113` | guidance | operational-governance-guidance | yes | moved |
| 29 | `projects/governance-ops/conversations/.gitkeep` | `e69de29bb2d1d6434b8b29ae775ad8c2e48c5391` | `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855` | directory-sentinel | none | no | removed |
| 30 | `projects/governance-ops/conversations/SYNC-POLICY.md` | `10121b901057f6a6ddb9893e8cecb280095655ba` | `9bffbb765ee843b6656e1df24f2192622569b3147425b5e5c51f343685abb9fd` | routing-policy | legacy-domain-routing | yes | merged |
| 31 | `projects/governance-ops/docs/specs/002-centcom-phase-2-live-github-ingestion/coderabbit-finding-disposition.md` | `8cd99af4cf80c619dbe4fdb1ad81fe718d34aa4e` | `3db1ebd02fc47875ba64b56307f672d07e6e3334405e8ab419e7693934681888` | application-planning | application-project-planning | yes | superseded |
| 32 | `projects/governance-ops/docs/specs/002-centcom-phase-2-live-github-ingestion/contracts/provenance-envelope.md` | `d25cb06e5dd78afaa7f890ebfc879b3177927c50` | `72be4dfb18df8c218b9cc00ce3677843a3bf23c8f8a25b99981c39b04856aa72` | application-contract | application-project-planning | yes | superseded |
| 33 | `projects/governance-ops/docs/specs/002-centcom-phase-2-live-github-ingestion/contracts/snapshot-collection.md` | `c876245c0f434e5222b0a38e65f07e7d2578763e` | `2430a7d6a6f18296d2fb76860e8b47ac2e764b9e2974688473d57add135f231a` | application-contract | application-project-planning | yes | superseded |
| 34 | `projects/governance-ops/docs/specs/002-centcom-phase-2-live-github-ingestion/data-model.md` | `873ac9aa4d4b48a959b26c2a16b1c89150b500a4` | `1a36afe30c7dcd375e90ed76e910b8953ecaf721d113e761c30b07241d86a0a4` | application-planning | application-project-planning | yes | superseded |
| 35 | `projects/governance-ops/docs/specs/002-centcom-phase-2-live-github-ingestion/gate-2-entry-criteria.md` | `22d4a27bd8a08f9450eff509a55e066fcb9aad98` | `67bc7683e65237eecdfb122e250b32818969c40775cea97db8d2f7889f5543dc` | application-planning | application-project-planning | yes | superseded |
| 36 | `projects/governance-ops/docs/specs/002-centcom-phase-2-live-github-ingestion/implementation-authorization-boundary.md` | `2ae8a60edd5b7f0a6d62a678efcf8fa311e475a6` | `691a3338cf6da4e6ea4d223c380f9657edde81ac8916b4617f67d60c9477fec3` | application-planning | application-project-planning | yes | superseded |
| 37 | `projects/governance-ops/docs/specs/002-centcom-phase-2-live-github-ingestion/plan.md` | `e1269ad1598a8cea40e0b230de34f76e7a3ab595` | `f5c792ffecc383954fd15831174b05eb996ab51441b03ee895fd0d1d937c24b6` | application-planning | application-project-planning | yes | superseded |
| 38 | `projects/governance-ops/docs/specs/002-centcom-phase-2-live-github-ingestion/quickstart.md` | `40046baf5d399569f9ce36020952989edabb4a5e` | `58bfe2632c22ab1bf3894e3833ce0dc486b0d8b77eec58817c9e5be80d2d9c04` | application-planning | application-project-planning | yes | superseded |
| 39 | `projects/governance-ops/docs/specs/002-centcom-phase-2-live-github-ingestion/r1-finding-disposition.md` | `bec2866942e9fa0caa861642aa39015f6e8db41a` | `d7dfab021e3c9c5ee2970f4a2358eafe758dbc15a3af3442e771b935b490b25f` | application-planning | application-project-planning | yes | superseded |
| 40 | `projects/governance-ops/docs/specs/002-centcom-phase-2-live-github-ingestion/research.md` | `2486581fdd6df719becc76d72d21c2dbaa83e056` | `1773f4f60fb13c9d5de565923228fb58b8eb1d06a3ee804657de39e260ef9fac` | application-planning | application-project-planning | yes | superseded |
| 41 | `projects/governance-ops/docs/specs/002-centcom-phase-2-live-github-ingestion/risk-register.md` | `9af9066b41b4b8a3665715321c86245cf779933e` | `4903e07f263c870ac9b6d9adff8a5db567e71ce211120b8deb99c86281af8787` | application-planning | application-project-planning | yes | superseded |
| 42 | `projects/governance-ops/docs/specs/002-centcom-phase-2-live-github-ingestion/spec.md` | `257ce85f23adf957bc6f7218d19199ea574786b6` | `aba12dd12bcf52a24d2b15f4b063d398eb9ccf00769f7d740c1a96f6e581868c` | application-planning | application-project-planning | yes | superseded |
| 43 | `projects/governance-ops/docs/specs/002-centcom-phase-2-live-github-ingestion/tasks.md` | `6da7a6fca2bc8ac3de8bd455b02a81755ad7efb7` | `59610f5aa3b854c4a397bd247e7454a5dc17b4033e59da4a5181cbc17d704ce9` | application-planning | application-project-planning | yes | superseded |
| 44 | `projects/governance-ops/docs/specs/002-centcom-phase-2-live-github-ingestion/test-strategy.md` | `6b643686db7af99d1c9d1e784d5d965231860e8a` | `7c6cce5ca3d9516e3601f132b0949bd741061f74168d912e19238fb32edb7476` | application-planning | application-project-planning | yes | superseded |
| 45 | `projects/governance-ops/docs/specs/002-centcom-phase-2-live-github-ingestion/traceability.md` | `140fcc5ee985505680246c665e76bce9ac9e9d78` | `f4ceb8c7e98e1dec38b5fb1ac2c127211f00dd31641bac1d56c01725c145cb2a` | application-planning | application-project-planning | yes | superseded |
| 46 | `projects/governance-ops/docs/specs/README.md` | `bb28df7d8b74346648c5b80df932eb9ca45b3c3b` | `5b4ae0ec06a5e586e5bfb337fbbd2d525915686b67288b627f118de347b6d039` | guidance | operational-governance-guidance | yes | moved |
| 47 | `projects/governance-ops/docs/specs/examples/operational-capability-fixture/plan.md` | `31ccd5a338e72988d32cdc0f58ba614340e35f0b` | `5360a13fb1af97eaa9511527ce34263aff9ac75a11308a814321864be5998a62` | synthetic-example | operational-governance-guidance | yes | moved |
| 48 | `projects/governance-ops/docs/specs/examples/operational-capability-fixture/research.md` | `96e657e8c5b822458cb1d42159af2de6f7c6fa0b` | `179a4831261b0afdb0487127a337869060e0d4149fd5cb0843c5bca0380e7973` | synthetic-example | operational-governance-guidance | yes | moved |
| 49 | `projects/governance-ops/docs/specs/examples/operational-capability-fixture/spec.md` | `362ac2faaf82029479886fc5937259634e497dd3` | `5137846f04b4b29db75f22ee020c1bc3b10e5ed61ea2f1ef8fd417b09fd70f74` | synthetic-example | operational-governance-guidance | yes | moved |
| 50 | `projects/governance-ops/docs/specs/examples/operational-capability-fixture/tasks.md` | `3cddcaf62116d9f028ca31ad76371f612fbbef98` | `2a537dbdf3eaf5fef883a4f74d1e9c5479613581e3a0ffac4432567cb022aeac` | synthetic-example | operational-governance-guidance | yes | moved |
| 51 | `projects/governance-ops/docs/specs/template/plan.md` | `f11027d774db4da490b014c3b7df93f10d10ed88` | `0951254ba8b7ecbfa95aa16f880890cfd86beadfbb853d24b804816c91de3e10` | specification-template | operational-governance-guidance | yes | moved |
| 52 | `projects/governance-ops/docs/specs/template/spec.md` | `7efda9d06beb16127fe8fde66584ba331fd08ba8` | `02877011426c5332fbbc37e826cc653a5f9fa3523680ee9aa4f26d61d610ca26` | specification-template | operational-governance-guidance | yes | moved |
| 53 | `projects/governance-ops/docs/specs/template/tasks.md` | `eb592333ae5ea7051992b84a253301c198f9feb6` | `9531deeaddafcfe86d74bdc0bf6713af629da159b0f6cfaf77c4e7323f8c17b1` | specification-template | operational-governance-guidance | yes | moved |
| 54 | `projects/governance-ops/knowledge/instructions.md` | `d044eb305c19ea69ef0511803f61afdbf91276be` | `90632f45e6a4ac9cd34c9fe1907436e418d33f1ded4c83cf44374b9db5729b06` | grounding-instructions | operational-governance-guidance | yes | moved |
| 55 | `projects/governance-ops/records/README.md` | `5765a9250d6143f41beabd7432566be35af8224e` | `f0c1ade62f2fb39bbead36f69a5aabdb3724c5149b4b35342a138aa909344f96` | guidance | operational-record-definition | yes | moved |
| 56 | `projects/governance-ops/records/templates/README.md` | `dab39e8c2b8d6fcd8b1d94c50e9979b55b7650ea` | `272abdd6ca92c7ca9f92fcab86a5e5ee205ddaeb12481a20e43629284aa5c819` | record-template | operational-record-definition | yes | moved |
| 57 | `projects/governance-ops/records/templates/control-execution.template.md` | `b71fd9ce67b2f9c99c24a463754c4fa4a5cc506d` | `4975a5d6d75d6af4375167feca33c2df4b6ee5f9c8990cdde26e17af00ccb438` | record-template | operational-record-definition | yes | moved |
| 58 | `projects/governance-ops/reference/README.md` | `5f8df826cea336f51b525e0d6953723b046de7aa` | `c46072dae1009eed2a7af436e20eb626c97390ec03ba045b5e78330d970decd9` | guidance | operational-governance-guidance | yes | moved |
| 59 | `projects/governance-ops/registers/README.md` | `a33084a5fa679b026c1e19b9b2d5702da884d8f5` | `219e0b3b119efa78de21910a4e34d877eb64d78672acd22fde01fcd3aed92786` | register-guidance | operational-guidance | yes | merged |
| 60 | `projects/governance-ops/registers/deliverables.md` | `4361377d7c23189aaca3314dbeb926ccdde221fa` | `7a5c3b9c131d33b2ea908b66f2ef61bb9e5382bca9aad9fc9f94c441b2da4728` | operational-register | portfolio-operational-state | yes | superseded |

## Validation

- Source command:
  `git ls-tree -r --name-only d3363238bb2d2f513f09b364926ff4146cc376ff projects`
- Expected and observed source count: **60**.
- Every source path is unique.
- Every row has exactly one disposition and one target.
- Content SHA-256 values were computed before any legacy move.

## Closure

All **60 of 60** source rows are closed: 39 moved, 3 merged, 16 superseded,
and 2 removed. The moved-target SHA-256 recomputation and independent CentCom
preservation evidence are recorded in
[migration-evidence.md](migration-evidence.md). No tracked `projects/`
artifact remains.

The closed inventory is implemented by atomic commit
`740a5e3a7623916f97d96f3f0cb0dff9cdcf18d0`, tree
`50c9ec59e60f3a33b30ada846a240cfce5d58378`, whose parent is planning commit
`cc4f4b17ccca428334689cc5ab381741470168c0`. All **39** moved-target SHA-256
values were recomputed against that tree. T021 R10 returned **ACCEPT**, and
local deterministic validation passed **122/122** checks.

Draft [PR #17](https://github.com/hanax-ai/sdd-core/pull/17) targets
`release/sdd-core-v3.0.0-rc.1` from
`codex/sdd-core-reset-v4-final-clean-rebuild`; its pre-closure Ubuntu and
Windows jobs passed. The evidence-closure commit is `SELF`: the commit
introducing the closed evidence table. Its exact SHA and post-closure PR
checks are recorded in T024 after creation and push, never pre-claimed here.
None of this grants merge or release authority.
