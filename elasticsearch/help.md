## ElasticSearch Dockerfile

This repository contains Dockerfile of ElasticSearch for Docker's automated build published to the public Docker Hub Registry.

## Base Docker Image

dockerfile/java:oracle-java7

## Installation

1. Install Docker.

2. Download automated build from public Docker Hub Registry: docker pull dockerfile/elasticsearch

(alternatively, you can build an image from Dockerfile: docker build -t="dockerfile/elasticsearch" github.com/dockerfile/elasticsearch)

## Usage

```shell
docker run -d --name es -p  49892:9200 -p 49893:9300 es
```

## Attach persistent/shared directories

Create a mountable data directory <data-dir> on the host.

Create ElasticSearch config file at <data-dir>/elasticsearch.yml.

path:
  logs: /data/log
  data: /data/data
Start a container by mounting data directory and specifying the custom configuration file:

```shell
docker run -d -p 9200:9200 -p 9300:9300 -v <data-dir>:/data dockerfile/elasticsearch /elasticsearch/bin/elasticsearch -Des.config=/data/elasticsearch.yml
```



After few seconds, open http://<host>:9200 to see the result.