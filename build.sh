#!/bin/bash

set -eux

VERSION=4.5.0
MINOR_VERSION=4.5
MAJOR_VERSION=4

docker build --no-cache -t dehy/adminer:latest .
docker tag dehy/adminer:latest dehy/adminer:$VERSION
docker tag dehy/adminer:latest dehy/adminer:$MINOR_VERSION
docker tag dehy/adminer:latest dehy/adminer:$MAJOR_VERSION
