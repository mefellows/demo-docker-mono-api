#!/bin/bash
docker build -t tmp-build .                                         # Run the CI build
docker run -d --name tmp-build tmp-build                            # Run the 'ci' container and get the artifact
docker cp tmp-build:/usr/src/app/source/packages .                  # This is a sort of package caching mechanism
docker cp tmp-build:/usr/src/app/source/consoleapp ./distribution/  # Put static binary with distribution container build
docker rm -f tmp-build