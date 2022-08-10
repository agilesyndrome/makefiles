# Docker

## Tasks

* **docker-build**

## Variables


Var | Purpose | Default
:---|:--------|:---------
DOCKER_ORG | The docker organization name | `basename $(dirname $PWD)`
DOCKER_IMAGE | The name of the Docker image to build | `basename $PWD`
DOCKER_TAG | Docker image tag | `dev`
DOCKER_FILE | Where Dockerfile lives | `./docker/Dockerfile`
APP_CODE | Docker context directory | `.`



## Assumptions

1. Dockerfile lives in ./docker/Dockerfile
1. A script exists at ./docker/build-env that can source env vars
1. A text file exists at ./docker/build-args that tells Docker what --build-args to pass in
