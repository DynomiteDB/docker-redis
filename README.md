# Redis runtime container

The `redis` container provides a clean, reusable and immutable runtime environment for the Redis server. Redis can be used as an in-memory backend for DynomiteDB.

# What is Dynomite?

Dynomite is a framework that turns single server databases into scalable, distributed databases. 

Specifically, Dynomite is a Dynamo-inspired layer that provides sharding, replication, a gossiper, a partitioner and other shared database infrastructure. 

DynomiteDB currently provides the Redis API for accessing both in-memory and persistent backends. A common API allows you to reuse queries, data models and knowledge across both traditional database and caching workloads.

DynomiteDB currently supports the following pluggable backends:

- Redis: Big data cache for in-memory workloads
- LMDB: Traditional database (persistent storage) for high performance workloads
- RocksDB: Traditional database (persistent storage) for big data workloads on SSD
- LevelDB: Traditional database (persistent storage) for big data workloads on hard drives (i.e. spinning disks)

# How to use this image

## Start a `redis` instance

```bash
docker run --name redis --net=host -d -p 22122:22122 dynomitedb/redis
```

## Use a custom `redis.conf` configuration file

You can provide Redis with a custom configuration file as show below. In this example, we first clone a git repository that has a custom `redis.conf` file.

> If you plan to use a custom configuration file, then stop and delete the `redis` container if you previously ran the command above. `docker stop redis`, then `docker rm redis`.

```bash
mkdir -p ~/repos && cd $_

git clone https://github.com/DynomiteDB/docker-custom-conf-files.git

cd docker-custom-conf-files

docker run --name redis --net=host -d -p 22122:22122 -v ${PWD}/redis.conf:/etc/dynomitedb/redis.conf dynomitedb/redis
```

# License

[View Apache 2.0 license](https://github.com/DynomiteDB/docker-redis/blob/master/LICENSE)

# Manually build the `dynomitedb/redis` image

The `redis` Docker image is automatically built via DockerHub at https://hub.docker.com/r/dynomitedb/redis.

The instructions below allow you to manually build the `redis` image, if required.

Clone the `docker-redis` repo from Github.

```bash
mkdir -p ~/repos/ && cd $_

git clone https://github.com/DynomiteDB/docker-redis.git
```

`cd` into the `docker-redis` directory.

```bash
cd ~/docker-redis
```

Create the `redis` image.

```bash
docker build -t dynomitedb/redis .
```
