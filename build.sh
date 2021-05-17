#!/bin/bash

set -eux

VERSION=4.8.1
MINOR_VERSION=4.8
MAJOR_VERSION=4

IMAGE_NAME=dehy/adminer:latest hooks/build
docker tag dehy/adminer:latest dehy/adminer:$MAJOR_VERSION
docker tag dehy/adminer:latest dehy/adminer:$MINOR_VERSION
docker tag dehy/adminer:latest dehy/adminer:$VERSION

docker push dehy/adminer:$MAJOR_VERSION
docker push dehy/adminer:$MINOR_VERSION
docker push dehy/adminer:$VERSION
docker push dehy/adminer:latest
