#!/bin/sh
docker build -t gmtscience/metaphlan4:4.0.3 .
docker push gmtscience/metaphlan4:4.0.3
docker tag gmtscience/metaphlan4:4.0.3 gmtscience/metaphlan4:latest
docker push gmtscience/metaphlan4:latest