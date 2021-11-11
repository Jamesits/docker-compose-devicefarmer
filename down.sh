#!/bin/bash
set -Eeuo pipefail

docker-compose -f docker-compose.yml -f docker-compose.watchtower.yml down --remove-orphans
