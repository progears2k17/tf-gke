resource "google_artifact_registry_repository" "repository" {
  provider      = google
  location      = "europe-west1"
  repository_id = "clouddeploy"
  description   = "My repository for Docker images"
  format        = "DOCKER"
}