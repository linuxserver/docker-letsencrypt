#!/usr/bin/with-contenv bash
set -euo pipefail
IFS=$'\n\t'

# universal check that the process is running
pgrep -af nginx > /dev/null

# individualized check(s) specific to the app
nginx -tq -c /config/nginx/nginx.conf > /dev/null
