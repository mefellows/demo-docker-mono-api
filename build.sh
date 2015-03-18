#!/bin/bash

# Run the 'CI' process in a bunch of Docker containers
docker build -t mfellows/mono-api-base base

# Build the binary
./build-binary.sh

# Build distributable container
docker build -t mfellows/mono-api distribution