#!/bin/bash

# for returning later to the main directory
ROOT_DIRECTORY=`pwd`

# read repository configuration
source $ROOT_DIRECTORY/vars

# for each enabled repository
for REPOSITORY in $REPOSITORIES; do
    # publish all enabled versions
    for TAG in $TAGS; do
      # some verbose
      echo $'\n\n'"--> Publishing $NAMESPACE:$TAG"$'\n'
      # publish
      docker push $NAMESPACE:$TAG
    done

    # create the latest tag
    echo $'\n\n'"--> Publishing $NAMESPACE:latest (from $LATEST)"$'\n'
    docker push $NAMESPACE:latest
done