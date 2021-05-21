#!/bin/bash

PATH="$(pwd):${PATH}"
export PATH

DRONE=$(which drone)
[ -x "${DRONE}" ] || { curl -sSL https://github.com/drone/drone-cli/releases/latest/download/drone_linux_amd64.tar.gz | tar zx && \
  which drone && drone --version; }

#DRONE_RUNNER_NETWORKS=k3d-drone \
NETWORK=${1:-"drone"}
drone exec --trusted --network=k3d-"$NETWORK"
