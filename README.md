# Mentee App Infrastructure

This Terraform project, contains the Terraform configuration for our Mentoring Project

## How to run

- Make your changes
- TODO: Include .env info
- Run `make build`. This will aggregate all the `.tf` files
under `./projects` to a file called `_build.tf`
- Run `terraform init` to initialize the configuration and external libraries used for the project
- Run `make terraform_fmt` to validate the formatting of the project. Note that if you make any changes, you need to run `make build` again in order
for the `_build.tf` to be updated
- Run `terraform validate` to check if your configuration is valid
- Run `terraform apply`