
variable "gcp_apis" {
  description ="The list of apis required"
  type = list(string)
  default = [
    "cloudresourcemanager",
    "serviceusage",
    "bigquery",
    "pubsub",
    "storage",
    "cloudfunctions",
    "cloudbuild",
    "run"
  ]
}

resource "google_project_service" "gcp_api_services" {
  project  = var.project_id
  for_each = toset(var.gcp_apis)
  service  = join(".", [each.key, "googleapis", "com"])
}

