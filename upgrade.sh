#!/bin/bash

set -e

pushd ~/central
  docker-compose stop

  git pull
  git submodule update -i

  docker-compose build
  docker-compose up -d
  echo "y" | docker image prune
popd
