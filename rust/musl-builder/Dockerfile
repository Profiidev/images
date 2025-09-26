FROM debian:bullseye-slim AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y wget xz-utils ca-certificates && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/LukeMathWalker/cargo-chef/releases/latest/download/cargo-chef-x86_64-unknown-linux-musl.tar.gz \
    && tar -xzf cargo-chef-x86_64-unknown-linux-musl.tar.gz \
    && mv cargo-chef /cargo-chef \
    && rm -rf cargo-chef-*

FROM messense/rust-musl-cross:x86_64-musl

RUN rustup target add x86_64-unknown-linux-musl
COPY --from=builder /cargo-chef /root/.cargo/bin/cargo-chef

WORKDIR /app