FROM debian:bullseye-slim AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y wget xz-utils ca-certificates && rm -rf /var/lib/apt/lists/*

# use latest when gnu builds are available again
RUN wget https://github.com/LukeMathWalker/cargo-chef/releases/download/v0.1.71/cargo-chef-x86_64-unknown-linux-gnu.tar.gz \
    && tar -xzf cargo-chef-x86_64-unknown-linux-gnu.tar.gz \
    && mv cargo-chef /cargo-chef \
    && rm -rf cargo-chef-*

FROM rust:slim

COPY --from=builder /cargo-chef /usr/local/cargo/bin/cargo-chef

WORKDIR /app