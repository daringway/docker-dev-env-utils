FROM docker/dev-environments-default:stable-1

COPY bin /dw/bin
COPY env /dw/env

WORKDIR /usr/bin
RUN for x in /dw/bin/* ; do ln -s $x ; done

CMD ["bash"]
