#!/usr/bin/with-contenv bash
set -euo pipefail
IFS=$'\n\t'

if [[ $(curl -ILs -w "%{http_code}" -o /dev/null "https://${URL}/") != "200" ]]; then
    exit 1
fi
