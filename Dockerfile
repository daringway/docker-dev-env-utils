FROM docker/dev-environments-default:stable-1

RUN sudo apt-get update -y && sudo apt-get install -y git-lfs

COPY bin /dw/bin
COPY env /dw/env

RUN for x in /dw/bin/* ; do ln -s $x /usr/bin/$(basename $x) ; done

CMD ["bash"]
