FROM rust:1-slim AS builder
RUN rustup default stable
RUN rustup update

RUN cargo install cargo-watch

FROM rust:1-slim
COPY --from=builder /usr/local/cargo/bin/cargo-watch /usr/local/cargo/bin/cargo-watch

RUN apt-get update && apt-get install -y tini && rm -rf /var/lib/apt/lists/*

WORKDIR /app