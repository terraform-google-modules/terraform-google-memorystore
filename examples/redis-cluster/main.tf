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

module "enable_apis" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "~> 17.0"

  project_id  = var.project_id
  enable_apis = true

  disable_services_on_destroy = false
  disable_dependent_services  = false

  activate_apis = [
    "redis.googleapis.com",
    "serviceconsumermanagement.googleapis.com",
    "networkconnectivity.googleapis.com",
    "compute.googleapis.com",
  ]
}


module "redis_cluster" {
  source  = "terraform-google-modules/memorystore/google//modules/redis-cluster"
  version = "~> 12.0"

  name                        = "test-redis-cluster"
  project_id                  = var.project_id
  region                      = "us-central1"
  network                     = ["projects/${var.project_id}/global/networks/${local.network_name}"]
  node_type                   = "REDIS_STANDARD_SMALL"
  deletion_protection_enabled = false
  enable_apis                 = false


  service_connection_policies = {
    test-net-redis-cluster-scp = {
      network_name    = local.network_name
      network_project = var.project_id
      subnet_names = [
        "subnet-100",
        "subnet-101",
      ]
    }
  }

  redis_configs = {
    maxmemory-policy = "volatile-ttl"
  }

  depends_on = [
    module.test_vpc,
    module.enable_apis,
    google_project_iam_member.network_connectivity_sa,
  ]
}
