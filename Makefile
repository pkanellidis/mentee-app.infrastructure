terraform_fmt:
	terraform fmt -diff=true -check -recursive

terraform_validate:
	terraform validate

terraform_ci:
	./bin/build.sh
	terraform init
	terraform validate
	terraform fmt -diff=true -check -recursive
