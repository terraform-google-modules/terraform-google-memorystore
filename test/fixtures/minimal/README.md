# Minimal Test

This test with create a new redis instance.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| credentials\_path | Path to service account key (usually credentials.json). | string | n/a | yes |
| location\_id | Zone to create test instance. | string | `"us-east1-b"` | no |
| memory\_size\_gb | Memory size of test instance. | number | `"1"` | no |
| name | Name of redis instance. | string | `"test-minimal"` | no |
| project\_id | Google cloud project id to create redis instance. | string | n/a | yes |
| region | Region to create test instance. | string | `"us-east1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| credentials\_path | Path to service account key (usually credentials.json). |
| location\_id | Zone to create test instance. |
| memory\_size\_gb | Memory size of test instance. |
| name | Name of redis instance. |
| output\_current\_location\_id | The current zone where the Redis endpoint is placed. |
| output\_host | The memorystore instance ID. |
| output\_id | The memorystore instance ID. |
| output\_region | The region the instance lives in. |
| project\_id | Google cloud project id to create redis instance. |
| region | Region to create test instance. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
