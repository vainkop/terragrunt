#!/bin/bash

docker build \
  --build-arg TERRAFORM_VERSION=1.0.1 \
  --build-arg TERRAGRUNT_VERSION=0.31.0 \
  -t vainkop/terragrunt:0.31.0 \
  -t vainkop/terragrunt:latest . && \
docker push vainkop/terragrunt:0.31.0 && \
docker push vainkop/terragrunt:latest