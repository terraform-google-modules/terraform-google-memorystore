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

variable "transit_encryption_mode" {
  description = "The TLS mode of the Redis instance, If not provided, TLS is disabled for the instance."
  type        = string
  default     = "SERVER_AUTHENTICATION"
}

variable "maintenance_policy_day" {
  description = "The day of week that maintenance updates occur.\n(days are are \"DAY_OF_WEEK_UNSPECIFIED\", \"MONDAY\", \"TUESDAY\", \"WEDNESDAY\", \"THURSDAY\", \"FRIDAY\", \"SATURDAY\" or \"SUNDAY\")"
  type        = string
  default     = "DAY_OF_WEEK_UNSPECIFIED"
  validation {
    condition     = contains(["", "DAY_OF_WEEK_UNSPECIFIED", "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY", "SUNDAY"], var.maintenance_policy_day)
    error_message = "Allowed values for maintenance_policy_day are \"DAY_OF_WEEK_UNSPECIFIED\", \"MONDAY\", \"TUESDAY\", \"WEDNESDAY\", \"THURSDAY\", \"FRIDAY\", \"SATURDAY\" or \"SUNDAY\"."
  }
}

variable "maintenance_policy_duration" {
  description = "Duration of the maintenance window. The current window is fixed at 1 hour. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: \"3.5s\"."
  type        = string
  default     = "1h"
}

variable "maintenance_policy_start_time_hours" {
  description = "Start time of the window in UTC time. Hours of day in 24 hour format. Should be from 0 to 23. An API may choose to allow the value \"24:00:00\" for scenarios like business closing time."
  type        = number
  default     = 1
}

variable "maintenance_policy_start_time_minutes" {
  description = "Start time of the window in UTC time. Minutes of hour of day. Must be from 0 to 59."
  type        = number
  default     = 0
}

variable "maintenance_policy_start_time_seconds" {
  description = "Start time of the window in UTC time. Seconds of minutes of the time. Must normally be from 0 to 59. An API may allow the value 60 if it allows leap-seconds."
  type        = number
  default     = 0
}

variable "maintenance_policy_start_time_nanos" {
  description = "Start time of the window in UTC time. Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999"
  type        = number
  default     = 0
}
