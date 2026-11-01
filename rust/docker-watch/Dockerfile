FROM debian:trixie-slim@sha256:f6b08b09a05725f9431502d3b5714f5c4576e82c1a84fa1debe0c24a7e0c3ec4 AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y wget xz-utils ca-certificates && rm -rf /var/lib/apt/lists/*

# download and install cargo-watch for the current architecture
RUN wget https://github.com/watchexec/cargo-watch/releases/download/v8.5.3/cargo-watch-v8.5.3-$(uname -m)-unknown-linux-gnu.tar.xz \
    && tar -xJf cargo-watch-v8.5.3-$(uname -m)-unknown-linux-gnu.tar.xz \
    && mv cargo-watch-v8.5.3-$(uname -m)-unknown-linux-gnu/cargo-watch /cargo-watch \
    && rm -rf cargo-watch-*

# static docker cli and buildx, for watchers that rebuild images on change
FROM docker:29-cli@sha256:5e6baf67325a79f64ed3bed6863954d5e05d0f3d4e57cbdb14809346814bbfdb AS docker

FROM rust:1-slim@sha256:b8e062b1c3a80183df83d9ba187cadd2b5ab84bc78d453dbfeb2fccd5f982247

RUN apt-get update && apt-get install -y tini && rm -rf /var/lib/apt/lists/*
COPY --from=builder /cargo-watch /usr/local/cargo/bin/cargo-watch
COPY --from=docker /usr/local/bin/docker /usr/local/bin/docker
COPY --from=docker /usr/local/libexec/docker/cli-plugins/docker-buildx /usr/local/libexec/docker/cli-plugins/docker-buildx

WORKDIR /app
