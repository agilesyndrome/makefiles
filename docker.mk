DOCKER_ORG:=$(shell basename $$(dirname $$PWD))
DOCKER_IMAGE:=$(shell basename $$PWD)
DOCKER_TAG:=$(shell git branch --show-current)
DOCKER_FILE:=./docker/Dockerfile
CTX:=app

docker-debug:
	echo $(APP_ROOT)

docker-build:
	@. ./.makeconfig && \
	. ./docker/build-env && \
	docker build \
		--build-arg $(shell cat ./docker/build-args) \
		-t $(DOCKER_ORG)/$(DOCKER_IMAGE):$(DOCKER_TAG) \
		-f ./docker/Dockerfile \
		 $${APP_CODE}

docker-up:
	@docker-compose -f ./docker/docker-compose.yml up

docker-shell:
	@docker-compose -f ./docker/docker-compose.yml exec $(CTX) bash