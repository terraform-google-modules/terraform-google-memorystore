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

resource "google_project_service_identity" "redis_sa" {
  provider = google-beta

  project = var.project_id
  service = "redis.googleapis.com"
}

resource "time_sleep" "wait_for_redis_sa_ready_state" {
  create_duration = "30s"
  depends_on      = [google_project_service_identity.redis_sa]
}

resource "random_string" "key_suffix" {
  length  = 3
  special = false
  upper   = false
}

resource "google_kms_key_ring" "keyring_region_central" {
  project  = var.project_id
  name     = "keyring-us-central1-${random_string.key_suffix.result}"
  location = "us-central1"
}

resource "google_kms_crypto_key" "key_region_central" {
  name     = "key-us-central1-${random_string.key_suffix.result}"
  key_ring = google_kms_key_ring.keyring_region_central.id
}


resource "google_kms_crypto_key_iam_member" "redis_sa_iam" {
  crypto_key_id = google_kms_crypto_key.key_region_central.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:${google_project_service_identity.redis_sa.email}"

  depends_on = [time_sleep.wait_for_redis_sa_ready_state]
}

resource "google_kms_key_ring" "keyring_region_east" {
  project  = var.project_id
  name     = "keyring-us-east1-${random_string.key_suffix.result}"
  location = "us-east1"
}

resource "google_kms_crypto_key" "key_region_east" {
  name     = "key-us-east1-${random_string.key_suffix.result}"
  key_ring = google_kms_key_ring.keyring_region_east.id
}


resource "google_kms_crypto_key_iam_member" "redis_sa_iam_east" {
  crypto_key_id = google_kms_crypto_key.key_region_east.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:${google_project_service_identity.redis_sa.email}"

  depends_on = [time_sleep.wait_for_redis_sa_ready_state]
}
