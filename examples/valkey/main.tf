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
  version = "~> 18.0"

  project_id  = var.project_id
  enable_apis = true

  disable_services_on_destroy = false
  disable_dependent_services  = false

  activate_apis = [
    "memorystore.googleapis.com",
    "serviceconsumermanagement.googleapis.com",
    "networkconnectivity.googleapis.com",
    "compute.googleapis.com",
  ]
}


module "valkey_cluster" {
  source  = "terraform-google-modules/memorystore/google//modules/valkey"
  version = "~> 15.0"

  instance_id                 = "test-valkey-cluster"
  project_id                  = var.project_id
  location                    = "us-central1"
  node_type                   = "HIGHMEM_MEDIUM"
  deletion_protection_enabled = false
  engine_version              = "VALKEY_8_0"

  network = local.network_name

  service_connection_policies = {
    test-net-valkey-cluster-scp = {
      subnet_names = [
        "valkey-subnet-100",
        "valkey-subnet-101",
      ]
    }
  }

  persistence_config = {
    mode = "RDB"
    rdb_config = {
      rdb_snapshot_period     = "ONE_HOUR"
      rdb_snapshot_start_time = "2024-10-02T15:01:23Z"
    }
  }

  engine_configs = {
    maxmemory-policy = "volatile-ttl"
  }

  weekly_maintenance_window = [
    {
      day_of_week     = "MONDAY"
      start_time_hour = "23"
    }
  ]

  automated_backup_config = {
    start_time = "20"
    retention  = "86400s"
  }

  depends_on = [
    module.test_vpc,
    module.enable_apis,
    google_project_iam_member.network_connectivity_sa,
  ]
}
