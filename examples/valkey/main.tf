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
    "privateca.googleapis.com",
  ]
}

module "valkey_cluster_south1" {
  source = "../../modules/valkey"

  instance_id             = "test-valkey-cluster-south1"
  project_id              = var.project_id
  location                = "us-south1"
  node_type               = "STANDARD_SMALL"
  transit_encryption_mode = "SERVER_AUTHENTICATION"

  deletion_protection_enabled = false
  engine_version              = "VALKEY_8_0"

  network = local.network_name

  service_connection_policies = {
    test-net-valkey-cluster-scp = {
      subnet_names = [
        "valkey-subnet-200",
        "valkey-subnet-201",
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

module "valkey_cluster_east1" {
  source = "../../modules/valkey"

  instance_id             = "test-valkey-cluster-east1"
  project_id              = var.project_id
  location                = "us-east1"
  node_type               = "STANDARD_SMALL"
  transit_encryption_mode = "SERVER_AUTHENTICATION"

  deletion_protection_enabled = false
  engine_version              = "VALKEY_8_0"
  server_ca_mode              = "GOOGLE_MANAGED_SHARED_CA"

  network = local.network_name

  service_connection_policies = {
    test-net-valkey-cluster-scp = {
      subnet_names = [
        "valkey-subnet-102",
      ]
    }
  }
  instance_role    = "SECONDARY"
  primary_instance = module.valkey_cluster_south1.id

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
    module.valkey_cluster_south1,
  ]
}

module "valkey_cluster_west1" {
  source = "../../modules/valkey"

  instance_id             = "test-valkey-cluster-west1"
  project_id              = var.project_id
  location                = "us-west1"
  node_type               = "STANDARD_SMALL"
  transit_encryption_mode = "SERVER_AUTHENTICATION"

  deletion_protection_enabled = false
  engine_version              = "VALKEY_8_0"
  server_ca_mode              = "CUSTOMER_MANAGED_CAS_CA"

  server_ca_pool = google_privateca_ca_pool.ca_pool_region_west.id
  kms_key        = google_kms_crypto_key.key_region_west.id

  network = local.network_name

  service_connection_policies = {
    test-net-valkey-cluster-scp = {
      subnet_names = [
        "valkey-subnet-103",
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
    google_privateca_certificate_authority.ca_west_authority,
    google_kms_crypto_key_iam_member.memorystore_sa_iam_west,
    time_sleep.wait_for_ca_pool_iam_propagation,
  ]
}
