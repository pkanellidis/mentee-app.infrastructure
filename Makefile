
build:
		./bin/build.sh projects

validate:
		make build
		terraform validate
