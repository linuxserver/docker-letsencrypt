FROM lsiobase/alpine.nginx
MAINTAINER aptalca

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# environment settings
ENV DHLEVEL=2048 ONLY_SUBDOMAINS=false
ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2

# install packages
RUN \
 apk add --no-cache \
	certbot \
	curl \
	fail2ban \
	php5-ctype \
	php5-curl \
	php5-gd \
	php5-mcrypt \
	php5-mysqli \
	php5-openssl \
	php5-pdo_mysql && \

# remove unnecessary fail2ban filters
 rm \
	/etc/fail2ban/jail.d/alpine-ssh.conf

# add local files
COPY root/ /

