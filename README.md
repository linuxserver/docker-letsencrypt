[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)](https://linuxserver.io)

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring :-

 * regular and timely application updates
 * easy user mappings (PGID, PUID)
 * custom base image with s6 overlay
 * weekly base OS updates with common layers across the entire LinuxServer.io ecosystem to minimise space usage, down time and bandwidth
 * regular security updates

Find us at:
* [Discord](https://discord.gg/YWrKVTn) - realtime support / chat with the community and the team.
* [IRC](https://irc.linuxserver.io) - on freenode at `#linuxserver.io`. Our primary support channel is Discord.
* [Blog](https://blog.linuxserver.io) - all the things you can do with our containers including How-To guides, opinions and much more!
* [Podcast](https://anchor.fm/linuxserverio) - on hiatus. Coming back soon (late 2018).

# PSA: Changes are happening

From August 2018 onwards, Linuxserver are in the midst of switching to a new CI platform which will enable us to build and release multiple architectures under a single repo. To this end, existing images for `arm64` and `armhf` builds are being deprecated. They are replaced by a manifest file in each container which automatically pulls the correct image for your architecture. You'll also be able to pull based on a specific architecture tag.

TLDR: Multi-arch support is changing from multiple repos to one repo per container image.

# [linuxserver/letsencrypt](https://github.com/linuxserver/docker-letsencrypt)
[![](https://img.shields.io/discord/354974912613449730.svg?logo=discord&label=LSIO%20Discord&style=flat-square)](https://discord.gg/YWrKVTn)
[![](https://images.microbadger.com/badges/version/linuxserver/letsencrypt.svg)](https://microbadger.com/images/linuxserver/letsencrypt "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/linuxserver/letsencrypt.svg)](https://microbadger.com/images/linuxserver/letsencrypt "Get your own version badge on microbadger.com")
![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/letsencrypt.svg)
![Docker Stars](https://img.shields.io/docker/stars/linuxserver/letsencrypt.svg)
[![Build Status](https://ci.linuxserver.io/buildStatus/icon?job=Docker-Pipeline-Builders/docker-letsencrypt/master)](https://ci.linuxserver.io/job/Docker-Pipeline-Builders/job/docker-letsencrypt/job/master/)
[![](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/letsencrypt/latest/badge.svg)](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/letsencrypt/latest/index.html)

[Letsencrypt](https://urlletsencrypt.org/) sets up an Nginx webserver and reverse proxy with php support and a built-in letsencrypt client that automates free SSL server certificate generation and renewal processes. It also contains fail2ban for intrusion prevention.

[![letsencrypt](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/le-logo-wide.png)](https://urlletsencrypt.org/)

## Supported Architectures

Our images support multiple architectures such as `x86-64`, `arm64` and `armhf`. We utilise the docker manifest for multi-platform awareness. More information is available from docker [here](https://github.com/docker/distribution/blob/master/docs/spec/manifest-v2-2.md#manifest-list). 

Simply pulling `linuxserver/letsencrypt` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:

| Architecture | Tag |
| :----: | --- |
| x86-64 | amd64-latest |
| arm64 | arm64v8-latest |
| armhf | arm32v6-latest |


## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=letsencrypt \
  --cap-add=NET_ADMIN \
  -e PUID=1001 \
  -e PGID=1001 \
  -e TZ=Europe/London \
  -e URL=yourdomain.url \
  -e SUBDOMAINS=www, \
  -e VALIDATION=http \
  -e TZ=Europe/London \
  -e DNSPLUGIN=cloudflare `#optional` \
  -e DUCKDNSTOKEN=<token> `#optional` \
  -e EMAIL=<e-mail> `#optional` \
  -e DHLEVEL=2048 `#optional` \
  -e ONLY_SUBDOMAINS=false `#optional` \
  -e EXTRA_DOMAINS=<extradomains> `#optional` \
  -e STAGING=false `#optional` \
  -p 443:443 \
  -p 80:80 `#optional` \
  -v </path/to/appdata/config>:/config \
  --restart unless-stopped \
  linuxserver/letsencrypt
```


### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2"
services:
  letsencrypt:
    image: linuxserver/letsencrypt
    container_name: letsencrypt
    cap_add:
      - NET_ADMIN
    environment:
      - PUID=1001
      - PGID=1001
      - TZ=Europe/London
      - URL=yourdomain.url
      - SUBDOMAINS=www,
      - VALIDATION=http
      - TZ=Europe/London
      - DNSPLUGIN=cloudflare #optional
      - DUCKDNSTOKEN=<token> #optional
      - EMAIL=<e-mail> #optional
      - DHLEVEL=2048 #optional
      - ONLY_SUBDOMAINS=false #optional
      - EXTRA_DOMAINS=<extradomains> #optional
      - STAGING=false #optional
    volumes:
      - </path/to/appdata/config>:/config
    ports:
      - 443:443
    ports:
      - 80:80 #optional
    mem_limit: 4096m
    restart: unless-stopped
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 443` | Https port |
| `-p 80` | Http port (required for http validation only) |
| `-e PUID=1001` | for UserID - see below for explanation |
| `-e PGID=1001` | for GroupID - see below for explanation |
| `-e TZ=Europe/London` | Specify a timezone to use EG Europe/London. |
| `-e URL=yourdomain.url` | Top url you have control over (`customdomain.com` if you own it, or `customsubdomain.ddnsprovider.com` if dynamic dns). |
| `-e SUBDOMAINS=www,` | Subdomains you'd like the cert to cover (comma separated, no spaces) ie. `www,ftp,cloud`. For a wildcard cert, set this _exactly_ to `wildcard` (wildcard cert is available via `dns` and `duckdns` validation only) |
| `-e VALIDATION=http` | Letsencrypt validation method to use, options are `http`, `tls-sni`, `dns` or `duckdns` (`dns` method also requires `DNSPLUGIN` variable set) (`duckdns` method requires `DUCKDNSTOKEN` variable set, and the `SUBDOMAINS` variable set to `wildcard`). |
| `-e TZ=Europe/London` | Specify a timezone to use EG Europe/London. |
| `-e DNSPLUGIN=cloudflare` | Required if `VALIDATION` is set to `dns`. Options are `cloudflare`, `cloudxns`, `digitalocean`, `dnsimple`, `dnsmadeeasy`, `google`, `luadns`, `nsone`, `ovh`, `rfc2136` and `route53`. Also need to enter the credentials into the corresponding ini file under `/config/dns-conf`. |
| `-e DUCKDNSTOKEN=<token>` | Required if `VALIDATION` is set to `duckdns`. Retrieve your token from https://www.duckdns.org |
| `-e EMAIL=<e-mail>` | Optional e-mail address used for cert expiration notifications. |
| `-e DHLEVEL=2048` | Dhparams bit value (default=2048, can be set to `1024` or `4096`). |
| `-e ONLY_SUBDOMAINS=false` | If you wish to get certs only for certain subdomains, but not the main domain (main domain may be hosted on another machine and cannot be validated), set this to `true` |
| `-e EXTRA_DOMAINS=<extradomains>` | Additional fully qualified domain names (comma separated, no spaces) ie. `extradomain.com,subdomain.anotherdomain.org` |
| `-e STAGING=false` | Set to `true` to retrieve certs in staging mode. Rate limits will be much higher, but the resulting cert will not pass the browser's security test. Only to be used for testing purposes. |
| `-v /config` | All the config files including the webroot reside here. |

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1001` and `PGID=1001`, to find yours use `id user` as below:

```
  $ id username
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```


&nbsp;
## Application Setup

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
* After setup, navigate to `https://yourdomain.url` to access the default homepage (http access through port 80 is disabled by default, you can enable it by editing the default site config at `/config/nginx/site-confs/default`).
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



## Support Info

* Shell access whilst the container is running: `docker exec -it letsencrypt /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f letsencrypt`
* container version number 
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' letsencrypt`
* image version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/letsencrypt`

## Updating Info

Most of our images are static, versioned, and require an image update and container recreation to update the app inside. With some exceptions (ie. nextcloud, plex), we do not recommend or support updating apps inside the container. Please consult the [Application Setup](#application-setup) section above to see if it is recommended for the image.  
  
Below are the instructions for updating containers:  
  
### Via Docker Run/Create
* Update the image: `docker pull linuxserver/letsencrypt`
* Stop the running container: `docker stop letsencrypt`
* Delete the container: `docker rm letsencrypt`
* Recreate a new container with the same docker create parameters as instructed above (if mapped correctly to a host folder, your `/config` folder and settings will be preserved)
* Start the new container: `docker start letsencrypt`
* You can also remove the old dangling images: `docker image prune`

### Via Docker Compose
* Update the image: `docker-compose pull linuxserver/letsencrypt`
* Let compose update containers as necessary: `docker-compose up -d`
* You can also remove the old dangling images: `docker image prune`

## Versions

* **03.02.19:** - Removed memcached due to seccomp errors. Let us know if you need to re-enable memcached.
* **28.01.19:** - Add pipeline logic and multi arch.
* **21.01.19:** - Remove client_body_max from proxy.conf (existing users need to manually update).
* **09.01.19:** - Remove tls v1 and v1.1 from default ssl.conf, update ciphers (existing users need to manually update).
* **30.12.18:** - Fix bundle key generation.
* **19.12.18:** - Add ipv6 and http/2 support to default site config.
* **08.12.18:** - Had to remove cert renewal during container start due to certbot's new undocumented `feature` of up to 8 minute random delay.
* **03.12.18:** - Fix silly bug resetting the duckdns token.
* **02.12.18:** - Add dns validation support for ovh.
* **20.11.18:** - Externalize reverse proxy confs to separate github repo `linuxserver/reverse-proxy-confs`, update baseimage packages during build
* **19.11.18:** - Add php opcache package.
* **12.11.18:** - Add support for duckdns wildcard certs via dns validation
* **31.10.18:** - Add various preset proxy confs and fix others (thanks @nemchik and @hijxf)
* **02.10.18:** - Fix fail2ban instructions and logrotate conf
* **11.09.18:** - Add various preset proxy confs and fix others (thanks @nemchik and @LeoVerto)
* **04.09.18:** - Linting fixes.
* **30.08.18:** - Add support for ldap auth, add proxy confs for bazarr, couchpotato, headphones, lidarr and plex subfolder (thanks @nemchik and @jedahan)
* **21.08.18:** - Rebase to alpine 3.8, add info on search engine de-listing
* **08.08.18:** - Add subdomain proxy conf for plex, update emby proxy confs
* **25.07.18:** - Add subdomain proxy conf for syncthing
* **23.07.18:** - Remove backwards compatibility and set default validation method to http. Update portainer proxy config to fix websockets. Add unifi proxy conf.
* **31.05.18:** - Update ssl.conf and proxy.conf for tighter security (thanks @nemchik)
* **30.05.18:** - Add reverse proxy configs for jackett, monitorr, nzbget, nzbhydra, organizr, portainer and transmission (thanks @nemchik)
* **18.05.18:** - Add more info on certs and unraid reverse proxy config
* **11.05.18:** - Add php pgsql support
* **24.04.18:** - Auto generate a private key + fullchain bundle pem that is needed by certain apps
* **20.04.18:** - Add standardized optional reverse proxy conf files
* **19.04.18:** - Bind memcached to localhost only, add php7-sqlite3
* **08.04.18:** - Fix renewal hooks
* **29.03.18:** - Create pfx cert after renewal for dns validation (previous version only created it for http and tls, an oversight)
* **29.03.18:** - Fix staging for v2 api
* **13.03.18:** - Support for wildcard cert with dns validation added. Switched to v2 api for ACME.
* **21.02.18:** - Reduce shellcheck directives by renaming secondary variables
* **20.02.18:** - Sanitize variables, increase log verbosity
* **01.02.18:** - Big changes. `VALIDATION` parameter added for choosing letsencrypt validation methods, including dns through official plugins. `HTTPVAL` is deprecated. `STAGING` parameter added for testing. Backwards compatibility for the short term. Since tls-sni is disabled by letsencrypt, most users will have to change their settings and adopt the new parameters within the next 90 days. Reorganized the nginx default config, split ssl settings into new ssl.conf
* **13.01.18:** - Re-enable ipv6 due to update to fail2ban 0.10.1. Existing users can enable ipv6 by deleting `/config/fail2ban/action.d/iptables-common.local` and restarting the container after updating the image
* **11.01.18:** - Halt the container if validation fails instead of a stop (so restart=always doesn't get users throttled with letsencrypt)
* **10.01.18:** - Add option for http validation on port 80
* **05.01.18:** - Rebase to alpine 3.7
* **04.11.17:** - Add php7 soap module
* **31.10.17:** - Add php7 exif and xmlreader modules
* **25.09.17:** - Manage fail2ban via s6
* **24.09.17:** - Add memcached service
* **01.09.17:** - `--privileged` is no longer required as long as `--cap-add=NET_ADMIN` is added, instructions modified accordingly, disabled fail2ban ipv6 actions due to requiring access to host kernel modules
* **31.08.17:** - Add php7-phar
* **14.07.17:** - Enable modules dynamically in nginx.conf
* **06.07.17:** - Add support for multiple domains (thanks @oznu)
* **22.06.17:** - Add various nginx modules and enable all modules in the default nginx.conf
* **16.06.17:** - Update deprecated certbot option for https validation, make e-mail entry optional, update readme
* **05.06.17:** - Add php7-bz2
* **27.05.17:** - Rebase to alpine 3.6.
* **03.05.17:** - Fix log permissions.
* **18.04.17:** - Add php7-sockets, update fail2ban filter and action defaults
* **27.02.17:** - Add php7-dom, php7-iconv and php7-pdo_sqlite
* **21.02.17:** - Add php7-xml
* **10.02.17:** - Switch to alpine 3.5 base and php7, add php zlib module and all nginx modules
* **13.01.17:** - Add php5-ctype and php5-openssl
* **04.01.17:** - Add php5-mysqli and php5-pdo_mysql
* **22.11.16:** - Add gd and mcrypt packages
* **21.11.16:** - Add curl package
* **07.11.16:** - Initial Release
