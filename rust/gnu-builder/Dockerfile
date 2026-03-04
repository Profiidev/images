FROM debian:bullseye-slim AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y wget xz-utils ca-certificates && rm -rf /var/lib/apt/lists/*

# use latest when gnu builds are available again
RUN wget https://github.com/LukeMathWalker/cargo-chef/releases/latest/download/cargo-chef-x86_64-unknown-linux-gnu.tar.xz \
    && tar -xJf cargo-chef-x86_64-unknown-linux-gnu.tar.xz \
    && mv cargo-chef-x86_64-unknown-linux-gnu/cargo-chef /cargo-chef \
    && rm -rf cargo-chef-*

FROM rust:slim

COPY --from=builder /cargo-chef /usr/local/cargo/bin/cargo-chef

WORKDIR /app
