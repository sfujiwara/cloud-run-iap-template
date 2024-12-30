resource "google_compute_target_https_proxy" "default" {
  name    = var.name
  project = var.project
  url_map = google_compute_url_map.default.id
  ssl_certificates = [
    google_compute_managed_ssl_certificate.default.id
  ]
}
