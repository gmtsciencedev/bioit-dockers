#!/bin/sh
DOCKER_NAME=kraken2bracken
DOCKER_VERSION=2.1.2b
docker build -t gmtscience/${DOCKER_NAME}:${DOCKER_VERSION} .
docker push gmtscience/${DOCKER_NAME}:${DOCKER_VERSION}
docker tag gmtscience/${DOCKER_NAME}:${DOCKER_VERSION} gmtscience/${DOCKER_NAME}:latest
docker push gmtscience/${DOCKER_NAME}:latest