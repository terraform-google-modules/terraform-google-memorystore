# Upgrading to v11.0

The v11.0 release contains backwards-incompatible changes.

## Minimum Provider Version
This update requires upgrading the terraform provider version to `6+` for redis cluster sub-module.

## Parameter deletion_protection_enabled default value in redis cluster
Added support for [deletion_protection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/version_6_upgrade#resource-google_redis_cluster). Default value for `deletion_protection_enabled` is set to `true`.
