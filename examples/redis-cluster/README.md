# Redis Test

This test will create a new redis cluster.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_id | Google cloud project id to create redis cluster. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| authorization\_mode | The redis cluster authorization mode |
| cluster\_id | The redis cluster instance ID |
| cluster\_name | The redis cluster name |
| cluster\_region | The redis cluster region |
| project\_id | The redis cluster Project ID |
| replica\_count | The redis cluster replica count |
| shard\_count | The redis cluster shard count |
| size\_gb | The redis cluster size |
| transit\_encryption\_mode | The redis cluster transit encryption mode |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
