#!/bin/bash
set -e

ZOOKEEPER_VERSION=3.7.1

docker pull ubuntu:22.04
docker build . -f zk.Dockerfile -t yunnysunny/zookeeper:${ZOOKEEPER_VERSION} \
--build-arg ZOOKEEPER_VERSION=${ZOOKEEPER_VERSION}
if [ "$NEED_PUSH" = "1" ] ; then
    docker push yunnysunny/zookeeper:${ZOOKEEPER_VERSION}
fi



