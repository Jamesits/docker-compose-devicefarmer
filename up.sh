#!/bin/bash
set -Eeuo pipefail

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )"
mkdir -p deployment

# generate a new session token
STF_SESSION=$(echo $RANDOM | md5sum | head -c 32)
cat > deployment/stf-session.env <<EOF
# This file is auto-generated. No need to modify by hand.

STF_SESSION=${STF_SESSION}
EOF

docker-compose -f docker-compose.yml -f docker-compose.watchtower.yml up --remove-orphans -d
chown -R 998:998 deployment/stf-storage || true
