resource "google_bigquery_dataset" "warehouse" {
  dataset_id  = "warehouse"
  description = "Central data warehouse"
  location    = var.region

  depends_on = [google_project_service.apis]
}

resource "google_bigquery_dataset" "staging" {
  dataset_id  = "staging"
  description = "Staging area for raw ingested data"
  location    = var.region

  depends_on = [google_project_service.apis]
}
