# [Google Cloud Memorystore Terraform Module](https://registry.terraform.io/modules/terraform-google-modules/memorystore/google/)

A Terraform module for creating a fully functional Google Memorystore (redis) instance.

## Compatibility
This module is meant for use with Terraform 0.12. If you haven't [upgraded](https://www.terraform.io/upgrade-guides/0-12.html) and need a Terraform 0.11.x-compatible version of this module, the last released version intended for Terraform 0.11.x
is [0.1.0](https://registry.terraform.io/modules/terraform-google-modules/memorystore/google/0.1.0).

## Usage

Check the [examples/](./examples/) directory for more.

```hcl
module "memorystore" {
  source  = "terraform-google-modules/memorystore/google"
  version = "1.0.0"

  name    = "my-memorystore"
  project = "my-gcp-project"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| authorized\_network | The full name of the Google Compute Engine network to which the instance is connected. If left unspecified, the default network will be used. | string | `"null"` | no |
| dns\_project\_id | The project_id where we want to create redis DNS records. If not specified | string | `"null"` | no |
| dns\_record\_prefix | The first part of a DNS record. The implementation here produces DNS records in the following format: `<dns_record_prefix>-<count.index>.<environment>.<zone_domain>.` | string | `"null"` | no |
| enable\_apis | Enable required APIs for Cloud Memorystore. | bool | `"true"` | no |
| instance\_configs | Array of configs for each Redis instance you want to create | object | `<list>` | no |
| labels | The resource labels to represent user provided metadata. | map(string) | `"null"` | no |
| managed\_zone\_name | Name of the DNS zone where the DNS records will be created. | string | `"null"` | no |
| project | The ID of the project in which the resource belongs to. | string | n/a | yes |
| record\_ttl | TTL on the DNS records. | number | `"300"` | no |
| record\_type | DNS record type | string | `"A"` | no |
| redis\_version | The version of Redis software. | string | `"null"` | no |
| tier | The service tier of the instance. https://cloud.google.com/memorystore/docs/redis/reference/rest/v1/projects.locations.instances#Tier | string | `"STANDARD_HA"` | no |

## Outputs

| Name | Description |
|------|-------------|
| current\_location\_ids | The current zones where the Redis endpoint is placed. |
| hosts | The IP addresses of the instances. |
| ids | The memorystore instance IDs. |
| regions | The regions the instances live in. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## File structure

The project has the following folders and files:

- /: root folder
- /examples: examples for using this module
- /scripts: Scripts for specific tasks on module (see Infrastructure section on this file)
- /test: Folders with files for testing the module (see Testing section on this file)
- /helpers: Optional helper scripts for ease of use
- /main.tf: main file for this module, contains all the resources to create
- /variables.tf: all the variables for the module
- /output.tf: the outputs of the module
- /readme.md: this file
