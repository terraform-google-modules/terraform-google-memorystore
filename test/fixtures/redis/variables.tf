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
  description = "Google cloud project id to create redis instance."
  type        = string
}

variable "name" {
  description = "Name of redis instance."
  type        = string
  default     = "test-redis"
}

variable "region" {
  description = "Region to create test instance."
  type        = string
  default     = "us-east1"
}

variable "location_id" {
  description = "Zone to create test instance."
  type        = string
  default     = "us-east1-b"
}

variable "alternative_location_id" {
  description = "Alternate Zone to create test instance."
  type        = string
  default     = "us-east1-d"
}

variable "memory_size_gb" {
  description = "Memory size of test instance."
  type        = number
  default     = 1
}

variable "auth_enabled" {
  description = "Indicates whether OSS Redis AUTH is enabled for the instance. If set to true AUTH is enabled on the instance."
  type        = bool
  default     = true
}

variable "auth_string" {
  description = "AUTH String set on the instance. This field will only be populated if auth_enabled is true"
  type        = string
  default     = null
}
