default: help

repo="quay.io/nordstrom/fluent-bit"
fluentbit_version="1.0.4"

help: ## this help
	@awk 'BEGIN {FS = ":.*?## "} /^[\/a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' Makefile

docker_check := $(if $(shell which docker),"",$(error "No docker in PATH")))

build: ## build docker images
	docker build --tag "${repo}:${fluentbit_version}" --build-arg FLUENTBIT_VERSION="${fluentbit_version}" . 
	docker build --tag "${repo}:${fluentbit_version}-debug" --build-arg FLUENTBIT_VERSION="${fluentbit_version}-debug" . 

push: ## push to quay
	docker push "${repo}:${fluentbit_version}"
	docker push "${repo}:${fluentbit_version}-debug"

.PHONY: build
