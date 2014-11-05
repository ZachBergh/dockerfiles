FROM docker.cn/docker/ubuntu:12.04

ADD sources.list /etc/apt/sources.list

RUN apt-get update
RUN apt-get install mongodb -y
RUN mkdir -p /data/db

ADD launch_mongo.sh /var/shell/launch_mongo.sh

CMD /bin/bash /var/shell/launch_mongo.sh
