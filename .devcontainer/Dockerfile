FROM ghcr.io/daringway/docker-dev-env-utils:main as builder

# To test changes to this docker file before pushing you can build/run
# Build on Mac M1
#     docker build --platform linux/arm64 -f Dockerfile -t container-test .
# Othe platforms
#     docker build -f Dockerfile -t container-test .
# Test environment before commit
#     docker run -it container-test bash

RUN install-docker
