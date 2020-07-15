# [Google Cloud Memorystore Terraform Module](https://registry.terraform.io/modules/terraform-google-modules/memorystore/google/)

A Terraform module for creating a fully functional Google Memorystore (memcache) instance.

## Compatibility
This module is meant for use with Terraform 0.12. If you haven't [upgraded](https://www.terraform.io/upgrade-guides/0-12.html) and need a Terraform 0.11.x-compatible version of this module, the last released version intended for Terraform 0.11.x
is [0.1.0](https://registry.terraform.io/modules/terraform-google-modules/memorystore/google/0.1.0).



<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| authorized\_network | The full name of the Google Compute Engine network to which the instance is connected. If left unspecified, the default network will be used. | string | `"null"` | no |
| cpu\_count | Number of CPUs per node | number | `"1"` | no |
| display\_name | An arbitrary and optional user-provided name for the instance. | string | `"null"` | no |
| enable\_apis | Flag for enabling memcache.googleapis.com in your project | bool | `"true"` | no |
| labels | The resource labels to represent user provided metadata. | map(string) | `"null"` | no |
| memory\_size\_mb | Memcache memory size in MiB. Defaulted to 1024 | number | `"1024"` | no |
| name | The ID of the instance or a fully qualified identifier for the instance. | string | n/a | yes |
| node\_count | Number of nodes in the memcache instance. | number | `"1"` | no |
| params | Parameters for the memcache process | map(string) | `"null"` | no |
| project | The ID of the project in which the resource belongs to. | string | n/a | yes |
| region | The GCP region to use. | string | `"null"` | no |
| reserved\_ip\_range | The CIDR range of internal addresses that are reserved for this instance. | string | `"null"` | no |
| zones | Zones where memcache nodes should be provisioned. If not provided, all zones will be used. | list(string) | `"null"` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The memorystore instance ID. |
| region | The region the instance lives in. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
