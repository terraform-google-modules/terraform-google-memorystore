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

output "cluster_id" {
  description = "The valkey cluster instance ID"
  value       = module.valkey_cluster.id
}

output "size_gb" {
  description = "The valkey cluster size"
  value       = module.valkey_cluster.valkey_cluster.node_config[0].size_gb
}

output "cluster_region" {
  description = "The valkey cluster region"
  value       = module.valkey_cluster.valkey_cluster.location
}

output "replica_count" {
  description = "The valkey cluster replica count"
  value       = module.valkey_cluster.valkey_cluster.replica_count
}

output "transit_encryption_mode" {
  description = "The valkey cluster transit encryption mode"
  value       = module.valkey_cluster.valkey_cluster.transit_encryption_mode
}

output "cluster_name" {
  description = "The valkey cluster name"
  value       = module.valkey_cluster.valkey_cluster.instance_id
}

output "shard_count" {
  description = "The valkey cluster shard count"
  value       = module.valkey_cluster.valkey_cluster.shard_count
}

output "authorization_mode" {
  description = "The valkey cluster authorization mode"
  value       = module.valkey_cluster.valkey_cluster.authorization_mode
}

output "node_type" {
  description = "The valkey cluster node type"
  value       = module.valkey_cluster.valkey_cluster.node_type
}

output "cluster" {
  description = "The valkey cluster created"
  value       = module.valkey_cluster
}
