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
  count = length(var.instance_configs)

  project            = var.project
  authorized_network = var.authorized_network
  redis_version      = var.redis_version
  tier               = var.tier
  labels             = var.labels

  name                    = var.instance_configs[count.index].name
  display_name            = var.instance_configs[count.index].display_name
  memory_size_gb          = var.instance_configs[count.index].memory_size_gb
  region                  = var.instance_configs[count.index].region
  location_id             = var.instance_configs[count.index].location_id
  alternative_location_id = var.instance_configs[count.index].alternative_location_id
  reserved_ip_range       = var.instance_configs[count.index].reserved_ip_range


  depends_on = [google_project_service.redis]
}

resource "google_project_service" "redis" {
  count = var.enable_apis ? 1 : 0

  project = var.project
  service = "redis.googleapis.com"
}
