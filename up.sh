#!/bin/bash
set -Eeuo pipefail

docker-compose up --remove-orphans -d
chown -R 998:998 deployment/stf-storage
