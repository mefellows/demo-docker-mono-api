#!/bin/bash

# Build the base image
docker build -t mefellows/mono-static base

# Build the binary in a 'CI' process, and extract from container
./build-binary.sh

# Build distributable container from new binary
docker build -t mfellows/mono-api distribution