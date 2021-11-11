#!/bin/bash
set -Eeuo pipefail

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )"
mkdir -p deployment

# generate a new session token
if [ ! -f "deployment/stf-session.env" ]; then
    STF_SESSION=$(echo $RANDOM | md5sum | head -c 32)
    cat > "deployment/stf-session.env" <<EOF
# This file is auto-generated. No need to modify by hand.

SECRET=${STF_SESSION}
EOF
fi

docker-compose -f docker-compose.yml -f docker-compose.watchtower.yml up --remove-orphans -d

# after docker-compose up, container ip assignment might change.
# restart nginx to refresh DNS records.
docker-compose -f docker-compose.yml -f docker-compose.watchtower.yml restart nginx

# try fix permissions
chown -R 998:998 deployment/stf-storage || true
