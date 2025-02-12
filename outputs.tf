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

output "id" {
  description = "The memorystore instance ID."
  value       = google_redis_instance.default.id
}

output "host" {
  description = "The IP address of the instance."
  value       = google_redis_instance.default.host
}

output "port" {
  description = "The port number of the exposed Redis endpoint."
  value       = google_redis_instance.default.port
}

output "read_endpoint" {
  description = " The IP address of the exposed readonly Redis endpoint."
  value       = google_redis_instance.default.read_endpoint
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

output "auth_string" {
  description = "AUTH String set on the instance. This field will only be populated if auth_enabled is true."
  value       = google_redis_instance.default.auth_string
  sensitive   = true
}

output "server_ca_certs" {
  description = "List of server CA certificates for the instance"
  value       = google_redis_instance.default.server_ca_certs
  sensitive   = false
}

output "env_vars" {
  description = "Exported environment variables"
  value = {
    "REDIS_HOST" : google_redis_instance.default.host,
    "REDIS_PORT" : tostring(google_redis_instance.default.port)
  }
}

output "apphub_service_uri" {
  value = {
    service_uri = "//redis.googleapis.com/${google_redis_instance.default.id}"
    service_id  = substr("${var.name}-${md5("${google_redis_instance.default.region}-${var.project_id}")}", 0, 63)
  }
  description = "Service URI in CAIS style to be used by Apphub."
}
