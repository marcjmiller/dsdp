#!/bin/bash

function main {
  install_deps
  docker compose --profile dev up 
}

function install_deps {
  pushd ./frontend
    yarn install
  popd
    earthly +run-dev
}

main