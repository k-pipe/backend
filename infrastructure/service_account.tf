
resource "google_service_account" "cloud_function_service_account" {
  account_id   = "frontend-service-account"
  display_name = "Service account for frontend"
  description  = "This service account is used to run the cloud function that serves request in the front end"
  project      = var.project_id
}

// needed to get project number
data "google_project" "project" {
  project_id = var.project_id
}

#resource "google_service_account_iam_member" "member" {
#  service_account_id = google_service_account.cloud_function_service_account.id
#  role               = "roles/iam.serviceAccountUser"
#  member             = "serviceAccount:${data.google_project.project.number}-compute@developer.gserviceaccount.com"
#}