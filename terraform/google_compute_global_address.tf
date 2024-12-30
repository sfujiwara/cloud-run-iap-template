# Global IP Adress
resource "google_compute_global_address" "default" {
  project = var.project
  name    = var.name
}
