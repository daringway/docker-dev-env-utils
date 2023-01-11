FROM docker/dev-environments-default:stable-1

COPY bin /dw/bin
COPY env /dw/env

RUN for x in /dw/bin/* ; do ln -s $x /usr/bin/$(basename $x) ; done

CMD ["bash"]
