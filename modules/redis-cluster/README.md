# Memorystore Redis Cluster Terraform Module

A Terraform module for creating Google [Memorystore Redis Cluster](https://cloud.google.com/memorystore/docs/cluster/memorystore-for-redis-cluster-overview). It can also create [service connection policies](https://cloud.google.com/vpc/docs/about-service-connection-policies). You can also create service connection policy outside of this module. If you are not creating service connection policy as part of this module then make sure they exist before creating redis cluster. You can find more details [here](https://cloud.google.com/memorystore/docs/cluster/networking).

## Compatibility
This module is meant for use with Terraform 1.3+ and tested using Terraform 1.3+. If you find incompatibilities using Terraform >=1.3, please open an issue.

## Usage

```
module "redis_cluster" {
  source  = "terraform-google-modules/memorystore/google//modules/redis-cluster"
  version = "~> 15.0"

  name    = "test-redis-cluster"
  project_id = var.project_id
  region  = "us-central1"
  network = ["projects/${var.project_id}/global/networks/${var.network_name}"]
  node_type = "REDIS_STANDARD_SMALL"

  redis_configs = {
    maxmemory-policy	= "volatile-ttl"
  }

}
```

Check the [example/](https://github.com/terraform-google-modules/terraform-google-memorystore/tree/master/examples/redis-cluster) directory for more on how to create an encrypted cluster and cross region replica.


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| authorization\_mode | The authorization mode of the Redis cluster. If not provided, auth feature is disabled for the cluster. Default value is AUTH\_MODE\_DISABLED. Possible values are: AUTH\_MODE\_UNSPECIFIED, AUTH\_MODE\_IAM\_AUTH, AUTH\_MODE\_DISABLED | `string` | `"AUTH_MODE_DISABLED"` | no |
| cluster\_role | The role of the cluster in cross cluster replication. Possible values are: CLUSTER\_ROLE\_UNSPECIFIED, NONE, PRIMARY, SECONDARY | `string` | `null` | no |
| deletion\_protection\_enabled | Indicates if the cluster is deletion protected or not. If the value if set to true, any delete cluster operation will fail. Default value is true | `bool` | `true` | no |
| enable\_apis | Flag for enabling memcache.googleapis.com in your project | `bool` | `true` | no |
| kms\_key | The KMS key used to encrypt the at-rest data of the cluster | `string` | `null` | no |
| name | The ID of the instance or a fully qualified identifier for the instance. must be 1 to 63 characters and use only lowercase letters, numbers, or hyphens. It must start with a lowercase letter and end with a lowercase letter or number | `string` | n/a | yes |
| network | List of consumer network where the network address of the discovery endpoint will be reserved, in the form of projects/{network\_project\_id\_or\_number}/global/networks/{network\_id}. Currently, only one item is supported | `list(string)` | n/a | yes |
| node\_type | The nodeType for the Redis cluster. If not provided, REDIS\_HIGHMEM\_MEDIUM will be used as default Possible values are: REDIS\_SHARED\_CORE\_NANO, REDIS\_HIGHMEM\_MEDIUM, REDIS\_HIGHMEM\_XLARGE, REDIS\_STANDARD\_SMALL. | `string` | `null` | no |
| persistence\_config | Persistence config (RDB, AOF) for the cluster | <pre>object({<br>    mode = optional(string, "PERSISTENCE_MODE_UNSPECIFIED")<br>    rdb_config = optional(object({<br>      rdb_snapshot_period     = optional(string)<br>      rdb_snapshot_start_time = optional(string)<br>    }), null)<br>    aof_config = optional(object({<br>      append_fsync = optional(string)<br>    }))<br>  })</pre> | `null` | no |
| primary\_cluster | primary cluster that is used as the replication source for this secondary cluster. This is allowed to be set only for clusters whose cluster role is of type SECONDARY. Format: projects/{project}/locations/{region}/clusters/{cluster-id} | `string` | `null` | no |
| project\_id | The ID of the project in which the resource belongs to. | `string` | n/a | yes |
| redis\_configs | Configure Redis Cluster behavior using a subset of native Redis configuration parameters | <pre>object({<br>    maxmemory-clients       = optional(string)<br>    maxmemory               = optional(string)<br>    maxmemory-policy        = optional(string)<br>    notify-keyspace-events  = optional(string)<br>    slowlog-log-slower-than = optional(number)<br>    maxclients              = optional(number)<br>  })</pre> | `null` | no |
| region | The name of the region of the Redis cluster | `string` | n/a | yes |
| replica\_count | The number of replica nodes per shard. Each shard can have 0, 1, or 2 replica nodes. Replicas provide high availability and additional read throughput, and are evenly distributed across zones | `number` | `0` | no |
| secondary\_clusters | List of secondary clusters that are replicating from this primary cluster. This is allowed to be set only for clusters whose cluster role is of type PRIMARY. Format: projects/{project}/locations/{region}/clusters/{cluster-id} | `list(string)` | `[]` | no |
| service\_connection\_policies | The Service Connection Policies to create | <pre>map(object({<br>    description     = optional(string)<br>    network_name    = string<br>    network_project = string<br>    subnet_names    = list(string)<br>    limit           = optional(number)<br>    labels          = optional(map(string), {})<br>  }))</pre> | `{}` | no |
| shard\_count | Required. Number of shards for the Redis cluster. The minimum number of shards in a Memorystore cluster is 3 shards | `number` | `3` | no |
| transit\_encryption\_mode | The in-transit encryption for the Redis cluster. If not provided, encryption is disabled for the cluster. Default value is TRANSIT\_ENCRYPTION\_MODE\_DISABLED. Possible values are: TRANSIT\_ENCRYPTION\_MODE\_UNSPECIFIED, TRANSIT\_ENCRYPTION\_MODE\_DISABLED, TRANSIT\_ENCRYPTION\_MODE\_SERVER\_AUTHENTICATION | `string` | `"TRANSIT_ENCRYPTION_MODE_DISABLED"` | no |
| weekly\_maintenance\_window | Configure Redis Cluster behavior using a subset of native Redis configuration parameters | <pre>object({<br>    day_of_the_week = optional(string, "DAY_OF_WEEK_UNSPECIFIED")<br>    hours           = optional(string)<br>    minutes         = optional(string)<br>    seconds         = optional(string)<br>    nanos           = optional(number)<br>  })</pre> | `null` | no |
| zone\_distribution\_config\_mode | The mode for zone distribution for Memorystore Redis cluster (Immutable). If not provided, MULTI\_ZONE will be used as default value. Possible values are: MULTI\_ZONE, SINGLE\_ZONE | `string` | `"MULTI_ZONE"` | no |
| zone\_distribution\_config\_zone | The zone for single zone Memorystore Redis cluster (Immutable) | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| discovery\_endpoints | Endpoints created on each given network, for Redis clients to connect to the cluster. Currently only one endpoint is supported |
| id | The redis cluster instance ID |
| psc\_connections | PSC connections for discovery of the cluster topology and accessing the cluster |
| psc\_service\_attachments | The PSC service attachments of the cluster |
| redis\_cluster | The redis cluster created |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

These sections describe requirements for using this module.

### Software

The following dependencies must be available:

- [Terraform][terraform] v1.3+
- [Terraform Provider for GCP][terraform-provider-gcp] plugin v6.22+

### Service Account

Following roles contain permissions to deploy resource.

- Cloud Memorystore Redis Admin: `roles/redis.admin`
- Compute Network Admin: `roles/compute.networkAdmin`

### Enable API's
In order to operate with the Service Account you must activate the following API on the project where the Service Account was created:

- Memorystore for Redis API - `redis.googleapis.com`
- Service Consumer Management API - `serviceconsumermanagement.googleapis.com`
- Network Connectivity API - `networkconnectivity.googleapis.com`
- Compute Engine API - `compute.googleapis.com`
- Cloud KMS API`cloudkms.googleapis.com`

