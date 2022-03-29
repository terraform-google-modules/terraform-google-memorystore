# Minimal Test

This test will create a new redis instance.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| location\_id | Zone to create test instance. | `string` | `"us-east1-b"` | no |
| memory\_size\_gb | Memory size of test instance. | `number` | `1` | no |
| name | Name of redis instance. | `string` | `"test-minimal"` | no |
| project\_id | Google cloud project id to create redis instance. | `string` | n/a | yes |
| region | Region to create test instance. | `string` | `"us-east1"` | no |
| tier | The service tier of the instance. https://cloud.google.com/memorystore/docs/redis/reference/rest/v1/projects.locations.instances#Tier | `string` | `"BASIC"` | no |

## Outputs

| Name | Description |
|------|-------------|
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
