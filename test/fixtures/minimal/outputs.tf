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
  description = "Google cloud project id to create redis instance."
  value       = var.project_id
}

output "credentials_path" {
  description = "Path to service account key (usually credentials.json)."
  value       = var.credentials_path
}

output "name" {
  description = "Name of redis instance."
  value       = var.name
}

output "region" {
  description = "Region to create test instance."
  value       = var.region
}

output "location_id" {
  description = "Zone to create test instance."
  value       = var.location_id
}

output "memory_size_gb" {
  description = "Memory size of test instance."
  value       = var.memory_size_gb
}

output "output_id" {
  description = "The memorystore instance ID."
  value       = module.memstore.id
}

output "output_host" {
  description = "The memorystore instance ID."
  value       = module.memstore.host
}

output "output_region" {
  description = "The region the instance lives in."
  value       = module.memstore.region
}

output "output_current_location_id" {
  description = "The current zone where the Redis endpoint is placed."
  value       = module.memstore.current_location_id
}

