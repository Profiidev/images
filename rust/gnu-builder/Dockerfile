FROM debian:bullseye-slim@sha256:cba95a21c96c1f5fc2470081829363eed57706634f7dc26e8c6712934303d57a AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y wget xz-utils ca-certificates && rm -rf /var/lib/apt/lists/*

# use latest when gnu builds are available again
RUN wget https://github.com/LukeMathWalker/cargo-chef/releases/latest/download/cargo-chef-$(uname -m)-unknown-linux-gnu.tar.xz \
    && tar -xJf cargo-chef-$(uname -m)-unknown-linux-gnu.tar.xz \
    && mv cargo-chef-$(uname -m)-unknown-linux-gnu/cargo-chef /cargo-chef \
    && rm -rf cargo-chef-*

FROM rust:slim@sha256:5c6f46a6e4472ab1ca7ba7d494e6677f2f219ebc02f32025d3986f057635ec9c

COPY --from=builder /cargo-chef /usr/local/cargo/bin/cargo-chef

WORKDIR /app
