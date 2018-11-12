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

[![letsencrypt](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/le-logo-wide.png)][appurl]

## Usage

```
docker create \
  --cap-add=NET_ADMIN \
  --name=letsencrypt \
  -v <path to data>:/config \
  -e PGID=<gid> -e PUID=<uid>  \
  -e EMAIL=<email> \
  -e URL=<url> \
  -e SUBDOMAINS=<subdomains> \
  -e VALIDATION=<method> \
  -p 80:80 -p 443:443 \
  -e TZ=<timezone> \
  linuxserver/letsencrypt
```

## Parameters

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side. 
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
http://192.168.x.x:8080 would show you what's running INSIDE the container on port 80.`


* `-p 80 -p 443` - the port(s)
* `-v /config` - all the config files including the webroot reside here
* `-e URL` - the top url you have control over ("customdomain.com" if you own it, or "customsubdomain.ddnsprovider.com" if dynamic dns)
* `-e SUBDOMAINS` - subdomains you'd like the cert to cover (comma separated, no spaces) ie. `www,ftp,cloud`. For a wildcard cert, set this _exactly_ to `wildcard` (wildcard cert is available via `dns` and `duckdns` validation only)
* `-e VALIDATION` - letsencrypt validation method to use, options are `http`, `tls-sni`, `dns` or `duckdns` (`dns` method also requires `DNSPLUGIN` variable set) (`duckdns` method requires `DUCKDNSTOKEN` variable set, and the `SUBDOMAINS` variable set to `wildcard`)
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation
* `-e TZ` - timezone ie. `America/New_York`  
  
_Optional settings:_
* `-e DNSPLUGIN` - required if `VALIDATION` is set to `dns`. Options are `cloudflare`, `cloudxns`, `digitalocean`, `dnsimple`, `dnsmadeeasy`, `google`, `luadns`, `nsone`, `rfc2136` and `route53`. Also need to enter the credentials into the corresponding ini file under `/config/dns-conf` 
* `-e DUCKDNSTOKEN` - required if `VALIDATION` is set to `duckdns`. Retrieve your token from https://www.duckdns.org
* `-e EMAIL` - your e-mail address for cert registration and notifications
* `-e DHLEVEL` - dhparams bit value (default=2048, can be set to `1024` or `4096`)
* `-p 80` - Port 80 forwarding is required when `VALIDATION` is set to `http`, but not `dns` or `tls-sni`
* `-e ONLY_SUBDOMAINS` - if you wish to get certs only for certain subdomains, but not the main domain (main domain may be hosted on another machine and cannot be validated), set this to `true`
* `-e EXTRA_DOMAINS` - additional fully qualified domain names (comma separated, no spaces) ie. `extradomain.com,subdomain.anotherdomain.org`
* `-e STAGING` - set to `true` to retrieve certs in staging mode. Rate limits will be much higher, but the resulting cert will not pass the browser's security test. Only to be used for testing purposes.
* `-e HTTPVAL` - Deprecated, please use the `VALIDATION` parameter instead

_Important notice:_
* This image previously used tls-sni validation over port 443. However, due to a security vulnerability, letsencrypt disabled tls-sni validation: https://community.letsencrypt.org/t/2018-01-11-update-regarding-acme-tls-sni-and-shared-hosting-infrastructure/50188 If you are getting the following error in the log, that means you are attempting tls-sni authentication, which is disabled by the servers: `Client with the currently selected authenticator does not support any combination of challenges that will satisfy the CA.` Please set the `VALIDATION` parameter to either `http` or `dns` and follow the above directions to revalidate. 

