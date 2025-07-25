/**
 * Copyright 2024 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

locals {
  per_module_services = {
    valkey = [
      "redis.googleapis.com",
      "cloudkms.googleapis.com",
      "serviceusage.googleapis.com",
    ]
    redis-cluster = [
      "redis.googleapis.com",
      "cloudkms.googleapis.com",
      "serviceusage.googleapis.com",
    ]
    memcache = [
      "memcache.googleapis.com",
      "redis.googleapis.com",
      "serviceusage.googleapis.com",
    ]
    root = [
      "redis.googleapis.com",
      "memcache.googleapis.com",
      "serviceusage.googleapis.com",
      "iam.googleapis.com",
      "cloudresourcemanager.googleapis.com",
    ]
  }
}

module "project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 18.0"

  name                    = "ci-memory-store"
  random_project_id       = true
  org_id                  = var.org_id
  folder_id               = var.folder_id
  billing_account         = var.billing_account
  default_service_account = "delete"
  auto_create_network     = true
  deletion_policy         = "DELETE"

  activate_apis = concat([
    "serviceconsumermanagement.googleapis.com",
    "networkconnectivity.googleapis.com",
    "compute.googleapis.com",
    "memorystore.googleapis.com",
  ], flatten(values(local.per_module_services)))
}


