FROM lsiobase/alpine.nginx:3.6
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
	memcached \
	nginx-mod-http-echo \
	nginx-mod-http-fancyindex \
	nginx-mod-http-geoip \
	nginx-mod-http-headers-more \
	nginx-mod-http-image-filter \
	nginx-mod-http-lua \
	nginx-mod-http-lua-upstream \
	nginx-mod-http-nchan \
	nginx-mod-http-perl \
	nginx-mod-http-redis2 \
	nginx-mod-http-set-misc \
	nginx-mod-http-upload-progress \
	nginx-mod-http-xslt-filter \
	nginx-mod-mail \
	nginx-mod-rtmp \
	nginx-mod-stream \
	nginx-mod-stream-geoip \
	nginx-vim \
	php7-bz2 \
	php7-ctype \
	php7-curl \
	php7-dom \
	php7-gd \
	php7-iconv \
	php7-mcrypt \
	php7-memcached \
	php7-mysqli \
	php7-mysqlnd \
	php7-pdo_mysql \
	php7-pdo_sqlite \
	php7-phar \
	php7-sockets \
	php7-tokenizer \
	php7-xml \
	php7-zip && \

# remove unnecessary fail2ban filters
 rm \
	/etc/fail2ban/jail.d/alpine-ssh.conf && \

# copy fail2ban default action and filter to /default
 mkdir -p /defaults/fail2ban && \
 mv /etc/fail2ban/action.d /defaults/fail2ban/ && \
 mv /etc/fail2ban/filter.d /defaults/fail2ban/

# add local files
COPY root/ /
