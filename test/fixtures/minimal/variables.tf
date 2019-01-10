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

variable "project_id" {
  description = "Google cloud project id to create redis instance."
}

variable "credentials_path" {
  description = "Path to service account key (usually credentials.json)."
}

variable "name" {
  default     = "test-minimal"
  description = "Name of redis instance."
}

variable "region" {
  default     = "us-east1"
  description = "Region to create test instance."
}

variable "location_id" {
  default     = "us-east1-b"
  description = "Zone to create test instance."
}

variable "memory_size_gb" {
  default     = 1
  description = "Memory size of test instance."
}
