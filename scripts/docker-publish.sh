#!/bin/bash

DOCKER_ENV=''
DOCKER_TAG=''

case "$TRAVIS_BRANCH" in
   "master")
       DOCKER_ENV=production
       DOCKER_TAG=latest
     ;;
    "dev")
       DOCKER_ENV=dev
       DOCKER_TAG=dev
     ;;
esac

docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"

docker build -f ./Dockerfile -t simple-app-symfony:$DOCKER_TAG . --no-cache
docker tag  simple-app-symfony:$DOCKER_TAG $DOCKER_USERNAME/simple-app-symfony:$DOCKER_TAG
docker push $DOCKER_USERNAME/simple-app-symfony:$DOCKER_TAG

echo "DONE!"
