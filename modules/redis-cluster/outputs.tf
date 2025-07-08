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
  description = "The redis cluster instance ID"
  value       = google_redis_cluster.redis_cluster.id
}

output "discovery_endpoints" {
  description = "Endpoints created on each given network, for Redis clients to connect to the cluster. Currently only one endpoint is supported"
  value       = google_redis_cluster.redis_cluster.discovery_endpoints
}

output "psc_connections" {
  description = "PSC connections for discovery of the cluster topology and accessing the cluster"
  value       = google_redis_cluster.redis_cluster.psc_connections
}

output "psc_service_attachments" {
  description = "The PSC service attachments of the cluster"
  value       = google_redis_cluster.redis_cluster.psc_service_attachments
}

output "redis_cluster" {
  description = "The redis cluster created"
  value       = google_redis_cluster.redis_cluster
}

output "apphub_service_uri" {
  value = {
    service_uri = "//redis.googleapis.com/${google_redis_cluster.redis_cluster.id}"
    service_id  = substr("${var.name}-${md5("MRC-${var.region}-${var.project_id}")}", 0, 63)
    location    = var.region
  }
  description = "Service URI in CAIS style to be used by Apphub."
}
