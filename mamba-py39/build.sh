#!/bin/sh
docker build -t gmtscience/mamba-py39:1.1.0b .
docker push gmtscience/mamba-py39:1.1.0b
docker tag gmtscience/mamba-py39:1.1.0b gmtscience/mamba-py39:latest
docker push gmtscience/mamba-py39:latest