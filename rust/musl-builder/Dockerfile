FROM debian:bullseye-slim AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y wget xz-utils ca-certificates && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/LukeMathWalker/cargo-chef/releases/latest/download/cargo-chef-x86_64-unknown-linux-musl.tar.gz \
    && tar -xzf cargo-chef-x86_64-unknown-linux-musl.tar.gz \
    && mv cargo-chef /cargo-chef \
    && rm -rf cargo-chef-*

FROM rust:1-slim
COPY --from=builder /cargo-chef /usr/local/cargo/bin/cargo-chef

RUN rustup target add x86_64-unknown-linux-musl

WORKDIR /app