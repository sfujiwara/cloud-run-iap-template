resource "google_compute_region_network_endpoint_group" "default" {
  project               = var.project
  name                  = "${var.name}-neg"
  region                = var.location
  network_endpoint_type = "SERVERLESS"
  cloud_run {
    service = google_cloud_run_v2_service.default.name
  }
}
