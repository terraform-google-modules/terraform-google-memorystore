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

resource "google_memcache_instance" "self" {
  depends_on         = [module.enable_apis]
  provider           = google-beta
  project            = var.project
  zones              = var.zones
  name               = var.name
  region             = var.region
  authorized_network = var.authorized_network
  node_count         = var.node_count
  display_name       = var.display_name == null ? var.name : var.display_name
  labels             = var.labels

  node_config {
    cpu_count      = var.cpu_count
    memory_size_mb = var.memory_size_mb
  }

  dynamic "memcache_parameters" {
    for_each = var.params == null ? [] : [var.params]
    content {
      params = memcache_parameters.value
    }
  }

}


module "enable_apis" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "~> 10.0"

  project_id  = var.project
  enable_apis = var.enable_apis

  activate_apis = [
    "memcache.googleapis.com",
  ]
}
