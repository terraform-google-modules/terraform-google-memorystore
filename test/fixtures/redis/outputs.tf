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

output "project_id" {
  value = var.project_id
}

output "name" {
  value = var.name
}

output "region" {
  value = var.region
}

output "location_id" {
  value = var.location_id
}

output "memory_size_gb" {
  value = var.memory_size_gb
}

output "output_id" {
  value = module.memstore.id
}

output "output_host" {
  value = module.memstore.host
}

output "output_region" {
  value = module.memstore.region
}

output "output_current_location_id" {
  value = module.memstore.current_location_id
}

