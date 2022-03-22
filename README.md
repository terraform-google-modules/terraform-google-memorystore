# [Google Cloud Memorystore Terraform Module](https://registry.terraform.io/modules/terraform-google-modules/memorystore/google/)

A Terraform module for creating a fully functional Google Memorystore (redis) instance.

## Compatibility
This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't
[upgraded](https://www.terraform.io/upgrade-guides/0-13.html) and need a Terraform
0.12.x-compatible version of this module, the last released version
intended for Terraform 0.12.x is [v2.0.0](https://registry.terraform.io/modules/terraform-google-modules/-memorystore/google/v2.0.0).

## Usage

Check the [examples/](./examples/) directory for more.

```hcl
module "memorystore" {
  source  = "terraform-google-modules/memorystore/google"
  version = "4.0.0"

  name    = "my-memorystore"
  project = "my-gcp-project"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alternative\_location\_id | The alternative zone where the instance will be provisioned. | `string` | `null` | no |
| auth\_enabled | Indicates whether OSS Redis AUTH is enabled for the instance. If set to true AUTH is enabled on the instance. | `bool` | `false` | no |
| authorized\_network | The full name of the Google Compute Engine network to which the instance is connected. If left unspecified, the default network will be used. | `string` | `null` | no |
| connect\_mode | The connection mode of the Redis instance. Can be either DIRECT\_PEERING or PRIVATE\_SERVICE\_ACCESS. The default connect mode if not provided is DIRECT\_PEERING. | `string` | `null` | no |
| display\_name | An arbitrary and optional user-provided name for the instance. | `string` | `null` | no |
| enable\_apis | Flag for enabling redis.googleapis.com in your project | `bool` | `true` | no |
| labels | The resource labels to represent user provided metadata. | `map(string)` | `null` | no |
| location\_id | The zone where the instance will be provisioned. If not provided, the service will choose a zone for the instance. For STANDARD\_HA tier, instances will be created across two zones for protection against zonal failures. If [alternativeLocationId] is also provided, it must be different from [locationId]. | `string` | `null` | no |
| maintenance\_policy\_day | The day of week that maintenance updates occur.<br>(days are are "DAY\_OF\_WEEK\_UNSPECIFIED", "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY" or "SUNDAY") | `string` | `""` | no |
| maintenance\_policy\_start\_time\_hours | Start time of the window in UTC time. Hours of day in 24 hour format. Should be from 0 to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time. | `number` | `null` | no |
| maintenance\_policy\_start\_time\_minutes | Start time of the window in UTC time. Minutes of hour of day. Must be from 0 to 59. | `number` | `0` | no |
| maintenance\_policy\_start\_time\_nanos | Start time of the window in UTC time. Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999 | `number` | `0` | no |
| maintenance\_policy\_start\_time\_seconds | Start time of the window in UTC time. Seconds of minutes of the time. Must normally be from 0 to 59. An API may allow the value 60 if it allows leap-seconds. | `number` | `0` | no |
| memory\_size\_gb | Redis memory size in GiB. Defaulted to 1 GiB | `number` | `1` | no |
| name | The ID of the instance or a fully qualified identifier for the instance. | `string` | n/a | yes |
| project | The ID of the project in which the resource belongs to. | `string` | n/a | yes |
| redis\_configs | The Redis configuration parameters. See [more details](https://cloud.google.com/memorystore/docs/redis/reference/rest/v1/projects.locations.instances#Instance.FIELDS.redis_configs) | `map(any)` | `{}` | no |
| redis\_version | The version of Redis software. | `string` | `null` | no |
| region | The GCP region to use. | `string` | `null` | no |
| reserved\_ip\_range | The CIDR range of internal addresses that are reserved for this instance. | `string` | `null` | no |
| tier | The service tier of the instance. https://cloud.google.com/memorystore/docs/redis/reference/rest/v1/projects.locations.instances#Tier | `string` | `"STANDARD_HA"` | no |
| transit\_encryption\_mode | The TLS mode of the Redis instance, If not provided, TLS is enabled for the instance. | `string` | `"SERVER_AUTHENTICATION"` | no |

## Outputs

| Name | Description |
|------|-------------|
| auth\_string | AUTH String set on the instance. This field will only be populated if auth\_enabled is true. |
| current\_location\_id | The current zone where the Redis endpoint is placed. |
| host | The IP address of the instance. |
| id | The memorystore instance ID. |
| persistence\_iam\_identity | Cloud IAM identity used by import/export operations. Format is 'serviceAccount:'. May change over time |
| port | The port number of the exposed Redis endpoint. |
| region | The region the instance lives in. |

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
