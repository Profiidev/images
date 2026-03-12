FROM debian:bullseye-slim AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y wget xz-utils ca-certificates && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/LukeMathWalker/cargo-chef/releases/latest/download/cargo-chef-$(uname -m)-unknown-linux-musl.tar.xz \
    && tar -xJf cargo-chef-x86_64-unknown-linux-musl.tar.xz \
    && mv cargo-chef-x86_64-unknown-linux-musl/cargo-chef /cargo-chef \
    && rm -rf cargo-chef-*

ARG TARGETARCH
FROM messense/rust-musl-cross:${TARGETARCH/amd64/x86_64}-musl

ARG TARGETARCH
ENV CARGO_CHEF_TARGET=${TARGETARCH/amd64/x86_64}-unknown-linux-musl

RUN rustup target add $CARGO_CHEF_TARGET
COPY --from=builder /cargo-chef /root/.cargo/bin/cargo-chef

WORKDIR /app
