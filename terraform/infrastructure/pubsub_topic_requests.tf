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
