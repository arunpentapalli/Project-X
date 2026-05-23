output "gcs_bucket_name" {
  value = google_storage_bucket.data_lake.name
}

output "cloudsql_connection_name" {
  value = google_sql_database_instance.postgres.connection_name
}

output "cloudsql_public_ip" {
  value = google_sql_database_instance.postgres.public_ip_address
}

output "bigquery_warehouse_dataset" {
  value = google_bigquery_dataset.warehouse.dataset_id
}

output "bigquery_staging_dataset" {
  value = google_bigquery_dataset.staging.dataset_id
}

output "pubsub_topic" {
  value = google_pubsub_topic.events.name
}
