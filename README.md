# terraform-google-memorystore

This module was generated from [terraform-google-module-template](https://github.com/terraform-google-modules/terraform-google-module-template/), which by default generates a module that simply creates a GCS bucket. As the module develops, this README should be updated.

The resources/services/activations/deletions that this module will create/trigger are:

- Create a GCS bucket with the provided name

## Usage

Basic usage of this module is as follows:

```hcl
module "memorystore" {
  source  = "terraform-google-modules/memorystore/google"
  version = "~> 0.1"

  project_id  = "<PROJECT ID>"
  bucket_name = "gcs-test-bucket"
}
```

Functional examples are included in the
[examples](./examples/) directory.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| alternative\_location\_id | The alternative zone where the instance will be provisioned. | string | `"null"` | no |
| authorized\_network | The full name of the Google Compute Engine network to which the instance is connected. If left unspecified, the default network will be used. | string | `"null"` | no |
| display\_name | An arbitrary and optional user-provided name for the instance. | string | `"null"` | no |
| enable\_apis | Enable required APIs for Cloud Memorystore. | bool | `"true"` | no |
| labels | The resource labels to represent user provided metadata. | map(string) | `"null"` | no |
| location\_id | The zone where the instance will be provisioned. If not provided, the service will choose a zone for the instance. For STANDARD_HA tier, instances will be created across two zones for protection against zonal failures. If [alternativeLocationId] is also provided, it must be different from [locationId]. | string | `"null"` | no |
| memory\_size\_gb | Redis memory size in GiB. Defaulted to 1 GiB | number | `"1"` | no |
| name | The ID of the instance or a fully qualified identifier for the instance. | string | n/a | yes |
| project | The ID of the project in which the resource belongs to. | string | n/a | yes |
| redis\_version | The version of Redis software. | string | `"null"` | no |
| region | The GCP region to use. | string | `"null"` | no |
| reserved\_ip\_range | The CIDR range of internal addresses that are reserved for this instance. | string | `"null"` | no |
| tier | The service tier of the instance. https://cloud.google.com/memorystore/docs/redis/reference/rest/v1/projects.locations.instances#Tier | string | `"STANDARD_HA"` | no |

## Outputs

| Name | Description |
|------|-------------|
| current\_location\_id | The current zone where the Redis endpoint is placed. |
| host | The IP address of the instance. |
| id | The memorystore instance ID. |
| region | The region the instance lives in. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

These sections describe requirements for using this module.

### Software

The following dependencies must be available:

- [Terraform][terraform] v0.12
- [Terraform Provider for GCP][terraform-provider-gcp] plugin v2.0

### Service Account

A service account with the following roles must be used to provision
the resources of this module:

- Storage Admin: `roles/storage.admin`

The [Project Factory module][project-factory-module] and the
[IAM module][iam-module] may be used in combination to provision a
service account with the necessary roles applied.

### APIs

A project with the following APIs enabled must be used to host the
resources of this module:

- Google Cloud Storage JSON API: `storage-api.googleapis.com`

The [Project Factory module][project-factory-module] can be used to
provision a project with the necessary APIs enabled.

## Contributing

Refer to the [contribution guidelines](./CONTRIBUTING.md) for
information on contributing to this module.

[iam-module]: https://registry.terraform.io/modules/terraform-google-modules/iam/google
[project-factory-module]: https://registry.terraform.io/modules/terraform-google-modules/project-factory/google
[terraform-provider-gcp]: https://www.terraform.io/docs/providers/google/index.html
[terraform]: https://www.terraform.io/downloads.html
