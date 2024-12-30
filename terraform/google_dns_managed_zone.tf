resource "google_dns_managed_zone" "default" {
  project     = var.project
  name        = replace(var.domain, ".", "-")
  dns_name    = "${var.domain}."
  description = "DNS zone for ${var.domain}."
}
