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

variable "project_id" {
  description = "Google cloud project id to create memcache instance."
  type        = string
}

variable "name" {
  description = "Name of memcache instance."
  type        = string
  default     = "test-memcache"
}

variable "region" {
  description = "Region to create test instance."
  type        = string
  default     = "us-east1"
}

variable "memory_size_mb" {
  description = "Memory size of test instance."
  type        = number
  default     = 1024
}

variable "cpu_count" {
  description = "Number of cpu's for test instance."
  type        = number
  default     = 1
}
