FROM lsiobase/alpine.nginx:3.5
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
	php7-ctype \
	php7-curl \
	php7-gd \
	php7-mcrypt \
	php7-mysqli \
	php7-mysqlnd \
	php7-openssl \
	php7-pdo_mysql \
	php7-mbstring \
	php7-zlib \
	nginx-mod-http-echo \
	nginx-mod-http-fancyindex \
	nginx-mod-http-headers-more \
	nginx-mod-http-lua \
	nginx-mod-http-nchan \
	nginx-mod-http-perl \
	nginx-mod-http-upload-progress \
	nginx-mod-http-xslt-filter \
	nginx-mod-mail \
	nginx-mod-rtmp \
	nginx-mod-stream \
	nginx-mod-http-geoip \
	nginx-mod-http-image-filter \
	nginx-vim && \

# remove unnecessary fail2ban filters
 rm \
	/etc/fail2ban/jail.d/alpine-ssh.conf

# add local files
COPY root/ /
