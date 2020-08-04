#!/bin/bash

set -e

cp central/.env .

pushd central
  docker-compose stop

  git reset HEAD --hard
  git pull
  git submodule update -i

  cp ../.env .

  docker-compose build
  docker-compose up -d
popd
