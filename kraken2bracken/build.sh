#!/bin/sh
docker build -t gmtscience/kraken2bracken:2.1.2b .
docker push gmtscience/kraken2bracken:2.1.2b
docker tag gmtscience/kraken2bracken:2.1.2b gmtscience/kraken2bracken:latest
docker push gmtscience/kraken2bracken:latest