#!/bin/bash
set -e
source ../scripts/read_param.sh

ZOOKEEPER_VERSION=3.7.0

docker pull openjdk:11
docker build . -f zk.Dockerfile -t yunnysunny/zookeeper:${ZOOKEEPER_VERSION} \
--build-arg ZOOKEEPER_VERSION=${ZOOKEEPER_VERSION}
if [ "$NEED_PUSH" = "1" ] ; then
    docker push yunnysunny/zookeeper:${ZOOKEEPER_VERSION}
fi



