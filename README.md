# terraform-google-memorystore

A Terraform module for creating a fully functional Google Memorystore (redis) instance.

## Usage

Check the [examples/](./examples/) directory for more.

```hcl
module "memorystore" {
  source  = "terraform-google-modules/memorystore/google"
  version = "0.1.0"

  name    = "my-memorystore"
  project = "my-gcp-project"
}
```

[^]: (autogen_docs_start)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| alternative\_location\_id | The alternative zone where the instance will be provisioned. | string | `` | no |
| authorized\_network | The name of the memorystore authorized network. | string | `` | no |
| display\_name | An arbitrary and optional user-provided name for the instance. | string | `` | no |
| enable\_apis | Enable required APIs for Cloud Memorystore. | string | `true` | no |
| labels | The resource labels to represent user provided metadata. | map | `<map>` | no |
| location\_id | The zone where the instance will be provisioned. | string | `` | no |
| memory\_size\_gb | Redis memory size in GiB. | string | - | yes |
| name | The ID of the instance or a fully qualified identifier for the instance. | string | - | yes |
| project | The ID of the project in which the resource belongs to. | string | - | yes |
| redis\_version | The version of Redis software. | string | `` | no |
| region | The GCP region to use. | string | `` | no |
| reserved\_ip\_range | The CIDR range of internal addresses that are reserved for this instance. | string | `` | no |
| tier | The service tier of the instance. | string | `STANDARD_HA` | no |

## Outputs

| Name | Description |
|------|-------------|
| current\_location\_id | The current zone where the Redis endpoint is placed. |
| host | The IP address of the instance. |
| id | The memorystore instance ID. |
| region | The region the instance lives in. |

[^]: (autogen_docs_end)

## File structure

The project has the following folders and files:

- /: root folder
- /examples: examples for using this module
- /scripts: Scripts for specific tasks on module (see Infrastructure section on this file)
- /test: Folders with files for testing the module (see Testing section on this file)
- /helpers: Optional helper scripts for ease of use
- /main.tf: main file for this module, contains all the resources to create
- /variables.tf: all the variables for the module
- /output.tf: the outputs of the module
- /readme.md: this file

## Testing

### Requirements

- An existing google cloud project
- The `redis.googleapis.com` API should be enabled
- A service account key
- Docker

### Running Integration Tests

Tests are run inside of an existing google cloud project.

1. Create tfvars file for test:

```sh
cp test/fixtures/minimal/terraform.tfvars.example test/fixtures/minimal/terraform.tfvars
```

2. Edit new `test/fixtures/minimal/terraform.tfvars` and add project id to run test in.

3. Copy a service account key (`credentials.json` file) into root of this repo.

4. Run `make test_integration_docker`.

## Autogeneration of documentation from .tf files

Run:

```
make generate_docs
```