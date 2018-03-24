DOCKER=docker
NAME=nott/cobalt
VERSION=$(shell cd cobalt.rs && git describe --tags)

.PHONY : default build tag-latest push push-latest

default: build

build:
	$(DOCKER) build -t $(NAME):$(VERSION) .

tag-latest: build
	$(DOCKER) tag $(NAME):$(VERSION) $(NAME):latest

push: build
	$(DOCKER) push $(NAME):$(VERSION)

push-latest: tag-latest
	$(DOCKER) push $(NAME):latest
