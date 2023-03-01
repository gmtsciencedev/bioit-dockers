#!/bin/sh
docker build -t gmtscience/mamba-py39:1.1.0c .
docker push gmtscience/mamba-py39:1.1.0c
docker tag gmtscience/mamba-py39:1.1.0c gmtscience/mamba-py39:latest
docker push gmtscience/mamba-py39:latest