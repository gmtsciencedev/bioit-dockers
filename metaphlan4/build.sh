#!/bin/sh
docker build -t gmtscience/metaphlan4:4.0.5 .
docker push gmtscience/metaphlan4:4.0.5
docker tag gmtscience/metaphlan4:4.0.5 gmtscience/metaphlan4:latest
docker push gmtscience/metaphlan4:latest