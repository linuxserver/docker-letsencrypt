FROM lsiobase/alpine.nginx
MAINTAINER aptalca

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

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

