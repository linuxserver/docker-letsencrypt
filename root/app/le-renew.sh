#!/usr/bin/with-contenv bash

. /config/donoteditthisfile.conf

echo "<------------------------------------------------->"
echo
echo "<------------------------------------------------->"
echo "cronjob running on "$(date)
echo "Running certbot renew"
if [ "$ORIGVALIDATION" = "dns" ]; then
  certbot -n renew --post-hook "cd /config/keys/letsencrypt && openssl pkcs12 -export -out privkey.pfx -inkey privkey.pem -in cert.pem -certfile chain.pem -passout pass:"
else
  certbot -n renew --pre-hook "[[ ! -z $(ps -ef | grep nginx: | grep -v grep) ]] && s6-svc -d /var/run/s6/services/nginx" --post-hook "[[ ! -z $(ps -ef | grep "s6-supervise nginx" | grep -v grep) ]] && s6-svc -u /var/run/s6/services/nginx ; cd /config/keys/letsencrypt && openssl pkcs12 -export -out privkey.pfx -inkey privkey.pem -in cert.pem -certfile chain.pem -passout pass:"
fi
