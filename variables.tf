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

variable "region" {
  description = "The GCP region to use"
  default     = "us-east1"
}

variable "project" {
  description = "The id of the project in which the resource belongs to"
}

variable "name" {
  description = "The name of the memorystore instance"
}

variable "authorized_network" {
  description = "The name of the memorystore authorized network"
  default = "default"
}

variable "tier" {
  description = "The service tier of the instance"
  default = "STANDARD_HA"
}

variable "memory_size_gb" {
  description = "The memory size in GiB"
  default = 1
}

variable "location_id" {
  description = "The zone where the instance will be provisioned"
  default = "us-east1-b"
}

variable "alternative_location_id" {
  description = "The alternative zone where the instance will be provisioned"
  default = "us-east1-d"
}

variable "redis_version" {
  description = "The version of Redis software"
  default = "REDIS_3_2"
}

variable "display_name" {
  description = "An arbitrary and optional user-provided name for the instance"
  default = ""
}

variable "reserved_ip_range" {
  description = "The CIDR range of internal addresses that are reserved for this instance"
  default = "192.168.0.0/29"
}

variable "labels" {
  description = "The resource labels to represent user provided metadata"
  default = {}
}
