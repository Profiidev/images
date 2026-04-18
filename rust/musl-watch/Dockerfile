FROM debian:bullseye-slim@sha256:0083feb8da4f624e3a0245e7752af2517d4b81d8b8db50c725644672a132a31b AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y wget xz-utils ca-certificates && rm -rf /var/lib/apt/lists/*

# download and install cargo-watch for the current architecture
RUN wget https://github.com/watchexec/cargo-watch/releases/download/v8.5.3/cargo-watch-v8.5.3-$(uname -m)-unknown-linux-gnu.tar.xz \
    && tar -xJf cargo-watch-v8.5.3-$(uname -m)-unknown-linux-gnu.tar.xz \
    && mv cargo-watch-v8.5.3-$(uname -m)-unknown-linux-gnu/cargo-watch /cargo-watch \
    && rm -rf cargo-watch-*

FROM rust:1-slim@sha256:319f354c6f068b01c19292555033a0e6133b4249a893c479aec3b0b8ab2f660a

RUN apt-get update && apt-get install -y tini && rm -rf /var/lib/apt/lists/*
COPY --from=builder /cargo-watch /usr/local/cargo/bin/cargo-watch

WORKDIR /app