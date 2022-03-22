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

locals {
  maintenance_policy_is_defined = var.maintenance_policy_day != "" && var.maintenance_policy_start_time_hours != null ? [1] : []
}

resource "google_redis_instance" "default" {
  depends_on = [module.enable_apis]

  project        = var.project
  name           = var.name
  tier           = var.tier
  memory_size_gb = var.memory_size_gb
  connect_mode   = var.connect_mode

  region                  = var.region
  location_id             = var.location_id
  alternative_location_id = var.alternative_location_id

  authorized_network = var.authorized_network

  redis_version     = var.redis_version
  redis_configs     = var.redis_configs
  display_name      = var.display_name
  reserved_ip_range = var.reserved_ip_range

  labels = var.labels

  auth_enabled = var.auth_enabled

  transit_encryption_mode = var.transit_encryption_mode

  maintenance_policy {
    dynamic "weekly_maintenance_window" {
      for_each = local.maintenance_policy_is_defined
      content {
        day      = var.maintenance_policy_day
        duration = var.maintenance_policy_duration
        start_time {
          hours   = var.maintenance_policy_start_time_hours
          minutes = var.maintenance_policy_start_time_minutes
          seconds = var.maintenance_policy_start_time_seconds
          nanos   = var.maintenance_policy_start_time_nanos
        }
      }
    }
  }
}

module "enable_apis" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "~> 11.0"

  project_id                  = var.project
  enable_apis                 = var.enable_apis
  disable_services_on_destroy = false

  activate_apis = [
    "redis.googleapis.com",
  ]
}
