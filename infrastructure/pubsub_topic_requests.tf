# the schema for pubsub messages
resource "google_pubsub_schema" "request_schema" {
  project    = var.project_id
  name       = "request"
  type       = "AVRO"
  definition = file("schemas/requests.avro.json")
}

# pubsub topic for requests
resource "google_pubsub_topic" "requests_topic" {
  project    = var.project_id
  name       = "requests"
  depends_on = [google_pubsub_schema.request_schema]
  schema_settings {
    schema   = google_pubsub_schema.request_schema.id
    encoding = "JSON"
  }
}

# subscription pushing requests to bigquery table
resource "google_pubsub_subscription" "bigquery_subscription" {
  project = var.project_id
  name    = "requests-bigquery-subscription"
  topic   = google_pubsub_topic.requests_topic.name
  bigquery_config {
    table               = join(":", [var.project_id, "${google_bigquery_table.requests.dataset_id}.${google_bigquery_table.requests.table_id}"])
    use_topic_schema    = true
    write_metadata      = true
    drop_unknown_fields = true
  }
  dead_letter_policy {
    dead_letter_topic     = google_pubsub_topic.dead_letter_topic.id
    max_delivery_attempts = 5
  }
  depends_on = [google_project_iam_member.permissions_pubsub_serviceaccount]
}
