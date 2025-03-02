
resource "google_service_account" "cloud_function_service_account" {
  account_id   = "frontend-service-account"
  display_name = "Service account for frontend"
  description  = "This service account is used to run the cloud function that serves request in the front end"
  project      = "green-k8s"
}

