[linuxserverurl]: https://linuxserver.io
[forumurl]: https://forum.linuxserver.io
[ircurl]: https://www.linuxserver.io/irc/
[podcasturl]: https://www.linuxserver.io/podcast/
[appurl]: https://letsencrypt.org/
[hub]: https://hub.docker.com/r/linuxserver/letsencrypt/

[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)][linuxserverurl]

The [LinuxServer.io][linuxserverurl] team brings you another container release featuring easy user mapping and community support. Find us for support at:
* [forum.linuxserver.io][forumurl]
* [IRC][ircurl] on freenode at `#linuxserver.io`
* [Podcast][podcasturl] covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation!

# linuxserver/letsencrypt
[![](https://images.microbadger.com/badges/version/linuxserver/letsencrypt.svg)](https://microbadger.com/images/linuxserver/letsencrypt "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/image/linuxserver/letsencrypt.svg)](https://microbadger.com/images/linuxserver/letsencrypt "Get your own image badge on microbadger.com")[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/letsencrypt.svg)][hub][![Docker Stars](https://img.shields.io/docker/stars/linuxserver/letsencrypt.svg)][hub][![Build Status](https://ci.linuxserver.io/buildStatus/icon?job=Docker-Builders/x86-64/x86-64-letsencrypt)](https://ci.linuxserver.io/job/Docker-Builders/job/x86-64/job/x86-64-letsencrypt/)

This container sets up an Nginx webserver and reverse proxy with php support and a built-in letsencrypt client that automates free SSL server certificate generation and renewal processes. It also contains fail2ban for intrusion prevention.

[![letsencrypt](https://github.com/letsencrypt/website/raw/master/images/le-logo-wide.png)][appurl]

## Usage

```
docker create \
  --privileged \
  --name=letsencrypt \
  -v <path to data>:/config \
  -e PGID=<gid> -e PUID=<uid>  \
  -e EMAIL=<email> \
  -e URL=<url> \
  -e SUBDOMAINS=<subdomains> \
  -p 443:443 \
  -e TZ=<timezone> \
  linuxserver/letsencrypt
```

## Parameters

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side. 
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
http://192.168.x.x:8080 would show you what's running INSIDE the container on port 80.`


* `-p 443` - the port(s)
* `-v /config` - all the config files including the webroot reside here
* `-e URL` - the top url you have control over ("customdomain.com" if you own it, or "customsubdomain.ddnsprovider.com" if dynamic dns)
* `-e SUBDOMAINS` - subdomains you'd like the cert to cover (comma separated, no spaces) ie. `www,ftp,cloud`
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation
* `-e TZ` - timezone ie. `America/New_York`  
  
_Optional settings:_
* `-e EMAIL` - your e-mail address for cert registration and notifications
* `-e DHLEVEL` - dhparams bit value (default=2048, can be set to `1024` or `4096`)
* `-p 80` - Port 80 forwarding is optional (cert validation is done through 443)
* `-e ONLY_SUBDOMAINS` - if you wish to get certs only for certain subdomains, but not the main domain (main domain may be hosted on another machine and cannot be validated), set this to `true`
* `-e EXTRA_DOMAINS` - additional fully qualified domain names (comma separated, no spaces) ie. `extradomain.com,subdomain.anotherdomain.org`

It is based on alpine linux with s6 overlay, for shell access whilst the container is running do `docker exec -it letsencrypt /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application

* Before running this container, make sure that the url and subdomains are properly forwarded to this container's host, and that port 443 is not being used by another service on the host (NAS gui, another webserver, etc.).
* Port 443 on the internet side of the router should be forwarded to this container's port 443 (Required for letsencrypt validation)
* `--privileged` mode is required for fail2ban to modify iptables
* If you need a dynamic dns provider, you can use the free provider duckdns.org where the url will be `yoursubdomain.duckdns.org` and the subdomains can be `www,ftp,cloud`
* The container detects changes to url and subdomains, revokes existing certs and generates new ones during start. It also detects changes to the DHLEVEL parameter and replaces the dhparams file.
* If you'd like to password protect your sites, you can use htpasswd. Run the following command on your host to generate the htpasswd file `docker exec -it letsencrypt htpasswd -c /config/nginx/.htpasswd <username>`


## Info

* Shell access whilst the container is running: `docker exec -it letsencrypt /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f letsencrypt`

* container version number 

`docker inspect -f '{{ index .Config.Labels "build_version" }}' letsencrypt`

* image version number

`docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/letsencrypt`

## Versions

+ **14.07.2017:** Enable modules dynamically in nginx.conf
+ **06.07.2017:** Add support for multiple domains (thanks @oznu)
+ **22.06.2017:** Add various nginx modules and enable all modules in the default nginx.conf
+ **16.06.2017:** Update deprecated certbot option for https validation, make e-mail entry optional, update readme
+ **05.06.2017:** Add php7-bz2
+ **27.05.2017:** Rebase to alpine 3.6.
+ **03.05.2017:** Fix log permissions.
+ **18.04.2017:** Add php7-sockets, update fail2ban filter and action defaults
+ **27.02.2017:** Add php7-dom, php7-iconv and php7-pdo_sqlite
+ **21.02.2017:** Add php7-xml
+ **10.02.2017:** Switch to alpine 3.5 base and php7, add php zlib module and all nginx modules
+ **13.01.2017:** Add php5-ctype and php5-openssl
+ **04.01.2017:** Add php5-mysqli and php5-pdo_mysql
+ **22.11.2016:** Add gd and mcrypt packages
+ **21.11.2016:** Add curl package
+ **07.11.2016:** Initial Release