It is based on alpine linux with s6 overlay, for shell access whilst the container is running do `docker exec -it letsencrypt /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application

### Validation and initial setup
* Before running this container, make sure that the url and subdomains are properly forwarded to this container's host, and that port 443 (and/or 80) is not being used by another service on the host (NAS gui, another webserver, etc.).
* For `http` validation, port 80 on the internet side of the router should be forwarded to this container's port 80
* For `tls-sni` validation, port 443 on the internet side of the router should be forwarded to this container's port 443
* For `dns` validation, make sure to enter your credentials into the corresponding ini file under `/config/dns-conf`
  * Cloudflare provides free accounts for managing dns and is very easy to use with this image. Make sure that it is set up for "dns only" instead of "dns + proxy"
  * Google dns plugin is meant to be used with "Google Cloud DNS", a paid enterprise product, and not for "Google Domains DNS"
* For `duckdns` validation, set the `SUBDOMAINS` variable to `wildcard`, and set the `DUCKDNSTOKEN` variable with your duckdns token. Due to a limitation of duckdns, the resulting cert will only cover the sub-subdomains (ie. `*.yoursubdomain.duckdns.org`) but will not cover `yoursubdomain.duckdns.org`. Therefore, it is recommended to use a sub-subdomain like `www.yoursubdomain.duckdns.org` for subfolders. You can use our [duckdns image](https://hub.docker.com/r/linuxserver/duckdns/) to update your IP on duckdns.org. 
* `--cap-add=NET_ADMIN` is required for fail2ban to modify iptables
* If you need a dynamic dns provider, you can use the free provider duckdns.org where the `URL` will be `yoursubdomain.duckdns.org` and the `SUBDOMAINS` can be `www,ftp,cloud` with http validation, or `wildcard` with dns validation.
* After setup, navigate to `https://yourdomain.url` to access the default homepage
### Security and password protection
* The container detects changes to url and subdomains, revokes existing certs and generates new ones during start. It also detects changes to the DHLEVEL parameter and replaces the dhparams file.
* If you'd like to password protect your sites, you can use htpasswd. Run the following command on your host to generate the htpasswd file `docker exec -it letsencrypt htpasswd -c /config/nginx/.htpasswd <username>`
* You can add multiple user:pass to `.htpasswd`. For the first user, use the above command, for others, use the above command without the `-c` flag, as it will force deletion of the existing `.htpasswd` and creation of a new one
* You can also use ldap auth for security and access control. A sample, user configurable ldap.conf is provided, and it requires the separate image [linuxserver/ldap-auth](https://hub.docker.com/r/linuxserver/ldap-auth/) to communicate with an ldap server.
### Site config and reverse proxy
* The default site config resides at `/config/nginx/site-confs/default`. Feel free to modify this file, and you can add other conf files to this directory. However, if you delete the `default` file, a new default will be created on container start.
* Preset reverse proxy config files are added for popular apps. See the `_readme` file under `/config/nginx/proxy_confs` for instructions on how to enable them
* If you wish to hide your site from search engine crawlers, you may find it useful to add this configuration line to your site config, within the server block, above the line where ssl.conf is included
`add_header X-Robots-Tag "noindex, nofollow, nosnippet, noarchive";`
This will *ask* Google et al not to index and list your site. Be careful with this, as you will eventually be de-listed if you leave this line in on a site you wish to be present on search engines
### Using certs in other containers
* This container includes auto-generated pfx and private-fullchain-bundle pem certs that are needed by other apps like Emby and Znc. 
  * To use these certs in other containers, do either of the following:
  1. *(Easier)* Mount the letsencrypt config folder in other containers (ie. `-v /path-to-le-config:/le-ssl`) and in the other containers, use the cert location `/le-ssl/keys/letsencrypt/`
  2. *(More secure)* Mount the letsencrypt folder `etc/letsencrypt` that resides under `/config` in other containers (ie. `-v /path-to-le-config/etc/letsencrypt:/le-ssl`) and in the other containers, use the cert location `/le-ssl/live/<your.domain.url>/` (This is more secure because the first method shares the entire letsencrypt config folder with other containers, including the www files, whereas the second method only shares the ssl certs)
  * These certs include:
  1. `cert.pem`, `chain.pem`, `fullchain.pem` and `privkey.pem`, which are generated by letsencrypt and used by nginx and various other apps
  2. `privkey.pfx`, a format supported by Microsoft and commonly used by dotnet apps such as Emby Server (no password)
  3. `priv-fullchain-bundle.pem`, a pem cert that bundles the private key and the fullchain, used by apps like ZNC
### Using fail2ban
* This container includes fail2ban set up with 3 jails by default:
  1. nginx-http-auth
  2. nginx-badbots
  3. nginx-botsearch
* To enable or disable other jails, modify the file `/config/fail2ban/jail.local`
* To modify filters and actions, instead of editing the `.conf` files, create `.local` files with the same name and edit those because .conf files get overwritten when the actions and filters are updated. `.local` files will append whatever's in the `.conf` files (ie. `nginx-http-auth.conf` --> `nginx-http-auth.local`)
* You can check which jails are active via `docker exec -it letsencrypt fail2ban-client status`
* You can check the status of a specific jail via `docker exec -it letsencrypt fail2ban-client status <jail name>`
* You can unban an IP via `docker exec -it letsencrypt fail2ban-client set <jail name> unbanip <IP>`
* A list of commands can be found here: https://www.fail2ban.org/wiki/index.php/Commands


## Info

* Shell access whilst the container is running: `docker exec -it letsencrypt /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f letsencrypt`

* container version number 

`docker inspect -f '{{ index .Config.Labels "build_version" }}' letsencrypt`

* image version number

`docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/letsencrypt`

## Versions

+ **12.11.18:** Add support for duckdns wildcard certs via dns validation
+ **31.10.18:** Add various preset proxy confs and fix others (thanks @nemchik and @hijxf)
+ **02.10.18:** Fix fail2ban instructions and logrotate conf
+ **11.09.18:** Add various preset proxy confs and fix others (thanks @nemchik and @LeoVerto)
+ **04.09.18:** Linting fixes.
+ **30.08.18:** Add support for ldap auth, add proxy confs for bazarr, couchpotato, headphones, lidarr and plex subfolder (thanks @nemchik and @jedahan)
+ **21.08.18:** Rebase to alpine 3.8, add info on search engine de-listing
+ **08.08.18:** Add subdomain proxy conf for plex, update emby proxy confs
+ **25.07.18:** Add subdomain proxy conf for syncthing
+ **23.07.18:** Remove backwards compatibility and set default validation method to http. Update portainer proxy config to fix websockets. Add unifi proxy conf.
+ **31.05.18:** Update ssl.conf and proxy.conf for tighter security (thanks @nemchik)
+ **30.05.18:** Add reverse proxy configs for jackett, monitorr, nzbget, nzbhydra, organizr, portainer and transmission (thanks @nemchik)
+ **18.05.18:** Add more info on certs and unraid reverse proxy config
+ **11.05.18:** Add php pgsql support
+ **24.04.18:** Auto generate a private key + fullchain bundle pem that is needed by certain apps
+ **20.04.18:** Add standardized optional reverse proxy conf files
+ **19.04.18:** Bind memcached to localhost only, add php7-sqlite3
+ **08.04.18:** Fix renewal hooks
+ **29.03.18:** Create pfx cert after renewal for dns validation (previous version only created it for http and tls, an oversight)
+ **29.03.18:** Fix staging for v2 api
+ **13.03.18:** Support for wildcard cert with dns validation added. Switched to v2 api for ACME.
+ **21.02.18:** Reduce shellcheck directives by renaming secondary variables
+ **20.02.18:** Sanitize variables, increase log verbosity
+ **01.02.18:** Big changes. `VALIDATION` parameter added for choosing letsencrypt validation methods, including dns through official plugins. `HTTPVAL` is deprecated. `STAGING` parameter added for testing. Backwards compatibility for the short term. Since tls-sni is disabled by letsencrypt, most users will have to change their settings and adopt the new parameters within the next 90 days. Reorganized the nginx default config, split ssl settings into new ssl.conf
+ **13.01.18:** Re-enable ipv6 due to update to fail2ban 0.10.1. Existing users can enable ipv6 by deleting `/config/fail2ban/action.d/iptables-common.local` and restarting the container after updating the image
+ **11.01.18:** Halt the container if validation fails instead of a stop (so restart=always doesn't get users throttled with letsencrypt)
+ **10.01.18:** Add option for http validation on port 80
+ **05.01.18:** Rebase to alpine 3.7
+ **04.11.17:** Add php7 soap module
+ **31.10.17:** Add php7 exif and xmlreader modules
+ **25.09.17:** Manage fail2ban via s6
+ **24.09.17:** Add memcached service
+ **01.09.17:** `--privileged` is no longer required as long as `--cap-add=NET_ADMIN` is added, instructions modified accordingly, disabled fail2ban ipv6 actions due to requiring access to host kernel modules
+ **31.08.17:** Add php7-phar
+ **14.07.17:** Enable modules dynamically in nginx.conf
+ **06.07.17:** Add support for multiple domains (thanks @oznu)
+ **22.06.17:** Add various nginx modules and enable all modules in the default nginx.conf
+ **16.06.17:** Update deprecated certbot option for https validation, make e-mail entry optional, update readme
+ **05.06.17:** Add php7-bz2
+ **27.05.17:** Rebase to alpine 3.6.
+ **03.05.17:** Fix log permissions.
+ **18.04.17:** Add php7-sockets, update fail2ban filter and action defaults
+ **27.02.17:** Add php7-dom, php7-iconv and php7-pdo_sqlite
+ **21.02.17:** Add php7-xml
+ **10.02.17:** Switch to alpine 3.5 base and php7, add php zlib module and all nginx modules
+ **13.01.17:** Add php5-ctype and php5-openssl
+ **04.01.17:** Add php5-mysqli and php5-pdo_mysql
+ **22.11.16:** Add gd and mcrypt packages
+ **21.11.16:** Add curl package
+ **07.11.16:** Initial Release
