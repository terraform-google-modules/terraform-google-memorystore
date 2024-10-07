# Valkey Test

This test will create a new valkey cluster.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_id | Google cloud project id to create valkey cluster. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| authorization\_mode | The valkey cluster authorization mode |
| cluster | The valkey cluster created |
| cluster\_id | The valkey cluster instance ID |
| cluster\_name | The valkey cluster name |
| cluster\_region | The valkey cluster region |
| node\_type | The valkey cluster node type |
| replica\_count | The valkey cluster replica count |
| shard\_count | The valkey cluster shard count |
| size\_gb | The valkey cluster size |
| transit\_encryption\_mode | The valkey cluster transit encryption mode |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
