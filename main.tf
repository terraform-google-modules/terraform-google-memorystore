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
  instance_count = length(var.instance_configs)
  dns_project_id = var.dns_project_id == null ? var.project : var.dns_project_id
}

resource "google_redis_instance" "default" {
  depends_on = [module.enable_redis_api]
  count      = local.instance_count

  project            = var.project
  authorized_network = var.authorized_network
  redis_version      = var.redis_version
  tier               = var.tier
  labels             = var.labels

  name                    = var.instance_configs[count.index]["name"]
  display_name            = var.instance_configs[count.index]["display_name"]
  memory_size_gb          = var.instance_configs[count.index]["memory_size_gb"]
  region                  = var.instance_configs[count.index]["region"]
  location_id             = var.instance_configs[count.index]["location_id"]
  alternative_location_id = var.instance_configs[count.index]["alternative_location_id"]
  reserved_ip_range       = var.instance_configs[count.index]["reserved_ip_range"]
}

module "enable_redis_api" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "4.0.1"

  project_id  = "${var.project}"
  enable_apis = "${var.enable_apis}"

  activate_apis = [
    "redis.googleapis.com",
  ]
}


module "enable_dns_api" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "4.0.1"

  project_id  = "${var.project}"
  enable_apis = var.enable_apis && var.managed_zone_name != null ? "true" : "false"

  activate_apis = [
    "dns.googleapis.com",
  ]
}

data "google_dns_managed_zone" "main" {
  count   = var.managed_zone_name == null ? 0 : 1
  project = local.dns_project_id
  name    = var.managed_zone_name

  depends_on = [module.enable_dns_api]
}

resource "google_dns_record_set" "main" {
  depends_on   = [module.enable_dns_api]
  count        = var.managed_zone_name == null ? 0 : local.instance_count
  name         = var.instance_configs[count.index]["dns_record_name"] != null ? var.instance_configs[count.index]["dns_record_name"] : "${var.dns_record_prefix}-${count.index}.${data.google_dns_managed_zone.main.0.dns_name}"
  type         = var.record_type
  ttl          = var.record_ttl
  managed_zone = var.managed_zone_name
  project      = local.dns_project_id
  rrdatas      = [google_redis_instance.default[count.index].host]
}
