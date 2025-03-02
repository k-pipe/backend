# pubsub topic undeliverable messages
resource "google_pubsub_topic" "dead_letter_topic" {
  project = var.project_id
  name    = "deadletter_topic"
}

# Create a subscription so that we don't lose messages published to dead letter topic
resource "google_pubsub_subscription" "deadletter_topic_sub" {
  project = var.project_id
  name    = "deadletter_subscription"
  topic   = google_pubsub_topic.dead_letter_topic.name
}

