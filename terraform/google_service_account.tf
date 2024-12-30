resource "google_service_account" "github" {
  account_id   = "github-actions"
  display_name = "Service account for GitHub Actions"
}

resource "google_service_account_iam_member" "github" {
  service_account_id = google_service_account.github.id
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute.repository/${var.github_repository}"
}
