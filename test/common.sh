#!/bin/bash
if [[ -z "${NO_COLOR}" ]]; then
  # shellcheck disable=SC2034
  NC='\e[0m'
  # shellcheck disable=SC2034
  BLUE='\e[44;97m'
  # shellcheck disable=SC2034
  RED='\e[101;97m'
  # shellcheck disable=SC2034
  GREEN='\e[42;97m'
fi
