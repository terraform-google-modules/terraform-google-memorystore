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

resource "google_redis_instance" "default" {
  depends_on = [module.enable_apis]

  project            = var.project
  name               = var.name
  tier               = var.tier
  replica_count      = var.tier == "STANDARD_HA" ? var.replica_count : null
  read_replicas_mode = var.tier == "STANDARD_HA" ? var.read_replicas_mode : null
  memory_size_gb     = var.memory_size_gb
  connect_mode       = var.connect_mode

  region                  = var.region
  location_id             = var.location_id
  alternative_location_id = var.alternative_location_id

  authorized_network   = var.authorized_network
  customer_managed_key = var.customer_managed_key

  redis_version      = var.redis_version
  redis_configs      = var.redis_configs
  display_name       = var.display_name
  reserved_ip_range  = var.reserved_ip_range
  secondary_ip_range = var.secondary_ip_range

  labels = var.labels

  auth_enabled = var.auth_enabled

  transit_encryption_mode = var.transit_encryption_mode

  dynamic "maintenance_policy" {
    for_each = var.maintenance_policy != null ? [var.maintenance_policy] : []
    content {
      weekly_maintenance_window {
        day = maintenance_policy.value["day"]
        start_time {
          hours   = maintenance_policy.value["start_time"]["hours"]
          minutes = maintenance_policy.value["start_time"]["minutes"]
          seconds = maintenance_policy.value["start_time"]["seconds"]
          nanos   = maintenance_policy.value["start_time"]["nanos"]
        }
      }
    }
  }

  dynamic "persistence_config" {
    for_each = var.persistence_config != null ? [var.persistence_config] : []
    content {
      persistence_mode    = persistence_config.value["persistence_mode"]
      rdb_snapshot_period = persistence_config.value["rdb_snapshot_period"]
    }
  }

  lifecycle {
    ignore_changes = [maintenance_schedule]
  }
}

module "enable_apis" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "~> 14.0"

  project_id                  = var.project
  enable_apis                 = var.enable_apis
  disable_services_on_destroy = false

  activate_apis = [
    "redis.googleapis.com",
  ]
}
