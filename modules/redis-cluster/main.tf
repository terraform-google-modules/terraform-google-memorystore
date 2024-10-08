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

resource "google_redis_cluster" "redis_cluster" {
  project                     = var.project_id
  name                        = var.name
  shard_count                 = var.shard_count
  region                      = var.region
  replica_count               = var.replica_count
  transit_encryption_mode     = var.transit_encryption_mode
  authorization_mode          = var.authorization_mode
  node_type                   = var.node_type
  redis_configs               = var.redis_configs
  deletion_protection_enabled = var.deletion_protection_enabled

  dynamic "psc_configs" {
    for_each = var.network
    content {
      network = psc_configs.value
    }
  }

  dynamic "zone_distribution_config" {
    for_each = var.zone_distribution_config_mode != null ? [1] : []
    content {
      mode = var.zone_distribution_config_mode
      zone = var.zone_distribution_config_mode == "SINGLE_ZONE" ? var.zone_distribution_config_zone : null
    }
  }

  depends_on = [
    google_network_connectivity_service_connection_policy.service_connection_policies,
    module.enable_apis,
  ]
}

resource "google_network_connectivity_service_connection_policy" "service_connection_policies" {
  for_each      = var.service_connection_policies
  project       = each.value.network_project
  name          = each.key
  location      = var.region
  service_class = "gcp-memorystore-redis"
  description   = lookup(each.value, "description", null)
  network       = "projects/${each.value.network_project}/global/networks/${each.value.network_name}"
  labels        = each.value.labels

  psc_config {
    subnetworks = [for x in each.value.subnet_names : "projects/${each.value.network_project}/regions/${var.region}/subnetworks/${x}"]
    limit       = lookup(each.value, "limit", null)
  }

}

module "enable_apis" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "~> 17.0"

  project_id  = var.project_id
  enable_apis = var.enable_apis

  disable_services_on_destroy = false
  disable_dependent_services  = false

  activate_apis = [
    "redis.googleapis.com",
    "serviceconsumermanagement.googleapis.com",
    "networkconnectivity.googleapis.com",
    "compute.googleapis.com",
  ]
}
