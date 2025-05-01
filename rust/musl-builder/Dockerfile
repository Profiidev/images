FROM messense/rust-musl-cross:x86_64-musl AS chef
RUN rm -rf ~/.rustup && \
    rustup update stable && \
    rm -rf ~/.rustup//toolchains/stable-x86_64-unknown-linux-gnu/share

RUN rustup target add x86_64-unknown-linux-musl

RUN apt update && apt install libssl-dev pkg-config -y && apt-get clean

RUN cargo install cargo-chef 
WORKDIR /app
