#!/bin/sh

mongod --replSet mm0 --fork --logpath /var/log/mongodb/mongo.log ;sleep 2; echo "rs.initiate()" | mongo --shell
