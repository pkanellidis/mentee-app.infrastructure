build:
	./bin/build.sh projects

terraform_fmt:
	./bin/build.sh projects
	terraform fmt -diff=true -check -recursive

terraform_validate:
	./bin/build.sh projects
	terraform validate

terraform_ci:
	./bin/build.sh
	terraform init
	terraform validate
	terraform fmt -diff=true -check -recursive
