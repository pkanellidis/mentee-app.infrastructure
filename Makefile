build:
	./bin/build.sh projects

terraform_fmt:
	terraform fmt -diff=true -check -recursive

terraform_validate:
	terraform validate

terraform_ci:
	terraform fmt -diff=true -check -recursive
