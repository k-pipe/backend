# get the project number
data "google_project" "project" {
  project_id = var.project_id
}

locals {
  project_number = tostring(data.google_project.project.number)
}

# permissions for service account to write to bigquery tables
resource "google_project_iam_member" "permissions_pubsub_serviceaccount" {
  project  = var.project_id
  for_each = toset(["roles/bigquery.dataEditor", "roles/bigquery.metadataViewer", "roles/pubsub.publisher", "roles/pubsub.subscriber"])
  role     = each.value
  member   = join("", ["serviceAccount:service-",local.project_number, "@gcp-sa-pubsub.iam.gserviceaccount.com"])
}
