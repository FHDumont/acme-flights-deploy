#!/bin/bash

export DOCKER_BUILDKIT=1;

docker build -t appdynamics/machine-agent-netviz:22.9.0.3458 --no-cache -f machine-agent/Dockerfile .
