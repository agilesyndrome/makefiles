DOCKER_ORG:=$(shell basename $$(dirname $$PWD))
DOCKER_IMAGE:=$(shell basename $$PWD)
DOCKER_TAG:=dev

image:
	@echo $(DOCKER_ORG)
	@echo $(DOCKER_IMAGE)
	docker build -t $(DOCKER_ORG)/$(DOCKER_IMAGE):$(DOCKER_TAG)

