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

resource "google_memorystore_instance" "valkey_cluster" {
  provider    = google-beta
  project     = var.project
  instance_id = var.instance_id
  shard_count = var.shard_count

  desired_psc_auto_connections {
    network    = "projects/${coalesce(var.network_project, var.project)}/global/networks/${var.network}"
    project_id = var.project
  }

  location                = var.location
  replica_count           = var.replica_count
  node_type               = var.node_type
  transit_encryption_mode = var.transit_encryption_mode
  authorization_mode      = var.authorization_mode
  engine_configs          = var.engine_configs

  dynamic "zone_distribution_config" {
    for_each = var.zone_distribution_config_mode != null ? ["zone_distribution_config"] : []
    content {
      mode = var.zone_distribution_config_mode
      zone = var.zone_distribution_config_mode == "SINGLE_ZONE" ? var.zone_distribution_config_zone : null
    }
  }

  engine_version              = var.engine_version
  deletion_protection_enabled = var.deletion_protection_enabled

  dynamic "persistence_config" {
    for_each = var.persistence_config != null ? ["persistence_config"] : []
    content {
      mode = var.persistence_config.mode
      dynamic "rdb_config" {
        for_each = var.persistence_config.rdb_config != null ? ["rdb_config"] : []
        content {
          rdb_snapshot_period     = var.persistence_config.rdb_config.rdb_snapshot_period
          rdb_snapshot_start_time = var.persistence_config.rdb_config.rdb_snapshot_start_time
        }
      }
      dynamic "aof_config" {
        for_each = var.persistence_config.aof_config != null ? ["aof_config"] : []
        content {
          append_fsync = var.persistence_config.aof_config.append_fsync
        }
      }
    }
  }
  labels = var.labels

  depends_on = [
    google_network_connectivity_service_connection_policy.service_connection_policies
  ]
}

resource "google_network_connectivity_service_connection_policy" "service_connection_policies" {
  for_each      = var.service_connection_policies
  project       = coalesce(var.network_project, var.project)
  name          = each.key
  location      = var.location
  service_class = "gcp-memorystore"
  description   = lookup(each.value, "description", null)
  network       = "projects/${coalesce(var.network_project, var.project)}/global/networks/${var.network}"
  labels        = each.value.labels

  psc_config {
    subnetworks = [for x in each.value.subnet_names : "projects/${coalesce(var.network_project, var.project)}/regions/${var.location}/subnetworks/${x}"]
    limit       = lookup(each.value, "limit", null)
  }

}

module "enable_apis" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "~> 17.0"

  project_id  = var.project
  enable_apis = var.enable_apis

  disable_services_on_destroy = false
  disable_dependent_services  = false

  activate_apis = [
    "memorystore.googleapis.com",
    "serviceconsumermanagement.googleapis.com",
    "networkconnectivity.googleapis.com",
    "compute.googleapis.com",
  ]
}
