resource "google_compute_global_forwarding_rule" "default" {
  name                  = "${var.name}-forwarding-rule"
  project               = var.project
  target                = google_compute_target_https_proxy.default.id
  port_range            = "443"
  ip_address            = google_compute_global_address.default.address
  load_balancing_scheme = "EXTERNAL_MANAGED"
}
