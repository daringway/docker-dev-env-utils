FROM docker/dev-environments-default:stable-1 as base

# Fish repo
RUN echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_11/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list && \
    curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_11/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null

RUN sudo apt-get update -y && sudo apt-get install -y fish git-lfs

COPY env /dw/env
COPY bin /dw/bin
RUN for x in /dw/bin/* ; do ln -s $x /usr/bin/$(basename $x) ; done

RUN useradd -l -u 50000 -G sudo -md /home/daring -s /bin/bash -p daring daring 
RUN adduser daring sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN cat /root/.bashrc > /home/daring/.bashrc

USER daring
WORKDIR "/home/daring"

FROM base as test
COPY test /dw/test

RUN install-python      3.10.9  # Must specify patch version
RUN install-aws-cli     latest  # Only latest is supported
RUN install-node        18.12.1 # Any nvm support version
RUN install-yarn        latest  # Latest or apt version
RUN install-amplify-cli 10.6.0  # Any npm supported version

# RUN install-by-pip      invoke==1.7

CMD ["bash"]

FROM base as default
CMD ["bash"]
