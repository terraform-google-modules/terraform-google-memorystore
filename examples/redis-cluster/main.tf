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

module "redis_cluster_central" {
  source  = "terraform-google-modules/memorystore/google//modules/redis-cluster"
  version = "~> 14.0"

  name                        = "test-redis-cluster-central"
  project_id                  = var.project_id
  region                      = "us-central1"
  network                     = ["projects/${var.project_id}/global/networks/${local.network_name}"]
  node_type                   = "REDIS_STANDARD_SMALL"
  deletion_protection_enabled = false
  enable_apis                 = false
  kms_key                     = google_kms_crypto_key.key_region_central.id

  service_connection_policies = {
    test-net-redis-cluster-scp = {
      network_name    = local.network_name
      network_project = var.project_id
      subnet_names = [
        "subnet-us-central1-100",
        "subnet-us-central1-101",
      ]
    }
  }

  redis_configs = {
    maxmemory-policy = "volatile-ttl"
  }

  persistence_config = {
    mode = "RDB"
    rdb_config = {
      rdb_snapshot_period     = "ONE_HOUR"
      rdb_snapshot_start_time = "2027-10-02T15:01:23Z"
    }
  }

  weekly_maintenance_window = {
    day_of_the_week = "MONDAY"
    hours           = 1
  }

  depends_on = [
    module.test_vpc,
    module.enable_apis,
    google_project_iam_member.network_connectivity_sa,
    google_kms_crypto_key_iam_member.redis_sa_iam
  ]
}

module "redis_cluster_east" {
  source  = "terraform-google-modules/memorystore/google//modules/redis-cluster"
  version = "~> 14.0"

  name                        = "test-redis-cluster-secondary-east"
  project_id                  = var.project_id
  region                      = "us-east1"
  network                     = ["projects/${var.project_id}/global/networks/${local.network_name}"]
  node_type                   = "REDIS_STANDARD_SMALL"
  deletion_protection_enabled = false
  enable_apis                 = false
  kms_key                     = google_kms_crypto_key.key_region_east.id

  cluster_role    = "SECONDARY"
  primary_cluster = module.redis_cluster_central.id


  service_connection_policies = {
    test-net-redis-cluster-scp = {
      network_name    = local.network_name
      network_project = var.project_id
      subnet_names = [
        "subnet-us-east1-102",
      ]
    }
  }

  redis_configs = {
    maxmemory-policy = "volatile-ttl"
  }

  persistence_config = {
    mode = "RDB"
    rdb_config = {
      rdb_snapshot_period     = "ONE_HOUR"
      rdb_snapshot_start_time = "2027-10-02T15:01:23Z"
    }
  }

  weekly_maintenance_window = {
    day_of_the_week = "MONDAY"
    hours           = 1
  }

  depends_on = [
    module.test_vpc,
    module.enable_apis,
    google_project_iam_member.network_connectivity_sa,
    google_kms_crypto_key_iam_member.redis_sa_iam_east,
    module.redis_cluster_central,
  ]
}
