DOCKER=docker
NAME=nott/cobalt
VERSION=$(shell cd cobalt.rs && git describe --tags)

.PHONY : default build-cargo build-docker build tag-latest push push-latest

default: build

build-cargo:
	cd cobalt.rs && CC=gcc cargo build --release --target x86_64-unknown-linux-musl
	cp cobalt.rs/target/x86_64-unknown-linux-musl/release/cobalt dockerfiles/cobalt

build-docker:
	$(DOCKER) build -t $(NAME):$(VERSION) dockerfiles

build: build-cargo build-docker

tag-latest: build
	$(DOCKER) tag $(NAME):$(VERSION) $(NAME):latest

push: build
	$(DOCKER) push $(NAME):$(VERSION)

push-latest: tag-latest
	$(DOCKER) push $(NAME):latest
