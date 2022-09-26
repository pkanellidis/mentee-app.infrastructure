resource "github_repository" "mentee-app-backend" {
  name        = "mentee-app.backend"
  description = "The Core Application of our Babbel Mentee Project"

  delete_branch_on_merge = true

  visibility = "public"
  auto_init  = true
}

resource "github_branch" "mentee-backend-main" {
  repository = github_repository.mentee-app-backend.name
  branch     = "main"
}

resource "github_branch_default" "default-branch-mentee-backend"{
  repository = github_repository.mentee-app-backend.name
  branch     = github_branch.mentee-backend-main.branch
}