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

output "ids" {
  description = "The memorystore instance IDs."
  value       = google_redis_instance.default.*.id
}

output "hosts" {
  description = "The IP addresses of the instances."
  value       = google_redis_instance.default.*.host
}

output "regions" {
  description = "The regions the instances live in."
  value       = google_redis_instance.default.*.region
}

output "current_location_ids" {
  description = "The current zones where the Redis endpoint is placed."
  value       = google_redis_instance.default.*.current_location_id
}

