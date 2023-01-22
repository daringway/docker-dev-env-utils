FROM mcr.microsoft.com/devcontainers/base as base

# From https://devguide.python.org/getting-started/setup-building/index.html#deps-on-linux
RUN apt-get update -y && apt-get install -yq \
    build-essential gdb lcov pkg-config \
    libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev \
    libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev \
    lzma lzma-dev tk-dev uuid-dev zlib1g-dev

COPY bin /usr/bin
CMD bash
# docker build --platform linux/arm64 -f Dockerfile -t builder .
# docker run -it -v $(pwd)/dist:/dist:rw builder build python 3.10.1