FROM debian:trixie-slim@sha256:a99cfc517144bc59b1978475ec53b46ecabec7e43635402ee5b77cc54cd1b20a AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y wget xz-utils ca-certificates && rm -rf /var/lib/apt/lists/*

# use latest when gnu builds are available again
RUN wget https://github.com/LukeMathWalker/cargo-chef/releases/latest/download/cargo-chef-$(uname -m)-unknown-linux-gnu.tar.xz \
    && tar -xJf cargo-chef-$(uname -m)-unknown-linux-gnu.tar.xz \
    && mv cargo-chef-$(uname -m)-unknown-linux-gnu/cargo-chef /cargo-chef \
    && rm -rf cargo-chef-*

FROM rust:slim@sha256:4cd829461bd5c4d511c32e269da9cb8929223b666519d8004e35fc8d1d771ab7

COPY --from=builder /cargo-chef /usr/local/cargo/bin/cargo-chef

WORKDIR /app
