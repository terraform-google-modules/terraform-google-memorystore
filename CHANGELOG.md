# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this
project adheres to [Semantic Versioning](http://semver.org/).

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
