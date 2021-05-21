#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# shellcheck disable=SC1090
source "${DIR}/common.sh"

for i in $DIR/test_*.sh
do
  [ -x "$i" ] && { echo; echo -e "${GREEN}$(basename "$i")${NC}"; eval "$i"; }
done
