FROM docker.cn/docker/ubuntu:12.04

ADD sources.list /etc/apt/sources.list

#RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
#RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

COPY bin/  /usr/bin/

#RUN apt-get update
#RUN apt-get install mongodb-10gen -y
RUN mkdir -p /data/db
RUN mkdir /var/log/mongodb/
RUN touch /var/log/mongodb/mongo.log
ADD launch_mongo.sh /var/shell/launch_mongo.sh

CMD /bin/bash /var/shell/launch_mongo.sh

EXPOSE 27017


