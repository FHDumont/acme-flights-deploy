#!/bin/bash

export DOCKER_BUILDKIT=1;

docker build -t appdynamics/machine-agent-local:25.4.0.4712 --no-cache -f machine-agent/Dockerfile .
