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

locals {
  network_name = "test-valkey-network"
}

module "test_vpc" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 9.2"
  project_id   = var.project_id
  network_name = local.network_name
  mtu          = 1460

  subnets = [
    {
      subnet_name   = "valkey-subnet-100"
      subnet_ip     = "10.10.100.0/24"
      subnet_region = "us-central1"
    },
    {
      subnet_name   = "valkey-subnet-101"
      subnet_ip     = "10.10.101.0/24"
      subnet_region = "us-central1"
    },
    {
      subnet_name   = "valkey-subnet-102"
      subnet_ip     = "10.10.102.0/24"
      subnet_region = "us-east1"
    },
  ]
}
