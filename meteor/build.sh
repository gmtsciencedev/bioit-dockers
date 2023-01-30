#!/bin/sh
docker build -t gmtscience/meteor:3.2 .
docker push gmtscience/meteor:3.2
docker tag gmtscience/meteor:3.2 gmtscience/meteor:latest
docker push gmtscience/meteor:latest