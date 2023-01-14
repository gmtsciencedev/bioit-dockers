#!/bin/sh
DOCKER_NAME=motus
DOCKER_VERSION=3.0.3
docker build -t gmtscience/${DOCKER_NAME}:${DOCKER_VERSION} .
docker push gmtscience/${DOCKER_NAME}:${DOCKER_VERSION}
docker tag gmtscience/${DOCKER_NAME}:${DOCKER_VERSION} gmtscience/${DOCKER_NAME}:latest
docker push gmtscience/${DOCKER_NAME}:latest