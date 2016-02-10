#!/bin/bash
set -eo pipefail

if [ -z "$GITHUB_AUTH_TOKEN" ]; then
    echo >&2 "Error: you must pass an authorization token"
    exit 1
else
    /bin/sed -i "s/GITHUB_AUTH_TOKEN/${GITHUB_AUTH_TOKEN}/" /src/Capfile
fi

exec /usr/local/bin/cap "$@"
