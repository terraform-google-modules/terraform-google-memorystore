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

module "redis_cluster" {
  source  = "terraform-google-modules/memorystore/google//modules/redis-cluster"
  version = "~> 10.0"

  name      = "test-redis-cluster"
  project   = var.project_id
  region    = "us-central1"
  network   = ["projects/${var.project_id}/global/networks/${local.network_name}"]
  node_type = "REDIS_STANDARD_SMALL"

  service_connection_policies = {
    test-net-redis-cluster-scp = {
      network_name    = local.network_name
      network_project = var.project_id
      subnet_names = [
        "subnet-100",
        "subnet-101",
      ]
    }
  }

  redis_configs = {
    maxmemory-policy = "volatile-ttl"
  }

  depends_on = [module.test_vpc]
}
