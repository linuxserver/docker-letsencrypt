FROM lsiodev/nginx-alpine-testbed
MAINTAINER aptalca

# environment settings
ENV DHLEVEL=2048 ONLY_SUBDOMAINS=false

# install packages
RUN \
 apk add --no-cache \
	certbot \
	fail2ban && \

# remove unnecessary fail2ban filters
 rm \
	/etc/fail2ban/jail.d/alpine-ssh.conf

# add local files
COPY root/ /

