resource "google_compute_backend_service" "default" {
  project               = var.project
  name                  = "${var.name}-backend-service"
  protocol              = "HTTP"
  port_name             = "http"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  timeout_sec           = 30

  backend {
    group = google_compute_region_network_endpoint_group.default.id
  }

  iap {
    enabled              = true
    oauth2_client_id     = var.oauth2_client_id
    oauth2_client_secret = var.oauth2_client_secret
  }
}
