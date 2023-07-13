#!/bin/sh

# name and tag of the docker image
IMAGE_NAME_TAG="eurekaserver:0.0.1-SNAPSHOT"

# check if the image already exists
if [ "$(docker images -q ${IMAGE_NAME_TAG} 2>/dev/null)" = "" ]; then
  echo "Image does not exist. Building now..."

  # build the Docker image
  mvn spring-boot:build-image
else
  echo "Image already exists. No need to build."
fi

# start the docker container
docker run --rm --name wf-eureka-server -p 8761:8761 ${IMAGE_NAME_TAG}
