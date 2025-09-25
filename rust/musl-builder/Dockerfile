FROM rust:1-slim AS builder

RUN cargo install cargo-chef

FROM rust:1-slim
COPY --from=builder /usr/local/cargo/bin/cargo-chef /usr/local/cargo/bin/cargo-chef

RUN rustup target add x86_64-unknown-linux-musl

WORKDIR /app