#!/bin/bash

function main {
  # frontend
  backend
  # e2e
}

function backend {
  pushd backend/
    echo "Running backend tests..."
    poetry run pytest
  popd
}

function frontend {
  cd frontend/
    echo "Running frontend tests..."
    yarn test:unit
  cd ..
}

function e2e {
  pushd frontend/
  echo "Running end to end tests..."
  yarn test:e2e
  popd
}

main