#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: build.sh <tag>"
  exit 1
fi

IMG='metavertex/devbox'

docker build -t $IMG -t $IMG:latest -t $IMG:$1 .
