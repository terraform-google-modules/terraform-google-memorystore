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
| maintenance\_policy\_day | The day of week that maintenance updates occur.<br>(days are are "DAY\_OF\_WEEK\_UNSPECIFIED", "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY" or "SUNDAY") | `string` | `"MONDAY"` | no |
| maintenance\_policy\_start\_time | Start time of the window in UTC time. Format "hh:mm:ss.nnnnn". | `string` | `"02:34:56.789"` | no |
| memory\_size\_gb | Memory size of test instance. | `number` | `1` | no |
| name | Name of redis instance. | `string` | `"test-redis"` | no |
| project\_id | Google cloud project id to create redis instance. | `string` | n/a | yes |
| region | Region to create test instance. | `string` | `"us-east1"` | no |
| transit\_encryption\_mode | The TLS mode of the Redis instance, If not provided, TLS is disabled for the instance. | `string` | `"SERVER_AUTHENTICATION"` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
