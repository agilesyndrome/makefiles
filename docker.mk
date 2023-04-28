DOCKER_ORG:=$(shell basename $$(dirname $$PWD))
DOCKER_IMAGE:=$(shell basename $$PWD)
DOCKER_TAG:=$(shell git branch --show-current)
DOCKER_FILE:=./docker/Dockerfile
COMPOSE_PROJECT:=$${APP_NAME}
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
	. ./.makeconfig && \
	docker-compose -f ./docker/docker-compose.yml -p $(COMPOSE_PROJECT) up

docker-shell:
	. ./.makeconfig && \
	docker-compose -f ./docker/docker-compose.yml -p $(COMPOSE_PROJECT) exec $(CTX) bash
