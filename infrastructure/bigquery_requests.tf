# the input table receiving commands from pubsub
resource "google_bigquery_table" "requests" {
  project             = var.project_id
  dataset_id          = google_bigquery_dataset.dataset.dataset_id
  table_id            = "requests"
  deletion_protection = true
  schema              = file("schemas/requests.bq.json")
  time_partitioning {
    field = "publish_time"
    type  = "DAY"
  }
}