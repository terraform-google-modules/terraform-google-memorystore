/**
 * Copyright 2019 Google LLC
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

provider "google-beta" {
}

module "private-service-access" {
  source      = "GoogleCloudPlatform/sql-db/google//modules/private_service_access"
  version     = "~> 4.5"
  project_id  = var.project
  vpc_network = "default"
}

module "memcache" {
  source         = "../../modules/memcache"
  name           = var.name
  project        = can(module.private-service-access.peering_completed) ? var.project : ""
  memory_size_mb = var.memory_size_mb
  enable_apis    = var.enable_apis
  cpu_count      = var.cpu_count
  region         = var.region
}
