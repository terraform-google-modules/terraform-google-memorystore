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

variable "region" {
  description = "The GCP region to use."
  type        = string
}

variable "project" {
  description = "The ID of the project in which the resource belongs to."
  type        = string
}

variable "enable_apis" {
  description = "Flag for enabling memcache.googleapis.com in your project"
  type        = bool
  default     = true
}

variable "name" {
  description = "The ID of the instance or a fully qualified identifier for the instance."
  type        = string
}

variable "authorized_network" {
  description = "The full name of the Google Compute Engine network to which the instance is connected. If left unspecified, the default network will be used."
  type        = string
  default     = null
}

variable "node_count" {
  description = "Number of nodes in the memcache instance."
  type        = number
  default     = 1
}

variable "cpu_count" {
  description = "Number of CPUs per node"
  type        = number
  default     = 1
}

variable "memory_size_mb" {
  description = "Memcache memory size in MiB. Defaulted to 1024"
  type        = number
  default     = 1024
}

variable "zones" {
  description = "Zones where memcache nodes should be provisioned. If not provided, all zones will be used."
  type        = list(string)
  default     = null
}

variable "display_name" {
  description = "An arbitrary and optional user-provided name for the instance."
  type        = string
  default     = null
}

variable "reserved_ip_range" {
  description = "The CIDR range of internal addresses that are reserved for this instance."
  type        = string
  default     = null
}

variable "labels" {
  description = "The resource labels to represent user provided metadata."
  type        = map(string)
  default     = {}
}

variable "params" {
  description = "Parameters for the memcache process"
  type        = map(string)
  default     = null
}
