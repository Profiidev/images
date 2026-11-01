FROM debian:trixie-slim@sha256:f6b08b09a05725f9431502d3b5714f5c4576e82c1a84fa1debe0c24a7e0c3ec4 AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y wget xz-utils ca-certificates && rm -rf /var/lib/apt/lists/*

# use latest when gnu builds are available again
RUN wget https://github.com/LukeMathWalker/cargo-chef/releases/latest/download/cargo-chef-$(uname -m)-unknown-linux-gnu.tar.xz \
    && tar -xJf cargo-chef-$(uname -m)-unknown-linux-gnu.tar.xz \
    && mv cargo-chef-$(uname -m)-unknown-linux-gnu/cargo-chef /cargo-chef \
    && rm -rf cargo-chef-*

FROM rust:slim@sha256:b8e062b1c3a80183df83d9ba187cadd2b5ab84bc78d453dbfeb2fccd5f982247

COPY --from=builder /cargo-chef /usr/local/cargo/bin/cargo-chef

WORKDIR /app
