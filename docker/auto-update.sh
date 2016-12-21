#!/usr/bin/env bash
set -e

cd $(dirname $0)

. ./.env

BASE_IMAGE="app"
REGISTRY="opensalt"
TAG=$COMMIT
IMAGE="$REGISTRY/$BASE_IMAGE:$TAG"
CID=$(docker ps -a | grep $IMAGE | grep " ${COMPOSE_PROJECT_NAME}_" | awk '{print $1}')
docker pull $IMAGE

for im in $CID
do
    LATEST=`docker inspect --format "{{.Id}}" $IMAGE`
    RUNNING=`docker inspect --format "{{.Image}}" $im`
    NAME=`docker inspect --format '{{.Name}}' $im | sed "s/\///g"`
    echo "Latest:" $LATEST
    echo "Running:" $RUNNING
    if [ "$RUNNING" != "$LATEST" ];then
        echo "upgrading $NAME"
        docker-compose up -d
        sleep 30
        ../bin/update.sh
    else
        echo "$NAME up to date"
    fi
done
