# Minimal Test

This test with create a new redis instance.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| auth\_enabled | Indicates whether OSS Redis AUTH is enabled for the instance. If set to true AUTH is enabled on the instance. | bool | `"true"` | no |
| auth\_string | AUTH String set on the instance. This field will only be populated if auth_enabled is true | string | `"null"` | no |
| location\_id | Zone to create test instance. | string | `"us-east1-b"` | no |
| memory\_size\_gb | Memory size of test instance. | number | `"1"` | no |
| name | Name of redis instance. | string | `"test-redis"` | no |
| project\_id | Google cloud project id to create redis instance. | string | n/a | yes |
| region | Region to create test instance. | string | `"us-east1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| location\_id |  |
| memory\_size\_gb |  |
| name |  |
| output\_current\_location\_id |  |
| output\_host |  |
| output\_id |  |
| output\_region |  |
| project\_id |  |
| region |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
