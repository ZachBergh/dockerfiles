NSQ Dockerfile

This repository contains Dockerfile of NSQ for Docker's automated build published to the public Docker Hub Registry.

## Base Docker Image

dockerfile/ubuntu

Installation

1. Install Docker.

2. Download automated build from public Docker Hub Registry: `docker pull dockerfile/nsq`

(alternatively, you can build an image from Dockerfile: `docker build -t="dockerfile/nsq" github.com/dockerfile/nsq`)

## Usage

```shell
docker run -it --rm nsq
```

## Run nsqlookupd

```shell
docker run -d --name nsqlookupd nsq nsqlookupd
```

## Run nsqadmin

```shell
docker run -d --name nsqadmin --link nsqlookupd:nsqlookupd nsq nsqadmin --lookupd-http-address nsqlookupd:4161
```

Run nsqd

```shell
docker run -d --name nsqd --link nsqlookupd:nsqlookupd nsq nsqd --data-path /data --lookupd-tcp-address nsqlookupd:4160
```