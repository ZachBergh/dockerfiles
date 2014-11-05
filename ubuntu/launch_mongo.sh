#!/bin/sh

mongod --replSet mm0 --fork --logpath /var/log/mongo.log ;sleep 2; echo "rs.initiate()" | mongo --shell
