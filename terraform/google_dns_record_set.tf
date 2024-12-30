resource "google_dns_record_set" "default" {
  project      = var.project
  name         = "${var.domain}."
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.default.name
  rrdatas      = [google_compute_global_address.default.address]
}
