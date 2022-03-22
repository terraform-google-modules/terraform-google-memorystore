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
| maintenance\_policy\_day | The day of week that maintenance updates occur.<br>(days are are "DAY\_OF\_WEEK\_UNSPECIFIED", "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY" or "SUNDAY") | `string` | `"DAY_OF_WEEK_UNSPECIFIED"` | no |
| maintenance\_policy\_duration | Duration of the maintenance window. The current window is fixed at 1 hour. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | `string` | `"1h"` | no |
| maintenance\_policy\_start\_time\_hours | Start time of the window in UTC time. Hours of day in 24 hour format. Should be from 0 to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time. | `number` | `1` | no |
| maintenance\_policy\_start\_time\_minutes | Start time of the window in UTC time. Minutes of hour of day. Must be from 0 to 59. | `number` | `0` | no |
| maintenance\_policy\_start\_time\_nanos | Start time of the window in UTC time. Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999 | `number` | `0` | no |
| maintenance\_policy\_start\_time\_seconds | Start time of the window in UTC time. Seconds of minutes of the time. Must normally be from 0 to 59. An API may allow the value 60 if it allows leap-seconds. | `number` | `0` | no |
| memory\_size\_gb | Memory size of test instance. | `number` | `1` | no |
| name | Name of redis instance. | `string` | `"test-redis"` | no |
| project\_id | Google cloud project id to create redis instance. | `string` | n/a | yes |
| region | Region to create test instance. | `string` | `"us-east1"` | no |
| transit\_encryption\_mode | The TLS mode of the Redis instance, If not provided, TLS is disabled for the instance. | `string` | `"SERVER_AUTHENTICATION"` | no |

## Outputs

| Name | Description |
|------|-------------|
| alternative\_location\_id | n/a |
| auth\_enabled | n/a |
| auth\_string | n/a |
| location\_id | n/a |
| memory\_size\_gb | n/a |
| name | n/a |
| output\_auth\_string | n/a |
| output\_current\_location\_id | n/a |
| output\_host | n/a |
| output\_id | n/a |
| output\_region | n/a |
| project\_id | n/a |
| region | n/a |
| transit\_encryption\_mode | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
