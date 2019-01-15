/**
 * Copyright 2018 Google LLC
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
  project        = "${var.project}"
  name           = "${var.name}"
  tier           = "${var.tier}"
  memory_size_gb = "${var.memory_size_gb}"

  region                  = "${var.region}"
  location_id             = "${var.location_id}"
  alternative_location_id = "${var.alternative_location_id}"

  authorized_network = "${var.authorized_network}"

  redis_version     = "${var.redis_version}"
  display_name      = "${var.display_name}"
  reserved_ip_range = "${var.reserved_ip_range}"

  labels = "${var.labels}"

  depends_on = ["google_project_service.redis"]
}

resource "google_project_service" "redis" {

  count = "${var.enable_apis ? 1 : 0}"

  project = "${var.project}"
  service = "redis.googleapis.com"
}
