/**
 * Copyright 2022 Google LLC
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
  create_service_account = var.service_account == null || var.service_account == "" ? true : false
  service_account        = local.create_service_account ? google_service_account.redis_backup_serviceaccount[0].email : var.service_account
}


data "google_redis_instance" "backup_instance" {
  name    = var.redis_instance
  project = var.project_id
}

################################
#                              #
#   Service Account and IAM    #
#                              #
################################
resource "google_service_account" "redis_backup_serviceaccount" {
  count        = local.create_service_account ? 1 : 0
  account_id   = trimsuffix(substr("backup-${var.redis_instance}", 0, 28), "-")
  display_name = "Managed by Terraform - Service account for backup of redis Instance ${var.redis_instance}"
  project      = var.project_id
}

resource "google_project_iam_member" "redis_backup_serviceaccount_redis_admin" {
  count   = local.create_service_account ? 1 : 0
  member  = "serviceAccount:${google_service_account.redis_backup_serviceaccount[0].email}"
  role    = "roles/redis.admin"
  project = var.project_id
}

resource "google_project_iam_member" "redis_backup_serviceaccount_workflow_invoker" {
  count   = local.create_service_account ? 1 : 0
  member  = "serviceAccount:${google_service_account.redis_backup_serviceaccount[0].email}"
  role    = "roles/workflows.invoker"
  project = var.project_id
}

################################
#                              #
#       External Backups       #
#                              #
################################
resource "google_workflows_workflow" "redis_export" {
  name            = "redis-export-${var.redis_instance}"
  description     = "Workflow for backing up the Redis Instance"
  project         = var.project_id
  service_account = local.service_account
  source_contents = templatefile("${path.module}/templates/export.yaml.tftpl", {
    project      = var.project_id
    region       = var.region
    instanceName = var.redis_instance
    gcsBucket    = var.export_uri
  })
}

resource "google_cloud_scheduler_job" "redis_export" {
  name        = "redis-export-${var.redis_instance}"
  project     = var.project_id
  region      = var.region
  description = "Managed by Terraform - Triggers a Redis Export via Workflows"
  schedule    = var.export_schedule
  time_zone   = var.scheduler_timezone

  http_target {
    uri         = "https://workflowexecutions.googleapis.com/v1/${google_workflows_workflow.redis_export.id}/executions"
    http_method = "POST"
    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = local.service_account
    }
  }
}

resource "google_storage_bucket_iam_member" "redis_instance_account" {
  bucket = split("/", var.export_uri)[2] #Get the name of the bucket out of the URI
  member = data.google_redis_instance.backup_instance.persistence_iam_identity
  role   = "roles/storage.objectCreator"
}

# mandatory to allow export to distinct project than the redis instance one
resource "google_storage_bucket_iam_member" "redis_instance_account_bis" {
  bucket = split("/", var.export_uri)[2] #Get the name of the bucket out of the URI
  member = data.google_redis_instance.backup_instance.persistence_iam_identity
  role   = "roles/storage.legacyBucketReader"
}