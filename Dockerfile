FROM docker/dev-environments-default:stable-1


COPY bin /usr/bin
COPY env /usr/daring/env

CMD ["bash"]
