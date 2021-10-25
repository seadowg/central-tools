#!/bin/bash

set -e

pushd ~/central
  cp .env ~/
  docker-compose stop

  git reset HEAD --hard
  git checkout master
  git pull
  git submodule update -i

  cp ~/.env .

  docker-compose build
  docker-compose up -d
  echo "y" | docker image prune
popd
