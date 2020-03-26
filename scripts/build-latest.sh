#!/bin/sh
DENO_VERSION=$(./version.sh | cut -c2-) 
docker build -t deno:${DENO_VERSION} -f ../0/stretch/Dockerfile --build-arg DENO_VERSION=$DENO_VERSION ../0/stretch/
docker tag deno:${DENO_VERSION} deno:latest 
docker tag deno:${DENO_VERSION} deno:${DENO_VERSION}-stretch
docker tag deno:${DENO_VERSION} deno:0.37 
docker tag deno:${DENO_VERSION} deno:0.37-strecht 
docker tag deno:${DENO_VERSION} deno:0 
docker tag deno:${DENO_VERSION} deno:0-stretch

docker tag deno:${DENO_VERSION} dockerimages/deno:${DENO_VERSION}
docker tag deno:${DENO_VERSION} dockerimages/deno:latest 
docker tag deno:${DENO_VERSION} dockerimages/deno:${DENO_VERSION}-stretch
docker tag deno:${DENO_VERSION} dockerimages/deno:0.37
docker tag deno:${DENO_VERSION} dockerimages/deno:0.37-strecht 
docker tag deno:${DENO_VERSION} dockerimages/deno:0 
docker tag deno:${DENO_VERSION} dockerimages/deno:0-stretch