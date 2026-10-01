FROM debian:trixie-slim@sha256:a99cfc517144bc59b1978475ec53b46ecabec7e43635402ee5b77cc54cd1b20a AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y wget xz-utils ca-certificates && rm -rf /var/lib/apt/lists/*

# download and install cargo-watch for the current architecture
RUN wget https://github.com/watchexec/cargo-watch/releases/download/v8.5.3/cargo-watch-v8.5.3-$(uname -m)-unknown-linux-gnu.tar.xz \
    && tar -xJf cargo-watch-v8.5.3-$(uname -m)-unknown-linux-gnu.tar.xz \
    && mv cargo-watch-v8.5.3-$(uname -m)-unknown-linux-gnu/cargo-watch /cargo-watch \
    && rm -rf cargo-watch-*

FROM rust:1-slim@sha256:4cd829461bd5c4d511c32e269da9cb8929223b666519d8004e35fc8d1d771ab7

RUN apt-get update && apt-get install -y tini && rm -rf /var/lib/apt/lists/*
COPY --from=builder /cargo-watch /usr/local/cargo/bin/cargo-watch

WORKDIR /app
