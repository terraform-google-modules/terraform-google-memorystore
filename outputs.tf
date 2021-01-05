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

output "id" {
  description = "The memorystore instance ID."
  value       = google_redis_instance.default.id
}

output "host" {
  description = "The IP address of the instance."
  value       = google_redis_instance.default.host
}

output "region" {
  description = "The region the instance lives in."
  value       = google_redis_instance.default.region
}

output "current_location_id" {
  description = "The current zone where the Redis endpoint is placed."
  value       = google_redis_instance.default.current_location_id
}

output "persistence_iam_identity" {
  description = "Cloud IAM identity used by import/export operations. Format is 'serviceAccount:'. May change over time"
  value       = google_redis_instance.default.persistence_iam_identity
}
