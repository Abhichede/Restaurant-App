#!/bin/sh

set -e

trap close INT

#dockerhost="127.0.0.1    host.docker.internal"
#hostfile="/etc/hosts"
#
## Check for sudo permission and prompt if not present
#if [ "$EUID" -ne 0 ]; then
#  if ! grep -q "^$dockerhost" "$hostfile"; then
#    tput setaf 1
#    tput bold
#    echo "-----------------------------------------------------------------------------------------------------------"
#    echo "Note: This script needs sudo permission to append '127.0.0.1 host.docker.internal' into /etc/hosts"
#    echo "-----------------------------------------------------------------------------------------------------------"
#    tput sgr0
#    exit 1
#  fi
#else
#  if ! grep -q "^$dockerhost" "$hostfile"; then
#    tput bold
#    tput setaf 3 # yellow
#    echo "- Adding entry '$dockerhost'"
#    echo "$dockerhost" >>"$hostfile"
#    tput sgr0
#  fi
#fi

# Run docker-compose with multiple files
docker-compose -f docker-compose.yml -f docker-compose.override.yml \
  -f docker-compose.traefik.yml \
  -f docker-compose.kafka.yml \
  --project-directory . up --build
