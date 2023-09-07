# GCP REDIS Backup

## Exports to GCS

Allow to export Redis data to a bucket. 

### Deleting old exports

The export workflow does not take care about deleting old backups. Please take care about that yourself.
You can use [Object Lifecycle Management](https://cloud.google.com/storage/docs/lifecycle) to delete old exports.

## Required APIs

- `workflows.googleapis.com`
- `cloudscheduler.googleapis.com`

## Monitoring

Monitoring your exports is not part of this module.
Please ensure that you monitor for failed workflows to ensure you have regular backups/exports.

A good metric could be to monitor for workflow executions that not succeeded:

```mql
fetch workflows.googleapis.com/Workflow
| metric 'workflows.googleapis.com/finished_execution_count'
| filter (metric.status != 'SUCCEEDED')
| group_by 1d,
    [value_finished_execution_count_mean: mean(value.finished_execution_count)]
| every 1d
| condition val() > 0 '1'
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| export\_schedule | The cron schedule to execute the export to GCS | `string` | `"15 3 * * *"` | no |
| export\_uri | The bucket and path uri for exporting to GCS | `string` | n/a | yes |
| project\_id | The project ID | `string` | n/a | yes |
| region | The region where to run the workflow | `string` | `"us-central1"` | no |
| scheduler\_timezone | The Timezone in which the Scheduler Jobs are triggered | `string` | `"Etc/GMT"` | no |
| service\_account | The service account to use for running the workflow and triggering the workflow by Cloud Scheduler - If empty or null a service account will be created. If you have provided a service account you need to grant the REDIS Admin and the Workflows Invoker role to that | `string` | `null` | no |
| redis\_instance | The name of the REDIS instance to backup | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| export\_workflow\_name | The name for export workflow |
| region | The region for running the scheduler and workflow |
| service\_account | The service account email running the scheduler and workflow |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
