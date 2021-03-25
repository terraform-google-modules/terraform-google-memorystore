# Redis Test

This test will create a new redis instance.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alternative\_location\_id | Alternate Zone to create test instance. | `string` | `"us-east1-d"` | no |
| auth\_enabled | Indicates whether OSS Redis AUTH is enabled for the instance. If set to true AUTH is enabled on the instance. | `bool` | `true` | no |
| auth\_string | AUTH String set on the instance. This field will only be populated if auth\_enabled is true | `string` | `null` | no |
| location\_id | Zone to create test instance. | `string` | `"us-east1-b"` | no |
| memory\_size\_gb | Memory size of test instance. | `number` | `1` | no |
| name | Name of redis instance. | `string` | `"test-redis"` | no |
| project\_id | Google cloud project id to create redis instance. | `string` | n/a | yes |
| region | Region to create test instance. | `string` | `"us-east1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| alternative\_location\_id | n/a |
| auth\_enabled | n/a |
| auth\_string | n/a |
| location\_id | n/a |
| memory\_size\_gb | n/a |
| name | n/a |
| output\_current\_location\_id | n/a |
| output\_host | n/a |
| output\_id | n/a |
| output\_region | n/a |
| project\_id | n/a |
| region | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
