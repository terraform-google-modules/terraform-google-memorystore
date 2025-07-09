# Memorystore Valkey Terraform Module

A Terraform module for creating Google [Memorystore for Valkey](https://cloud.google.com/memorystore/docs/valkey/product-overview). It can also create [service connection policies](https://cloud.google.com/vpc/docs/about-service-connection-policies). You can also create service connection policy outside of this module. If you are not creating service connection policy as part of this module then make sure they exist before creating valkey cluster. You can find more details [here](https://cloud.google.com/memorystore/docs/valkey/networking)

## Compatibility
This module is meant for use with Terraform 1.3+ and tested using Terraform 1.3+. If you find incompatibilities using Terraform >=1.3, please open an issue.

## Usage

```
module "valkey_cluster" {
  source  = "terraform-google-modules/memorystore/google//modules/valkey"
  version = "~> 15.0"

  instance_id                 = "test-valkey-cluster"
  project                     = var.project_id
  location                    = "us-central1"
  node_type                   = "HIGHMEM_MEDIUM"
  deletion_protection_enabled = false
  engine_version              = "VALKEY_8_0"

  network         = "valkey-network"

  service_connection_policies = {
    test-net-valkey-cluster-scp = {
      subnet_names = [
        "valkey-subnet-100",
        "valkey-subnet-101",
      ]
    }
  }

  engine_configs = {
    maxmemory-policy = "volatile-ttl"
  }
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| authorization\_mode | The Immutable. Authorization mode of the instance. Possible values: AUTH\_DISABLED IAM\_AUTH | `string` | `"AUTH_DISABLED"` | no |
| automated\_backup\_config | The automated backup config for a instance | <pre>object({<br>    start_time = string<br>    retention  = string<br>  })</pre> | `null` | no |
| deletion\_protection\_enabled | If set to true deletion of the instance will fail | `bool` | `true` | no |
| enable\_apis | Flag for enabling memcache.googleapis.com in your project | `bool` | `false` | no |
| engine\_configs | User-provided engine configurations for the instance | <pre>object({<br>    maxmemory               = optional(string)<br>    maxmemory-clients       = optional(string)<br>    maxmemory-policy        = optional(string)<br>    notify-keyspace-events  = optional(string)<br>    slowlog-log-slower-than = optional(number)<br>    maxclients              = optional(number)<br>  })</pre> | `null` | no |
| engine\_version | Engine version of the instance | `string` | `"VALKEY_8_0"` | no |
| gcs\_source | GCS source for the instance. Format gs://bucket1/object1, gs://bucket2/folder2/object2 | `string` | `null` | no |
| instance\_id | The ID to use for the instance, which will become the final component of the instance's resource name. Must be 4-63 characters in length with lowercase letters, digits, and hyphens. Must not end with a hyphen. Must be unique within a location | `string` | n/a | yes |
| labels | The resource labels to represent user provided metadata. | `map(string)` | `{}` | no |
| location | The region where valkey cluster will be created | `string` | n/a | yes |
| managed\_backup\_source | Managed backup source for the instance. Format projects/{project}/locations/{location}/backupCollections/{collection}/backups/{backup} | `string` | `null` | no |
| mode | cluster or cluster-disabled. Possible values: CLUSTER, CLUSTER\_DISABLED | `string` | `null` | no |
| network | Name of the consumer network where the network address of the discovery endpoint will be reserved | `string` | n/a | yes |
| network\_project | project ID of the consumer network where the network address of the discovery endpoint will be reserved. Required for Shared VPC host | `string` | `null` | no |
| node\_type | The nodeType for the valkey cluster. Possible values are: SHARED\_CORE\_NANO, HIGHMEM\_MEDIUM, HIGHMEM\_XLARGE, STANDARD\_SMALL | `string` | `null` | no |
| persistence\_config | User-provided persistence configurations for the instance | <pre>object({<br>    mode = optional(string)<br>    rdb_config = optional(object({<br>      rdb_snapshot_period     = optional(string)<br>      rdb_snapshot_start_time = optional(string)<br>    }), null)<br>    aof_config = optional(object({<br>      append_fsync = string<br>    }), null)<br>  })</pre> | `{}` | no |
| project\_id | The ID of the project in which the resource belongs to. | `string` | n/a | yes |
| replica\_count | Number of replica nodes per shard. If omitted the default is 0 replicas | `number` | `0` | no |
| service\_connection\_policies | The Service Connection Policies to create. Required to create service connection policy. Not needed if service connection policy already exist | <pre>map(object({<br>    subnet_names = list(string)<br>    description  = optional(string)<br>    limit        = optional(number)<br>    labels       = optional(map(string), {})<br>  }))</pre> | `{}` | no |
| shard\_count | Number of shards for the instance | `number` | `3` | no |
| transit\_encryption\_mode | Immutable. In-transit encryption mode of the instance. Possible values: TRANSIT\_ENCRYPTION\_DISABLED SERVER\_AUTHENTICATION | `string` | `"TRANSIT_ENCRYPTION_DISABLED"` | no |
| weekly\_maintenance\_window | Maintenance window that is applied to resources covered by this policy. Minimum 1. For the current version, the maximum number of weekly\_window is expected to be one. Possible values for day\_of\_the\_week are: DAY\_OF\_WEEK\_UNSPECIFIED, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY | <pre>list(object({<br>    day_of_week        = string<br>    start_time_hour    = optional(string)<br>    start_time_minutes = optional(string)<br>    start_time_seconds = optional(string)<br>    start_time_nanos   = optional(string)<br>  }))</pre> | `null` | no |
| zone\_distribution\_config\_mode | The mode for zone distribution for Memorystore valkey cluster (Immutable). If not provided, MULTI\_ZONE will be used as default value. Possible values are: MULTI\_ZONE, SINGLE\_ZONE | `string` | `"MULTI_ZONE"` | no |
| zone\_distribution\_config\_zone | The zone for single zone Memorystore valkey cluster (Immutable) | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| endpoints | Endpoints created on each given network, for valkey clients to connect to the cluster. |
| id | The valkey cluster instance ID |
| valkey\_cluster | The valkey cluster created |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

These sections describe requirements for using this module.

### Software

The following dependencies must be available:

- [Terraform][terraform] v1.3+
- [Terraform Provider for GCP][terraform-provider-gcp] plugin v6.20+

### Service Account

Following roles contain permissions to deploy resource.

- Cloud Memorystore valkey Admin: `roles/memorystore.admin`
- Compute Network Admin: `roles/compute.networkAdmin`

### Enable API's
In order to operate with the Service Account you must activate the following API on the project where the Service Account was created:

- Memorystore for valkey API - `memorystore.googleapis.com`
- Service Consumer Management API - `serviceconsumermanagement.googleapis.com`
- Network Connectivity API - `networkconnectivity.googleapis.com`
- Compute Engine API - `compute.googleapis.com`

