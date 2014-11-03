# How to use this image

## start a redis instance

`docker run --name some-redis -d redis`

This image includes EXPOSE 6379 (the redis port), so standard container linking will make it automatically available to the linked containers (as the following examples illustrate).

## start with persistent storage

`docker run --name some-redis -d redis redis-server --appendonly yes`

If persistence is enabled, data is stored in the VOLUME /data, which can be used with --volumes-from some-volume-container or -v /docker/host/dir:/data (see docs.docker volumes).

For more about Redis Persistence, see http://redis.io/topics/persistence.

## connect to it from an application

`docker run --name some-app --link some-redis:redis -d application-that-uses-redis`

… or via redis-cli

`docker run -it --link some-redis:redis --rm redis sh -c 'exec redis-cli -h "$REDIS_PORT_6379_TCP_ADDR" -p "$REDIS_PORT_6379_TCP_PORT"'`