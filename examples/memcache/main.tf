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

module "private-service-access" {
  source      = "GoogleCloudPlatform/sql-db/google//modules/private_service_access"
  version     = "~> 12.0"
  project_id  = var.project_id
  vpc_network = module.test-vpc-module.network_name
  depends_on = [
    module.test-vpc-module
  ]
}

module "memcache" {
  source             = "../../modules/memcache"
  name               = "example-memcache"
  project            = var.project_id
  memory_size_mb     = "1024"
  enable_apis        = true
  cpu_count          = "1"
  region             = "us-east1"
  authorized_network = module.test-vpc-module.network_id
  depends_on = [
    module.private-service-access.peering_completed
  ]
}
