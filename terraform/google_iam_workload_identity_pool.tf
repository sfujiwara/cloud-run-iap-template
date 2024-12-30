resource "google_iam_workload_identity_pool" "github" {
  workload_identity_pool_id = "github"
  display_name              = "GitHub"
  description               = "Used for GitHub Actions"
}
