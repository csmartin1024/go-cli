#!/bin/bash

set -e

export AWS_ACCESS_KEY_ID=XXXXXXXXX
export AWS_SECRET_ACCESS_KEY=XXXXXXXXX
docker build -t go-builder:latest . -f Dockerfile.builder
docker build --build-arg AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID --build-arg AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -t go-cli:latest . -f Dockerfile
docker run go-cli:latest 