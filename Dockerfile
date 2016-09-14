FROM lsiobase/alpine.nginx
MAINTAINER aptalca

# environment settings
ENV DHLEVEL=2048 ONLY_SUBDOMAINS=false

# install packages
RUN \
 apk add --no-cache \
	certbot \
	fail2ban

# add local files
COPY root/ /

# remove unnecessary fail2ban filters
RUN \
 rm /etc/fail2ban/jail.d/alpine-ssh.conf
