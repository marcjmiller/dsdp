#!/bin/bash

function main {
  install_deps
  docker compose up 
}

function install_deps {
  pushd ./frontend
    yarn install
  popd
    earthly +run-dev
}

main