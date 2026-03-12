ARG TARGETARCH
# If TARGETARCH is amd64, result is x86_64. If arm64, result is aarch64.
ARG RUST_ARCH=${TARGETARCH/amd64/x86_64}
ARG RUST_ARCH=${RUST_ARCH/arm64/aarch64}

FROM debian:bullseye-slim AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y wget xz-utils ca-certificates && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/LukeMathWalker/cargo-chef/releases/latest/download/cargo-chef-$(uname -m)-unknown-linux-musl.tar.xz \
    && tar -xJf cargo-chef-$(uname -m)-unknown-linux-musl.tar.xz \
    && mv cargo-chef-$(uname -m)-unknown-linux-musl/cargo-chef /cargo-chef \
    && rm -rf cargo-chef-*

FROM messense/rust-musl-cross:${RUST_ARCH}-musl

ARG TARGETARCH
ENV CARGO_CHEF_TARGET=${TARGETARCH/amd64/x86_64}-unknown-linux-musl

RUN rustup target add $CARGO_CHEF_TARGET
COPY --from=builder /cargo-chef /root/.cargo/bin/cargo-chef

WORKDIR /app
