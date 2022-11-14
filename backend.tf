terraform {
  backend "s3" {
    bucket = "pkanellidis-awendt-terraform-s3-backend"
    key    = "mentee-app.infrastructure/terraform.tfstate"
    region = "eu-west-1"

    profile = "sandbox"
  }
}
