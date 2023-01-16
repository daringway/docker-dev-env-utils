# FROM docker/dev-environments-default:stable-1 as base
FROM mcr.microsoft.com/devcontainers/base as base

# Fish repo
RUN echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_11/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list && \
    curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_11/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null

RUN sudo apt-get update -y && sudo apt-get install -y fish git-lfs

COPY env /dw/env
COPY bin /dw/bin
RUN for x in /dw/bin/* ; do ln -s $x /usr/bin/$(basename $x) ; done

# RUN cd /dw \
#     && git clone --depth 1 https://github.com/daringway/cli-tools.git
# run install.sh for cli-tools after user 

# Permission issue with docker and non-root as repo is copied as vscode
# RUN useradd -l -u 50000 -G sudo -md /home/developer -s /bin/bash -p developer developer 
# RUN adduser developer sudo
# RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
# RUN cat /root/.bashrc > /home/developer/.bashrc

# Remove the interactive crap
RUN cat /root/.bashrc > /home/vscode/.bashrc

RUN date > /dw/build-date
USER vscode
WORKDIR "/home/vscode"

# RUN /dw/cli-tools/install.sh

FROM base as test
COPY test /dw/test
# RUN install-python      3.10.9  # Must specify patch version
# RUN install-aws-cli     latest  # Only latest is supported
# RUN install-node        18.12.1 # Any nvm support version
# RUN install-yarn        latest  # Latest or apt version
# RUN install-amplify-cli 10.6.0  # Any npm supported version
# RUN install-by-pip      invoke==1.7

CMD ["bash"]
