# dataset for scheduler tables
resource "google_bigquery_dataset" "dataset" {
  project      = var.project_id
  location     = var.dataset_location
  dataset_id   = "backend"
  description  = "Backend data set"
}

