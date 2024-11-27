# Google Cloud Memorystore Terraform Module
[terraform registry](https://registry.terraform.io/modules/terraform-google-modules/memorystore/google/)

A Terraform module for creating a fully functional Google Memorystore Redis instance. For other memory store engine use [sub-modules](https://github.com/terraform-google-modules/terraform-google-memorystore/tree/master/modules).

- Memcache [sub-modules](https://github.com/terraform-google-modules/terraform-google-memorystore/tree/master/modules/memcache)
- Redis Cluster [sub-modules](https://github.com/terraform-google-modules/terraform-google-memorystore/tree/master/modules/redis-cluster)
- Valkey [sub-modules](https://github.com/terraform-google-modules/terraform-google-memorystore/tree/master/modules/valkey)

## Compatibility
This module is meant for use with Terraform 1.3+ and tested using Terraform 1.3+. If you find incompatibilities using Terraform >=1.3, please open an issue.

If you haven't [upgraded](https://www.terraform.io/upgrade-guides/0-13.html) and need a Terraform
0.12.x-compatible version of this module, the last released version intended for Terraform 0.12.x is [v2.0.0](https://registry.terraform.io/modules/terraform-google-modules/-memorystore/google/v2.0.0).

## Version

Current version is 11.0. Upgrade guides:

- [7.X -> 8.0](/docs/upgrading_to_v8.0.md)
- [8.X -> 9.0](/docs/upgrading_to_v9.0.md)
- [10.X -> 11.0](/docs/upgrading_to_v11.0.md)

## Usage

Check the [examples/](https://github.com/terraform-google-modules/terraform-google-memorystore/tree/master/examples) directory for more.

```hcl
module "memorystore" {
  source  = "terraform-google-modules/memorystore/google"
  version = "~> 12.0"

  name           = "memorystore"
  project_id     = "memorystore"
  memory_size_gb = "1"
  enable_apis    = "true"
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
| customer\_managed\_key | Default encryption key to apply to the Redis instance. Defaults to null (Google-managed). | `string` | `null` | no |
| display\_name | An arbitrary and optional user-provided name for the instance. | `string` | `null` | no |
| enable\_apis | Flag for enabling redis.googleapis.com in your project | `bool` | `true` | no |
| labels | The resource labels to represent user provided metadata. | `map(string)` | `null` | no |
| location\_id | The zone where the instance will be provisioned. If not provided, the service will choose a zone for the instance. For STANDARD\_HA tier, instances will be created across two zones for protection against zonal failures. If [alternativeLocationId] is also provided, it must be different from [locationId]. | `string` | `null` | no |
| maintenance\_policy | The maintenance policy for an instance. | <pre>object({<br>    day = string<br>    start_time = object({<br>      hours   = number<br>      minutes = number<br>      seconds = number<br>      nanos   = number<br>    })<br>  })</pre> | `null` | no |
| memory\_size\_gb | Redis memory size in GiB. Defaulted to 1 GiB | `number` | `1` | no |
| name | The ID of the instance or a fully qualified identifier for the instance. | `string` | n/a | yes |
| persistence\_config | The Redis persistence configuration parameters. https://cloud.google.com/memorystore/docs/redis/reference/rest/v1/projects.locations.instances#persistenceconfig | <pre>object({<br>    persistence_mode    = string<br>    rdb_snapshot_period = string<br>  })</pre> | `null` | no |
| project\_id | The ID of the project in which the resource belongs to. | `string` | n/a | yes |
| read\_replicas\_mode | Read replicas mode. https://cloud.google.com/memorystore/docs/redis/reference/rest/v1/projects.locations.instances#readreplicasmode | `string` | `"READ_REPLICAS_DISABLED"` | no |
| redis\_configs | The Redis configuration parameters. See [more details](https://cloud.google.com/memorystore/docs/redis/reference/rest/v1/projects.locations.instances#Instance.FIELDS.redis_configs) | `map(any)` | `{}` | no |
| redis\_version | The version of Redis software. | `string` | `null` | no |
| region | The GCP region to use. | `string` | `null` | no |
| replica\_count | The number of replicas. can | `number` | `null` | no |
| reserved\_ip\_range | The CIDR range of internal addresses that are reserved for this instance. | `string` | `null` | no |
| secondary\_ip\_range | Optional. Additional IP range for node placement. Required when enabling read replicas on an existing instance. | `string` | `null` | no |
| tier | The service tier of the instance. https://cloud.google.com/memorystore/docs/redis/reference/rest/v1/projects.locations.instances#Tier | `string` | `"STANDARD_HA"` | no |
| transit\_encryption\_mode | The TLS mode of the Redis instance, If not provided, TLS is enabled for the instance. | `string` | `"SERVER_AUTHENTICATION"` | no |

## Outputs

| Name | Description |
|------|-------------|
| apphub\_service\_uri | Service URI in CAIS style to be used by Apphub. |
| auth\_string | AUTH String set on the instance. This field will only be populated if auth\_enabled is true. |
| current\_location\_id | The current zone where the Redis endpoint is placed. |
| env\_vars | Exported environment variables |
| host | The IP address of the instance. |
| id | The memorystore instance ID. |
| persistence\_iam\_identity | Cloud IAM identity used by import/export operations. Format is 'serviceAccount:'. May change over time |
| port | The port number of the exposed Redis endpoint. |
| read\_endpoint | The IP address of the exposed readonly Redis endpoint. |
| region | The region the instance lives in. |
| server\_ca\_certs | List of server CA certificates for the instance |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

These sections describe requirements for using this module.

### Software

The following dependencies must be available:

- [Terraform][terraform] v1.3+
- [Terraform Provider for GCP][terraform-provider-gcp] plugin v4.74+

### Service Account

Following roles contain permissions to deploy resource.

- Cloud Memorystore Redis Admin: `roles/redis.admin`

### Enable API's
In order to operate with the Service Account you must activate the following API on the project where the Service Account was created:

- Compute Engine API - `redis.googleapis.com`

## Contributing

Refer to the [contribution guidelines](./CONTRIBUTING.md) for information on contributing to this module.
