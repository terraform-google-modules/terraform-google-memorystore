# terraform-google-memorystore

A Terraform module for creating a fully functional Google Memorystore (redis) instance.

## Usage

The examples folder contains usage examples.

[^]: (autogen_docs_start)


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| alternative_location_id | The alternative zone where the instance will be provisioned | string | `us-east1-d` | no |
| authorized_network | The name of the memorystore authorized network | string | `default` | no |
| display_name | An arbitrary and optional user-provided name for the instance | string | `` | no |
| labels | The resource labels to represent user provided metadata | string | `<map>` | no |
| location_id | The zone where the instance will be provisioned | string | `us-east1-b` | no |
| memory_size_gb | The memory size in GiB | string | `1` | no |
| name | The name of the memorystore instance | string | - | yes |
| project | The id of the project in which the resource belongs to | string | - | yes |
| redis_version | The version of Redis software | string | `REDIS_3_2` | no |
| region | The GCP region to use | string | `us-east1` | no |
| reserved_ip_range | The CIDR range of internal addresses that are reserved for this instance | string | `192.168.0.0/29` | no |
| tier | The service tier of the instance | string | `STANDARD_HA` | no |

## Outputs

| Name | Description |
|------|-------------|
| host | The IP address of the instance |
| id | The memorystore instance id |
| region | The region the instance lives in |

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