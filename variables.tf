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

variable "project" {
  description = "The ID of the project in which the resource belongs to."
  type        = string
}

variable "authorized_network" {
  description = "The full name of the Google Compute Engine network to which the instance is connected. If left unspecified, the default network will be used."
  type        = string
  default     = null
}

variable "redis_version" {
  description = "The version of Redis software."
  type        = string
  default     = null
}

variable "tier" {
  description = "The service tier of the instance. https://cloud.google.com/memorystore/docs/redis/reference/rest/v1/projects.locations.instances#Tier"
  type        = string
  default     = "STANDARD_HA"
}

variable "labels" {
  description = "The resource labels to represent user provided metadata."
  type        = map(string)
  default     = null
}

variable "enable_apis" {
  description = "Enable required APIs for Cloud Memorystore."
  type        = bool
  default     = true
}

variable "instance_configs" {
  description = "Array of configs for each Redis instance you want to create"
  default     = []
  type = list(object({
    name                    = string,
    display_name            = string,
    memory_size_gb          = number,
    region                  = string,
    location_id             = string,
    alternative_location_id = string,
    reserved_ip_range       = string,
    dns_record_name         = string,
  }))
}

variable "dns_project_id" {
  description = "The project_id where we want to create redis DNS records. If not specified"
  type        = string
  default     = null
}

variable "dns_record_prefix" {
  description = "The first part of a DNS record. The implementation here produces DNS records in the following format: `<dns_record_prefix>-<count.index>.<environment>.<zone_domain>.`"
  type        = string
  default     = null
}

variable "managed_zone_name" {
  description = "Name of the DNS zone where the DNS records will be created."
  type        = string
  default     = null
}

variable "record_ttl" {
  description = "TTL on the DNS records."
  type        = number
  default     = 300
}

variable "record_type" {
  description = "DNS record type"
  type        = string
  default     = "A"
}
