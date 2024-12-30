resource "google_artifact_registry_repository" "docker" {
  project       = var.project
  location      = var.location
  repository_id = "docker"
  format        = "DOCKER"
}
