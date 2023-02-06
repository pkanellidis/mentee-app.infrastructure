build:
	./bin/build.sh projects

terraform_fmt:
	terraform fmt -diff=true -check -recursive

terraform_validate:
	terraform validate

load_env:
	. ./.env
