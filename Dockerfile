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

USER daring
WORKDIR "/home/daring"

FROM base as test
COPY test /dw/test
CMD ["fish"]

FROM base as default
CMD ["bash"]
