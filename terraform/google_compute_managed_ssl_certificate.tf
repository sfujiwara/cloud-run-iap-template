resource "google_compute_managed_ssl_certificate" "default" {
  provider = google
  project  = var.project
  name     = var.name

  managed {
    domains = [var.domain]
  }
}
