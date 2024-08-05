#!/bin/bash

NAME=$(cat pyproject.toml | grep name | awk -F "\"" '{print $2}')
VERSION=$(cat pyproject.toml | grep version | awk -F "\"" '{print $2}')

docker buildx build . -t $NAME:$VERSION --load 
docker tag $NAME:$VERSION $NAME:latest
