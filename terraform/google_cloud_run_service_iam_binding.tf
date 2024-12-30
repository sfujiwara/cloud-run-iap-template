resource "google_cloud_run_service_iam_binding" "default" {
  project  = var.project
  location = google_cloud_run_v2_service.default.location
  service  = google_cloud_run_v2_service.default.name
  role     = "roles/run.invoker"
  members  = ["allUsers"]
}
