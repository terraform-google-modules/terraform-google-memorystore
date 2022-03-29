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

module "memstore" {
  source = "../.."

  name               = "test-minimal"
  project            = var.project_id
  region             = "us-east1"
  location_id        = "us-east1-b"
  enable_apis        = true
  tier               = "BASIC"
  authorized_network = module.test-vpc-module.network_id

  memory_size_gb = 1
}
