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

module "memstore" {
  source = "../../.."

  name = var.name

  project                 = var.project_id
  region                  = var.region
  location_id             = var.location_id
  alternative_location_id = var.alternative_location_id
  enable_apis             = true
  auth_enabled            = var.auth_enabled
  transit_encryption_mode = var.transit_encryption_mode

  memory_size_gb = var.memory_size_gb

  maintenance_policy_day                = var.maintenance_policy_day
  maintenance_policy_start_time_hours   = var.maintenance_policy_start_time_hours
  maintenance_policy_start_time_minutes = var.maintenance_policy_start_time_minutes
  maintenance_policy_start_time_seconds = var.maintenance_policy_start_time_seconds
  maintenance_policy_start_time_nanos   = var.maintenance_policy_start_time_nanos
}
