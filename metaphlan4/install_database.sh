#!/bin/sh

mkdir -p /resource/humann

humann_databases --download chocophlan full /resource/humann --update-config yes
humann_databases --download uniref uniref90_diamond /resource/humann --update-config yes
humann_databases --download utility_mapping full /resource/humann --update-config yes
