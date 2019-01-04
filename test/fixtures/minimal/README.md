# Minimal Test

This test with create a new redis instance.

[^]: (autogen_docs_start)


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| credentials_path | Path to service account key (usually credentials.json). | string | - | yes |
| location_id | Zone to create test instance. | string | `us-east1-b` | no |
| memory_size_gb | Memory size of test instance. | string | `1` | no |
| name | Name of redis instance. | string | `test-minimal` | no |
| project_id | Google cloud project id to create redis instance. | string | - | yes |
| region | Region to create test instance. | string | `us-east1` | no |

## Outputs

| Name | Description |
|------|-------------|
| credentials_path |  |
| location_id |  |
| memory_size_gb |  |
| name |  |
| output_current_location_id |  |
| output_host |  |
| output_id |  |
| output_region |  |
| project_id |  |
| region |  |

[^]: (autogen_docs_end)