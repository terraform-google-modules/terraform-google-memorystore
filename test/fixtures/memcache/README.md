# Minimal Test

This test with create a new memcache instance.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu\_count | Number of cpu's for test instance. | number | `"1"` | no |
| memory\_size\_mb | Memory size of test instance. | number | `"1024"` | no |
| name | Name of memcache instance. | string | `"test-memcache"` | no |
| project\_id | Google cloud project id to create memcache instance. | string | n/a | yes |
| region | Region to create test instance. | string | `"us-east1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| cpu\_count |  |
| memory\_size\_mb |  |
| name |  |
| output\_id |  |
| output\_region |  |
| project\_id |  |
| region |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
