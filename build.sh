#!/bin/bash

set -eux

VERSION=4.6.0
MINOR_VERSION=4.6
MAJOR_VERSION=4

docker build --no-cache --pull -t dehy/adminer:latest .
docker tag dehy/adminer:latest dehy/adminer:$MAJOR_VERSION
docker tag dehy/adminer:latest dehy/adminer:$MINOR_VERSION
docker tag dehy/adminer:latest dehy/adminer:$VERSION

docker push dehy/adminer:$MAJOR_VERSION
docker push dehy/adminer:$MINOR_VERSION
docker push dehy/adminer:$VERSION
docker push dehy/adminer:latest