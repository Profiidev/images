FROM debian:bullseye-slim@sha256:0083feb8da4f624e3a0245e7752af2517d4b81d8b8db50c725644672a132a31b AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y wget xz-utils ca-certificates && rm -rf /var/lib/apt/lists/*

# use latest when gnu builds are available again
RUN wget https://github.com/LukeMathWalker/cargo-chef/releases/latest/download/cargo-chef-$(uname -m)-unknown-linux-gnu.tar.xz \
    && tar -xJf cargo-chef-$(uname -m)-unknown-linux-gnu.tar.xz \
    && mv cargo-chef-$(uname -m)-unknown-linux-gnu/cargo-chef /cargo-chef \
    && rm -rf cargo-chef-*

FROM rust:slim@sha256:319f354c6f068b01c19292555033a0e6133b4249a893c479aec3b0b8ab2f660a

COPY --from=builder /cargo-chef /usr/local/cargo/bin/cargo-chef

WORKDIR /app
