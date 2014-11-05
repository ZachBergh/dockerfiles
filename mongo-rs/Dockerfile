FROM docker.cn/docker/ubuntu:12.04

COPY bin/  /usr/bin/
RUN mkdir -p /data/db/
RUN mkdir -p /var/log/mongodb/

RUN mongod --replSet mm0 --fork --logpath /var/log/mongodb/mongo.log --smallfiles --noprealloc; \
    echo "rs.initiate()" | mongo; \
    echo "Wating for mongo to initiate replSet..."; \
    while [ `echo "rs.status()" | mongo | grep '"myState" : 1,' | wc -l` -ne 1 ]; do sleep 0.5; done; \
    pkill mongod;

CMD mongod --replSet mm0 --logpath /var/log/mongodb/mongo.log --smallfiles --noprealloc

EXPOSE 27017
