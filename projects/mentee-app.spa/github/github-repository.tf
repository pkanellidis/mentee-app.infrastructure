resource "github_repository" "mentee-app-spa" {
  name        = "mentee-app.spa"
  description = "The Client-Facing Application of our Babbel Mentee Project"

  delete_branch_on_merge = true

  visibility = "public"
  auto_init  = true
}

resource "github_branch" "mentee-spa-main" {
  repository = github_repository.mentee-app-spa.name
  branch     = "main"
}

resource "github_branch_default" "default-branch-mentee-spa"{
  repository = github_repository.mentee-app-spa.name
  branch     = github_branch.mentee-spa-main.branch
}