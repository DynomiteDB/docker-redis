#!/bin/bash
set -e

# allow the container to be started with `--user`
if [ "$1" = 'dynomitedb-redis-server' -a "$(id -u)" = '0' ]; then
    mkdir -p /var/run/dynomitedb
    mkdir -p /var/log/dynomitedb/redis
    mkdir -p /var/dynomitedb/redis/data/
    chown -R dynomite:dynomite /etc/dynomitedb/ /var/run/dynomitedb/ /usr/local/dynomitedb/ /var/dynomitedb/ /var/log/dynomitedb/
    chown -R dynomite:dynomite /var/dynomitedb/redis/data/ 
    exec gosu dynomite:dynomite "$BASH_SOURCE" "$@"
fi

exec "$@"
