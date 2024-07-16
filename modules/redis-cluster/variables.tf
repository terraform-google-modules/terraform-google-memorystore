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

variable "name" {
  description = "The ID of the instance or a fully qualified identifier for the instance. must be 1 to 63 characters and use only lowercase letters, numbers, or hyphens. It must start with a lowercase letter and end with a lowercase letter or number"
  type        = string
}

variable "project" {
  description = "The ID of the project in which the resource belongs to."
  type        = string
}

variable "region" {
  description = "The name of the region of the Redis cluster"
  type        = string
}

variable "enable_apis" {
  description = "Flag for enabling memcache.googleapis.com in your project"
  type        = bool
  default     = true
}

variable "shard_count" {
  description = "Required. Number of shards for the Redis cluster. The minimum number of shards in a Memorystore cluster is 3 shards"
  type        = number
  default     = 3
}


variable "replica_count" {
  description = "The number of replica nodes per shard. Each shard can have 0, 1, or 2 replica nodes. Replicas provide high availability and additional read throughput, and are evenly distributed across zones"
  type        = number
  default     = 0
}

variable "transit_encryption_mode" {
  description = "The in-transit encryption for the Redis cluster. If not provided, encryption is disabled for the cluster. Default value is TRANSIT_ENCRYPTION_MODE_DISABLED. Possible values are: TRANSIT_ENCRYPTION_MODE_UNSPECIFIED, TRANSIT_ENCRYPTION_MODE_DISABLED, TRANSIT_ENCRYPTION_MODE_SERVER_AUTHENTICATION"
  type        = string
  default     = "TRANSIT_ENCRYPTION_MODE_DISABLED"
}

variable "authorization_mode" {
  description = "The authorization mode of the Redis cluster. If not provided, auth feature is disabled for the cluster. Default value is AUTH_MODE_DISABLED. Possible values are: AUTH_MODE_UNSPECIFIED, AUTH_MODE_IAM_AUTH, AUTH_MODE_DISABLED"
  type        = string
  default     = "AUTH_MODE_DISABLED"
}

variable "network" {
  description = "List of consumer network where the network address of the discovery endpoint will be reserved, in the form of projects/{network_project_id_or_number}/global/networks/{network_id}. Currently, only one item is supported"
  type        = list(string)
}

variable "service_connection_policies" {
  description = "The Service Connection Policies to create"
  type = map(object({
    description     = optional(string)
    network_name    = string
    network_project = string
    subnet_names    = list(string)
    limit           = optional(number)
    labels          = optional(map(string), {})
  }))
  default = {}
}

variable "node_type" {
  description = "The nodeType for the Redis cluster. If not provided, REDIS_HIGHMEM_MEDIUM will be used as default Possible values are: REDIS_SHARED_CORE_NANO, REDIS_HIGHMEM_MEDIUM, REDIS_HIGHMEM_XLARGE, REDIS_STANDARD_SMALL."
  type        = string
  default     = null
}

variable "redis_configs" {
  description = "Configure Redis Cluster behavior using a subset of native Redis configuration parameters"
  type = object({
    maxmemory-clients       = optional(string)
    maxmemory               = optional(string)
    maxmemory-policy        = optional(string)
    notify-keyspace-events  = optional(string)
    slowlog-log-slower-than = optional(number)
    maxclients              = optional(number)
  })
  default = null
}

variable "zone_distribution_config_mode" {
  description = "The mode for zone distribution for Memorystore Redis cluster (Immutable). If not provided, MULTI_ZONE will be used as default value. Possible values are: MULTI_ZONE, SINGLE_ZONE"
  type        = string
  default     = "MULTI_ZONE"
}

variable "zone_distribution_config_zone" {
  description = "The zone for single zone Memorystore Redis cluster (Immutable)"
  type        = string
  default     = null
}
