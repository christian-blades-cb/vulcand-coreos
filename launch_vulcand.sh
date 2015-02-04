#!/usr/bin/env bash

if [ -z "${ETCD_HOSTS}" ]; then
    docker_host=$(ip route | grep default | cut -d' ' -f3)
    >&2 echo "Host found at ${docker_host}"
    export ETCD_HOSTS="http://${docker_host}:4001"
fi

exec vulcand -etcd="${ETCD_HOSTS}" $@
