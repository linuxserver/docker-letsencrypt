#!/usr/bin/with-contenv bash
set -euo pipefail
IFS=$'\n\t'

# universal check that the process is running
ps -ef | grep -v 'grep --color=auto' | grep nginx
ps -ef | grep '^abc.*nginx'

# individualized check(s) specific to the app
nginx -tq -c /config/nginx/nginx.conf
