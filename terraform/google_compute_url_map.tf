resource "google_compute_url_map" "default" {
  project         = var.project
  name            = "${var.name}-url-map"
  default_service = google_compute_backend_service.default.id
}
