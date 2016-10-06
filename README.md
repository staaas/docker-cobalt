# Dockerfile for static site generator Cobalt

This repository contains infrastructure for building docker images
containing [Cobalt](https://github.com/cobalt-org/cobalt.rs) binaries.

The docker image is based on `alpine` image. `cobalt` binary in the
image is statically linked with `musl`.

## Overview

Structure:

* `Makefile`
* git submodule `cobalt.rs`
* `Dockerfile` in `dockerfiles`

We use `Makefile` for automating docker image build process. git
submodule `cobalt.rs` contains Cobalt source code. Image version is
taken from submodule using `git descrbie --tags`.

## Build Requirements

* make
* docker client (available without `sudo`)
* cargo
* x86_64-unknown-linux-musl rust target

## Build Process

Don't forget to checkout `cobalt.rs` submodule:

```sh
git submodule init && git submodule update
```

Build docker images:

```sh
make
```

Publish docker image:

```sh
make push
```

Publish docker image as `latest`:

```sh
make push-latest
```

Long story shot, in order to release a new version one needs to:

* update submodule so it points to a correct tag
* build image using `make`
* push image using `make push` (and optionally `make push-latest`)

