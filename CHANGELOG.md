# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this
project adheres to [Semantic Versioning](http://semver.org/).

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
