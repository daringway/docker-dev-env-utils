# FROM docker/dev-environments-default:stable-1 as base
FROM mcr.microsoft.com/devcontainers/base as base

# Fish repo
RUN echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_11/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list && \
    curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_11/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null

RUN sudo apt-get update -y && sudo apt-get install -y fish git-lfs

COPY env /dw/env
COPY bin /dw/bin
RUN for x in /dw/bin/* ; do ln -s $x /usr/bin/$(basename $x) ; done

RUN date > /dw/build-date

FROM base as test
COPY test /dw/test

# RUN install-python      3.10.9  # Must specify patch version
# RUN install-aws-cli     latest  # Only latest is supported
# RUN install-node        18.12.1 # Any nvm support version
# RUN install-yarn        latest  # Latest or apt version
# RUN install-amplify-cli 10.6.0  # Any npm supported version
# RUN install-by-pip      invoke==1.7

# time in seconds
# gRPC Fuse: 65.30, 80.24, 80.90
# virtioFS:  48.26, 40.69, 44.33
# native:    29.60, 24.70, 25.38

# Default as well.
FROM base as developer
RUN install-docker
USER vscode
WORKDIR /home/vscode
CMD ["bash"]

# Default as well.
FROM base as release
USER vscode
WORKDIR /home/vscode
CMD ["bash"]