resource "google_sql_database_instance" "postgres" {
  name             = "${var.project_id}-pg"
  database_version = "POSTGRES_15"
  region           = var.region

  settings {
    tier = "db-f1-micro" # smallest free-tier eligible instance

    backup_configuration {
      enabled = true
    }

    ip_configuration {
      # Public IP with authorized networks — fine for personal dev
      ipv4_enabled = true
    }
  }

  # Prevent accidental deletion
  deletion_protection = true

  depends_on = [google_project_service.apis]
}

resource "google_sql_database" "app_db" {
  name     = "app_db"
  instance = google_sql_database_instance.postgres.name
}

resource "google_sql_user" "app_user" {
  name     = "app_user"
  instance = google_sql_database_instance.postgres.name
  password = var.db_password
}
