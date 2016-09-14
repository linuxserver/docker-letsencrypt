#!/usr/bin/with-contenv bash

echo "<------------------------------------------------->"
echo
echo "<------------------------------------------------->"
echo "cronjob running on "$(date)
echo "Running certbot renew"
certbot -n renew --standalone --pre-hook "s6-svc -d /var/run/s6/services/nginx" --post-hook "s6-svc -u /var/run/s6/services/nginx ; cd /config/keys/letsencrypt && openssl pkcs12 -export -out privkey.pfx -inkey privkey.pem -in cert.pem -certfile chain.pem -passout pass:"
