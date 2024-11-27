# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this
project adheres to [Semantic Versioning](http://semver.org/).

## [12.0.1](https://github.com/terraform-google-modules/terraform-google-memorystore/compare/v12.0.0...v12.0.1) (2024-11-27)


### Bug Fixes

* Broken module due to apphub_service_uri output ([#251](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/251)) ([ebef4be](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/ebef4beb36716fcde167e692375e3336da5111b7))

## [12.0.0](https://github.com/terraform-google-modules/terraform-google-memorystore/compare/v11.1.0...v12.0.0) (2024-10-23)


### ⚠ BREAKING CHANGES

* Rename project input variable to project_id ([#243](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/243))

### Features

* Rename project input variable to project_id ([#243](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/243)) ([04cef76](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/04cef768b0ad530d9f8b886f1829971ce5bbfd01))


### Bug Fixes

* Add Apphub URI output to Redis ([#245](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/245)) ([dc74494](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/dc74494c631e8aa216379949dedbb70dffd2855b))

## [11.1.0](https://github.com/terraform-google-modules/terraform-google-memorystore/compare/v11.0.1...v11.1.0) (2024-10-07)


### Features

* add sub-module memorystore for Valkey ([#239](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/239)) ([9c3c3f3](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/9c3c3f358eb408be03b632bba6f822f5872eb871))

## [11.0.1](https://github.com/terraform-google-modules/terraform-google-memorystore/compare/v11.0.0...v11.0.1) (2024-10-01)


### Bug Fixes

* update enable api module version in redis instance and memcache sub-module ([#237](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/237)) ([9294ace](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/9294acee38c00841cc279af6051f9af3ee4349e2))

## [11.0.0](https://github.com/terraform-google-modules/terraform-google-memorystore/compare/v10.0.0...v11.0.0) (2024-09-17)


### ⚠ BREAKING CHANGES

* **TPG>=6.0:** Added deletion protection support in Redis cluster ([#233](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/233))

### Features

* **deps:** Update Terraform Google Provider to v6 (major) ([#229](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/229)) ([bbbda1e](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/bbbda1e7b31cbcbb91a408166372af343ab2f160))
* **TPG>=6.0:** Added deletion protection support in Redis cluster ([#233](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/233)) ([77c0207](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/77c02075ac6145162d2bc979b151858bb471c8a4))

## [10.0.0](https://github.com/terraform-google-modules/terraform-google-memorystore/compare/v9.0.0...v10.0.0) (2024-07-16)


### ⚠ BREAKING CHANGES

* **TPG >=5.33:** zone_distribution_config force recreation ([#222](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/222))
* **deps:** Update Terraform terraform-google-modules/project-factory/google to v15 ([#215](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/215))

### Features

* Add new output called env_vars for Redis ([#219](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/219)) ([c1190ee](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/c1190ee7aad05d4814a2379e0efdb67990564656))
* **TPG >=5.33:** zone_distribution_config force recreation ([#222](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/222)) ([c49bdbf](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/c49bdbfb62385c33b075165f4399f1924a8e8c29))


### Bug Fixes

* **deps:** Update Terraform terraform-google-modules/project-factory/google to v15 ([#215](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/215)) ([5901c46](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/5901c463b65af15f99e837a244bc5bce6e728b0e))

## [9.0.0](https://github.com/terraform-google-modules/terraform-google-memorystore/compare/v8.0.0...v9.0.0) (2024-05-13)


### ⚠ BREAKING CHANGES

* **TPG>5.28:** add redis_configs in redis cluster ([#213](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/213))
* **TPG >=5.24:** Allow modifying of node type in redis cluster sub-module ([#206](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/206))

### Features

* **TPG >=5.24:** Allow modifying of node type in redis cluster sub-module ([#206](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/206)) ([f30de6f](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/f30de6fd43ce4efd124fe6d6230fe55f4df75005))
* **TPG>5.28:** add redis_configs in redis cluster ([#213](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/213)) ([30d5433](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/30d54338e661c1a244808349ec8125e60363f86f))

## [8.0.0](https://github.com/terraform-google-modules/terraform-google-memorystore/compare/v7.1.3...v8.0.0) (2024-01-04)


### ⚠ BREAKING CHANGES

* **TPG >=4.74:** remove ignore maintenance_schedule. Added redis cluster sub-module ([#195](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/195))

### Features

* add memcache_version parameter ([#185](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/185)) ([bfaa989](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/bfaa98943fdc50cc087d0ecde453a0843efd44a8))


### Bug Fixes

* **TPG >=4.74:** remove ignore maintenance_schedule. Added redis cluster sub-module ([#195](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/195)) ([10c10ba](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/10c10ba22365d56e4e034167f0e32f56a4ce9069))

## [7.1.3](https://github.com/terraform-google-modules/terraform-google-memorystore/compare/v7.1.2...v7.1.3) (2023-10-17)


### Bug Fixes

* upgraded versions.tf to include minor bumps from tpg v5 ([#170](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/170)) ([66add77](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/66add7715c15fa86f4d346a4c988fdaa2667f12b))

## [7.1.2](https://github.com/terraform-google-modules/terraform-google-memorystore/compare/v7.1.1...v7.1.2) (2023-07-11)


### Bug Fixes

* Ignore maintenance_schedule plan changes ([#152](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/152)) ([969a116](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/969a1167f0478638747dd78c95bfaf5fa3cb51c2))

## [7.1.1](https://github.com/terraform-google-modules/terraform-google-memorystore/compare/v7.1.0...v7.1.1) (2023-06-20)


### Bug Fixes

* Change memcached's maintenance_policy duration attribute type. ([#145](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/145)) ([0ab8c11](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/0ab8c1175ca2b50bc3401385f1eb71a508399f93))

## [7.1.0](https://github.com/terraform-google-modules/terraform-google-memorystore/compare/v7.0.0...v7.1.0) (2023-02-27)


### Features

* add persistence configuration for Redis ([#125](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/125)) ([103c794](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/103c7941dea68ec7fa181db6bd8e18d37c84d39c))
* add support for using read replicas ([#124](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/124)) ([40a5b6a](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/40a5b6ae592c4ff7524ee4dd8756ffd2b6d60a98))

## [7.0.0](https://github.com/terraform-google-modules/terraform-google-memorystore/compare/v6.0.0...v7.0.0) (2023-01-20)


### ⚠ BREAKING CHANGES

* **deps:** update tf modules ([#115](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/115))

### Bug Fixes

* fixes lint issues and generates metadata ([#122](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/122)) ([766842a](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/766842a2a1366d92ec90f056a33cbc03710599db))


### Miscellaneous Chores

* **deps:** update tf modules ([#115](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/115)) ([d78bbdf](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/d78bbdfc9a0079c16eb833cf5d1c7b840af1646e))

## [6.0.0](https://github.com/terraform-google-modules/terraform-google-memorystore/compare/v5.1.0...v6.0.0) (2022-09-21)


### ⚠ BREAKING CHANGES

* Minimum Google provider version increased to v4.28.0 (#103)

* Updated CMEK attribute (#103)

### Features

* Updated CMEK attribute ([#103](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/103)) ([3fbeb7e](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/3fbeb7e11515647189b2d3c9001b2d44cf49a93a))

## [5.1.0](https://github.com/terraform-google-modules/terraform-google-memorystore/compare/v5.0.0...v5.1.0) (2022-09-16)


### Features

* add server_ca_certs list to outputs ([#99](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/99)) ([f590182](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/f5901828cad5cf7d3347828e5b4e62aecd4d9268))

## [5.0.0](https://github.com/terraform-google-modules/terraform-google-memorystore/compare/v4.4.1...v5.0.0) (2022-08-05)


### ⚠ BREAKING CHANGES

* Minimum Google provider version increased to v4.10.0 ([#95](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/95)) ([561af25](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/561af254750e403928c99e7c9af96ac64671a14c))

### Features

* Adds Maintenance Policy ([#95](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/95)) ([561af25](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/561af254750e403928c99e7c9af96ac64671a14c))

## [4.4.1](https://github.com/terraform-google-modules/terraform-google-memorystore/compare/v4.4.0...v4.4.1) (2022-07-20)


### Bug Fixes

* add sensitive true flag to output auth_string ([#93](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/93)) ([20b4c61](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/20b4c61b3d9d29e108d410b171a84f0e297fa744))

## [4.4.0](https://github.com/terraform-google-modules/terraform-google-memorystore/compare/v4.3.0...v4.4.0) (2022-06-28)


### Features

* added replica_count and replicas_mode functionality ([#88](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/88)) ([3fcdba5](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/3fcdba540997abb0ddef3826e97b3c397daf038e))

## [4.3.0](https://github.com/terraform-google-modules/terraform-google-memorystore/compare/v4.2.0...v4.3.0) (2022-04-13)


### Features

* Add missing auth_string output. ([#77](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/77)) ([2a3dc41](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/2a3dc41936090cbd270f550dfab598708e29be84))

## [4.2.0](https://github.com/terraform-google-modules/terraform-google-memorystore/compare/v4.1.0...v4.2.0) (2022-02-01)


### Features

* update TPG version constraints to allow 4.0 ([#73](https://github.com/terraform-google-modules/terraform-google-memorystore/issues/73)) ([7c009e6](https://github.com/terraform-google-modules/terraform-google-memorystore/commit/7c009e6fcaafa544a3cfacdd7764cac76a70ae24))

## [4.1.0](https://www.github.com/terraform-google-modules/terraform-google-memorystore/compare/v4.0.0...v4.1.0) (2021-09-27)


### Features

* Add discovery endpoint output to memcache module ([#62](https://www.github.com/terraform-google-modules/terraform-google-memorystore/issues/62)) ([4639ace](https://www.github.com/terraform-google-modules/terraform-google-memorystore/commit/4639aceb534178fedfcc7f306a6d4ec173e5c318))
* Added port to output ([#67](https://www.github.com/terraform-google-modules/terraform-google-memorystore/issues/67)) ([0335deb](https://www.github.com/terraform-google-modules/terraform-google-memorystore/commit/0335deb3445f5f6b946c3c3ef9cbb343e2f78e53))

## [4.0.0](https://www.github.com/terraform-google-modules/terraform-google-memorystore/compare/v3.1.0...v4.0.0) (2021-07-16)


### ⚠ BREAKING CHANGES

* Transit encryption is now the default for Redis instances. Set `transit_encryption_mode = "DISABLED"` to restore the old default.

### Features

* add redis TLS support ([#60](https://www.github.com/terraform-google-modules/terraform-google-memorystore/issues/60)) ([75c7033](https://www.github.com/terraform-google-modules/terraform-google-memorystore/commit/75c7033713621aa18b7b5057711bd70e41e0325d))

## [3.1.0](https://www.github.com/terraform-google-modules/terraform-google-memorystore/compare/v3.0.0...v3.1.0) (2021-05-21)


### Features

* Add node outputs to the memcache module ([#57](https://www.github.com/terraform-google-modules/terraform-google-memorystore/issues/57)) ([8fe3f81](https://www.github.com/terraform-google-modules/terraform-google-memorystore/commit/8fe3f81869d62305e0c251c0b93f4735cd8c3c4b))

## [3.0.0](https://www.github.com/terraform-google-modules/terraform-google-memorystore/compare/v2.0.0...v3.0.0) (2021-03-25)


### ⚠ BREAKING CHANGES

* add Terraform 0.13 constraint and module attribution (#54)

### Features

* Add support for setting auth_enabled and auth_string on Redis ([#47](https://www.github.com/terraform-google-modules/terraform-google-memorystore/issues/47)) ([c552c19](https://www.github.com/terraform-google-modules/terraform-google-memorystore/commit/c552c1941a4b7bc7b0bbbb5fdf4e4768fd528623))
* add Terraform 0.13 constraint and module attribution ([#54](https://www.github.com/terraform-google-modules/terraform-google-memorystore/issues/54)) ([b60cd11](https://www.github.com/terraform-google-modules/terraform-google-memorystore/commit/b60cd118c1d3dd86fb194af77f34a9957ae14477))


### Bug Fixes

* Remove auth_string configuration ([#53](https://www.github.com/terraform-google-modules/terraform-google-memorystore/issues/53)) ([1b1b340](https://www.github.com/terraform-google-modules/terraform-google-memorystore/commit/1b1b340374132317a74f1a1bacdff1cc5901f818))
* Upgrade project_services submodule to support 0.14. ([#48](https://www.github.com/terraform-google-modules/terraform-google-memorystore/issues/48)) ([7ceff0f](https://www.github.com/terraform-google-modules/terraform-google-memorystore/commit/7ceff0f8368a188258fbdd3153b1669f31b7ca37))

## [2.0.0](https://www.github.com/terraform-google-modules/terraform-google-memorystore/compare/v1.3.1...v2.0.0) (2021-01-06)


### ⚠ BREAKING CHANGES

* Increased minimum Google provider version to 3.34.0.

### Features

* Add persistence_iam_identity to module output ([#36](https://www.github.com/terraform-google-modules/terraform-google-memorystore/issues/36)) ([c3a9a88](https://www.github.com/terraform-google-modules/terraform-google-memorystore/commit/c3a9a884f1c17e1ff0fd2528631e3790b5bfd5fa))


### Bug Fixes

* Upgrade version of project_services module to 9.2.0 ([#35](https://www.github.com/terraform-google-modules/terraform-google-memorystore/issues/35)) ([a582a36](https://www.github.com/terraform-google-modules/terraform-google-memorystore/commit/a582a36746d2eb3570b8c91be6302a343bfc8554))

### [1.3.1](https://www.github.com/terraform-google-modules/terraform-google-memorystore/compare/v1.3.0...v1.3.1) (2020-12-22)


### Bug Fixes

* Remove interpolation-only expressions ([#32](https://www.github.com/terraform-google-modules/terraform-google-memorystore/issues/32)) ([f4896f6](https://www.github.com/terraform-google-modules/terraform-google-memorystore/commit/f4896f6b339e98c93937ea71397683847525677d))

## [1.3.0](https://www.github.com/terraform-google-modules/terraform-google-memorystore/compare/v1.2.0...v1.3.0) (2020-08-14)


### Features

* Addition of redis_configs parameter, allowing additional configuration for Redis ([#27](https://www.github.com/terraform-google-modules/terraform-google-memorystore/issues/27)) ([250861a](https://www.github.com/terraform-google-modules/terraform-google-memorystore/commit/250861ae46a4a4e1a431d51162879f234d7daa1f))


### Bug Fixes

* correct logic for setting memcache display name ([#24](https://www.github.com/terraform-google-modules/terraform-google-memorystore/issues/24)) ([97f84ad](https://www.github.com/terraform-google-modules/terraform-google-memorystore/commit/97f84ad6fb50ea56394be660fa0fc82e2acb3bbe))

## [1.2.0](https://www.github.com/terraform-google-modules/terraform-google-memorystore/compare/v1.1.0...v1.2.0) (2020-07-28)


### Features

* Added submodule for cloud memorystore (memcache) ([#22](https://www.github.com/terraform-google-modules/terraform-google-memorystore/issues/22)) ([6067568](https://www.github.com/terraform-google-modules/terraform-google-memorystore/commit/606756829c01d3b15b583debd1e156911f09ae36))

## [1.1.0](https://www.github.com/terraform-google-modules/terraform-google-memorystore/compare/v1.0.0...v1.1.0) (2020-06-11)


### Features

* add missing input, var.connect_mode ([#18](https://www.github.com/terraform-google-modules/terraform-google-memorystore/issues/18)) ([d3c44dd](https://www.github.com/terraform-google-modules/terraform-google-memorystore/commit/d3c44dd217fccb813b84ab2b69566ccb36fb44f8))

## [1.0.0] - 2019-09-24

### Changed
 - Supported version of Terraform is 0.12. [#10]

## [0.1.0] - 2019-01-17

### Added
- Initial module release with basic functionality.

[Unreleased]: https://github.com/terraform-google-modules/terraform-google-memorystore/compare/1.0.0...HEAD
[1.0.0]: https://github.com/terraform-google-modules/terraform-google-memorystore/compare/0.1.0...1.0.0
[0.1.0]: https://github.com/terraform-google-modules/terraform-google-memorystore/releases/tag/0.1.0

[#10]: https://github.com/terraform-google-modules/terraform-google-memorystore/pull/10
