FROM clux/muslrust:1.57.0
COPY --chown=root:root cobalt.rs/ /volume
RUN cargo build --release --no-default-features --features syntax-highlight,serve,html-minifier

FROM alpine:3.15
MAINTAINER Stas Rudakou "stas@garage22.net"
COPY --from=0 /volume/target/x86_64-unknown-linux-musl/release/cobalt /usr/bin/cobalt
EXPOSE 3000
CMD ["/usr/bin/cobalt"]
