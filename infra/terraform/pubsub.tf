resource "google_pubsub_topic" "events" {
  name = "app-events"

  message_retention_duration = "86600s" # ~24 hours

  depends_on = [google_project_service.apis]
}

resource "google_pubsub_subscription" "events_sub" {
  name  = "app-events-sub"
  topic = google_pubsub_topic.events.name

  ack_deadline_seconds = 30

  retain_acked_messages      = false
  message_retention_duration = "86600s"

  expiration_policy {
    ttl = "" # never expires
  }
}
