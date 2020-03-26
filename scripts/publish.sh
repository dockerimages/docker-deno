#!/bin/bash
DOCKER_USERNAME=dockerimages
DOCKER_PASSWORD=hsahshshahdhahsdhfadhd
#echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin
export DENO_VERSION=0.37.1
#./version.sh
#./version.sh > version.txt && cat version.txt
docker push dockerimages/deno:${DENO_VERSION}
docker push dockerimages/deno:latest 
docker push dockerimages/deno:${DENO_VERSION}-stretch
docker push dockerimages/deno:0.37
docker push dockerimages/deno:0.37-strecht 
docker push dockerimages/deno:0 
docker push dockerimages/deno:0-stretch