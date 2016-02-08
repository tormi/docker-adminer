#!/bin/bash

set -e
set -u

VERSION=4.2.4
MINOR_VERSION=4.2
MAJOR_VERSION=4

docker build -t dehy/adminer:latest .
docker tag -f dehy/adminer:latest dehy/adminer:$VERSION
docker tag -f dehy/adminer:latest dehy/adminer:$MINOR_VERSION
docker tag -f dehy/adminer:latest dehy/adminer:$MAJOR_VERSION
