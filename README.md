# IMPORTANT NOTICE: THIS IMAGE HAS BEEN DEPRECATED AND THE PROJECT IS MOVED TO A NEW REPO
Due to a trademark related request, this image is moved to a new repo on [Docker Hub](https://hub.docker.com/r/linuxserver/swag) and [GitHub](https://github.com/linuxserver/docker-swag). This is a breaking change and you need to manually update. Apologies for the the disruption.

Switching existing implementations over to the new image is very easy, just follow these simple steps: https://github.com/linuxserver/docker-swag#migrating-from-the-old-linuxserverletsencrypt-image

[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)](https://linuxserver.io)

[![Blog](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=Blog)](https://blog.linuxserver.io "all the things you can do with our containers including How-To guides, opinions and much more!")
[![Discord](https://img.shields.io/discord/354974912613449730.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=Discord&logo=discord)](https://discord.gg/YWrKVTn "realtime support / chat with the community and the team.")
[![Discourse](https://img.shields.io/discourse/https/discourse.linuxserver.io/topics.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=discourse)](https://discourse.linuxserver.io "post on our community forum.")
[![Fleet](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=Fleet)](https://fleet.linuxserver.io "an online web interface which displays all of our maintained images.")
[![GitHub](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=GitHub&logo=github)](https://github.com/linuxserver "view the source for all of our repositories.")
[![Open Collective](https://img.shields.io/opencollective/all/linuxserver.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=Supporters&logo=open%20collective)](https://opencollective.com/linuxserver "please consider helping us by either donating or contributing to our budget")

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring:

* regular and timely application updates
* easy user mappings (PGID, PUID)
* custom base image with s6 overlay
* weekly base OS updates with common layers across the entire LinuxServer.io ecosystem to minimise space usage, down time and bandwidth
* regular security updates

Find us at:
* [Blog](https://blog.linuxserver.io) - all the things you can do with our containers including How-To guides, opinions and much more!
* [Discord](https://discord.gg/YWrKVTn) - realtime support / chat with the community and the team.
* [Discourse](https://discourse.linuxserver.io) - post on our community forum.
* [Fleet](https://fleet.linuxserver.io) - an online web interface which displays all of our maintained images.
* [GitHub](https://github.com/linuxserver) - view the source for all of our repositories.
* [Open Collective](https://opencollective.com/linuxserver) - please consider helping us by either donating or contributing to our budget

# [linuxserver/swag](https://github.com/linuxserver/docker-letsencrypt)

[![GitHub Stars](https://img.shields.io/github/stars/linuxserver/docker-letsencrypt.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/linuxserver/docker-letsencrypt)
[![GitHub Release](https://img.shields.io/github/release/linuxserver/docker-letsencrypt.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/linuxserver/docker-letsencrypt/releases)
[![GitHub Package Repository](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=GitHub%20Package&logo=github)](https://github.com/linuxserver/docker-letsencrypt/packages)
[![GitLab Container Registry](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=GitLab%20Registry&logo=gitlab)](https://gitlab.com/Linuxserver.io/docker-letsencrypt/container_registry)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/linuxserver/letsencrypt.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge)](https://microbadger.com/images/linuxserver/letsencrypt "Get your own version badge on microbadger.com")
[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/letsencrypt.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=pulls&logo=docker)](https://hub.docker.com/r/linuxserver/letsencrypt)
[![Docker Stars](https://img.shields.io/docker/stars/linuxserver/letsencrypt.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=stars&logo=docker)](https://hub.docker.com/r/linuxserver/letsencrypt)
[![Jenkins Build](https://img.shields.io/jenkins/build?labelColor=555555&logoColor=ffffff&style=for-the-badge&jobUrl=https%3A%2F%2Fci.linuxserver.io%2Fjob%2FDocker-Pipeline-Builders%2Fjob%2Fdocker-letsencrypt%2Fjob%2Fmaster%2F&logo=jenkins)](https://ci.linuxserver.io/job/Docker-Pipeline-Builders/job/docker-letsencrypt/job/master/)
[![LSIO CI](https://img.shields.io/badge/dynamic/yaml?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=CI&query=CI&url=https%3A%2F%2Flsio-ci.ams3.digitaloceanspaces.com%2Flinuxserver%2Fletsencrypt%2Flatest%2Fci-status.yml)](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/letsencrypt/latest/index.html)

**SWAG - Secure Web-server And Gateway** (formerly known as letsencrypt, no relation to Let's Encrypt™) sets up an Nginx webserver and reverse proxy with php support and a built-in certbot client that automates free SSL server certificate generation and renewal processes. It also contains fail2ban for intrusion prevention.

[![letsencrypt](https://raw.githubusercontent.com/aptalca/testing/testing/swag.gif)](https://linuxserver.io)

## Supported Architectures

Our images support multiple architectures such as `x86-64`, `arm64` and `armhf`. We utilise the docker manifest for multi-platform awareness. More information is available from docker [here](https://github.com/docker/distribution/blob/master/docs/spec/manifest-v2-2.md#manifest-list) and our announcement [here](https://blog.linuxserver.io/2019/02/21/the-lsio-pipeline-project/).

Simply pulling `linuxserver/letsencrypt` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:

| Architecture | Tag |
| :----: | --- |
| x86-64 | amd64-latest |
| arm64 | arm64v8-latest |
| armhf | arm32v7-latest |


## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=swag \
  --cap-add=NET_ADMIN \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -e URL=yourdomain.url \
  -e SUBDOMAINS=www, \
  -e VALIDATION=http \
  -e DNSPLUGIN=cloudflare `#optional` \
  -e PROPAGATION= `#optional` \
  -e DUCKDNSTOKEN= `#optional` \
  -e EMAIL= `#optional` \
  -e ONLY_SUBDOMAINS=false `#optional` \
  -e EXTRA_DOMAINS= `#optional` \
  -e STAGING=false `#optional` \
  -p 443:443 \
  -p 80:80 `#optional` \
  -v /path/to/appdata/config:/config \
  --restart unless-stopped \
  linuxserver/letsencrypt
```


### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2.1"
services:
  swag:
    image: linuxserver/letsencrypt
    container_name: swag
    cap_add:
      - NET_ADMIN
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
      - URL=yourdomain.url
      - SUBDOMAINS=www,
      - VALIDATION=http
      - DNSPLUGIN=cloudflare #optional
      - PROPAGATION= #optional
      - DUCKDNSTOKEN= #optional
      - EMAIL= #optional
      - ONLY_SUBDOMAINS=false #optional
      - EXTRA_DOMAINS= #optional
      - STAGING=false #optional
    volumes:
      - /path/to/appdata/config:/config
    ports:
      - 443:443
      - 80:80 #optional
    restart: unless-stopped
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 443` | Https port |
| `-p 80` | Http port (required for http validation and http -> https redirect) |
| `-e PUID=1000` | for UserID - see below for explanation |
| `-e PGID=1000` | for GroupID - see below for explanation |
| `-e TZ=Europe/London` | Specify a timezone to use EG Europe/London. |
| `-e URL=yourdomain.url` | Top url you have control over (`customdomain.com` if you own it, or `customsubdomain.ddnsprovider.com` if dynamic dns). |
| `-e SUBDOMAINS=www,` | Subdomains you'd like the cert to cover (comma separated, no spaces) ie. `www,ftp,cloud`. For a wildcard cert, set this _exactly_ to `wildcard` (wildcard cert is available via `dns` and `duckdns` validation only) |
| `-e VALIDATION=http` | Certbot validation method to use, options are `http`, `dns` or `duckdns` (`dns` method also requires `DNSPLUGIN` variable set) (`duckdns` method requires `DUCKDNSTOKEN` variable set, and the `SUBDOMAINS` variable must be either empty or set to `wildcard`). |
| `-e DNSPLUGIN=cloudflare` | Required if `VALIDATION` is set to `dns`. Options are `aliyun`, `cloudflare`, `cloudxns`, `cpanel`, `digitalocean`, `dnsimple`, `dnsmadeeasy`, `domeneshop`, `gandi`, `google`, `inwx`, `linode`, `luadns`, `nsone`, `ovh`, `rfc2136`, `route53` and `transip`. Also need to enter the credentials into the corresponding ini (or json for some plugins) file under `/config/dns-conf`. |
| `-e PROPAGATION=` | Optionally override (in seconds) the default propagation time for the dns plugins. |
| `-e DUCKDNSTOKEN=` | Required if `VALIDATION` is set to `duckdns`. Retrieve your token from https://www.duckdns.org |
| `-e EMAIL=` | Optional e-mail address used for cert expiration notifications. |
| `-e ONLY_SUBDOMAINS=false` | If you wish to get certs only for certain subdomains, but not the main domain (main domain may be hosted on another machine and cannot be validated), set this to `true` |
| `-e EXTRA_DOMAINS=` | Additional fully qualified domain names (comma separated, no spaces) ie. `extradomain.com,subdomain.anotherdomain.org,*.anotherdomain.org` |
| `-e STAGING=false` | Set to `true` to retrieve certs in staging mode. Rate limits will be much higher, but the resulting cert will not pass the browser's security test. Only to be used for testing purposes. |
| `-v /config` | All the config files including the webroot reside here. |

## Environment variables from files (Docker secrets)

You can set any environment variable from a file by using a special prepend `FILE__`.

As an example:

```
-e FILE__PASSWORD=/run/secrets/mysecretpassword
```

Will set the environment variable `PASSWORD` based on the contents of the `/run/secrets/mysecretpassword` file.

## Umask for running applications

For all of our images we provide the ability to override the default umask settings for services started within the containers using the optional `-e UMASK=022` setting.
Keep in mind umask is not chmod it subtracts from permissions based on it's value it does not add. Please read up [here](https://en.wikipedia.org/wiki/Umask) before asking for support.

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1000` and `PGID=1000`, to find yours use `id user` as below:

```
  $ id username
    uid=1000(dockeruser) gid=1000(dockergroup) groups=1000(dockergroup)
```


&nbsp;
## Application Setup

### Validation and initial setup
* Before running this container, make sure that the url and subdomains are properly forwarded to this container's host, and that port 443 (and/or 80) is not being used by another service on the host (NAS gui, another webserver, etc.).
* For `http` validation, port 80 on the internet side of the router should be forwarded to this container's port 80
* For `dns` validation, make sure to enter your credentials into the corresponding ini (or json for some plugins) file under `/config/dns-conf`
  * Cloudflare provides free accounts for managing dns and is very easy to use with this image. Make sure that it is set up for "dns only" instead of "dns + proxy"
  * Google dns plugin is meant to be used with "Google Cloud DNS", a paid enterprise product, and not for "Google Domains DNS"
* For `duckdns` validation, either leave the `SUBDOMAINS` variable empty or set it to `wildcard`, and set the `DUCKDNSTOKEN` variable with your duckdns token. Due to a limitation of duckdns, the resulting cert will only cover either main subdomain (ie. `yoursubdomain.duckdns.org`), or sub-subdomains (ie. `*.yoursubdomain.duckdns.org`), but will not both at the same time. You can use our [duckdns image](https://hub.docker.com/r/linuxserver/duckdns/) to update your IP on duckdns.org.
* `--cap-add=NET_ADMIN` is required for fail2ban to modify iptables
* If you need a dynamic dns provider, you can use the free provider duckdns.org where the `URL` will be `yoursubdomain.duckdns.org` and the `SUBDOMAINS` can be `www,ftp,cloud` with http validation, or `wildcard` with dns validation.
* After setup, navigate to `https://yourdomain.url` to access the default homepage (http access through port 80 is disabled by default, you can enable it by editing the default site config at `/config/nginx/site-confs/default`).
* Certs are checked nightly and if expiration is within 30 days, renewal is attempted. If your cert is about to expire in less than 30 days, check the logs under `/config/log/letsencrypt` to see why the renewals have been failing. It is recommended to input your e-mail in docker parameters so you receive expiration notices from Let's Encrypt in those circumstances.
### Security and password protection
* The container detects changes to url and subdomains, revokes existing certs and generates new ones during start.
* The container provides a pre-generated 4096-bit dhparams.pem (rotated weekly via [Jenkins job](https://ci.linuxserver.io/blue/organizations/jenkins/Xtras-Builders-Etc%2Fdhparams-uploader/activity)) for new instances, however you may generate your own by running `docker exec letsencrypt openssl dhparam -out /config/nginx/dhparams.pem 4096` WARNING: This takes a very long time
* If you'd like to password protect your sites, you can use htpasswd. Run the following command on your host to generate the htpasswd file `docker exec -it letsencrypt htpasswd -c /config/nginx/.htpasswd <username>`
* You can add multiple user:pass to `.htpasswd`. For the first user, use the above command, for others, use the above command without the `-c` flag, as it will force deletion of the existing `.htpasswd` and creation of a new one
* You can also use ldap auth for security and access control. A sample, user configurable ldap.conf is provided, and it requires the separate image [linuxserver/ldap-auth](https://hub.docker.com/r/linuxserver/ldap-auth/) to communicate with an ldap server.
### Site config and reverse proxy
* The default site config resides at `/config/nginx/site-confs/default`. Feel free to modify this file, and you can add other conf files to this directory. However, if you delete the `default` file, a new default will be created on container start.
* Preset reverse proxy config files are added for popular apps. See the `README.md` file under `/config/nginx/proxy_confs` for instructions on how to enable them. The preset confs reside in and get imported from [this repo](https://github.com/linuxserver/reverse-proxy-confs).
* If you wish to hide your site from search engine crawlers, you may find it useful to add this configuration line to your site config, within the server block, above the line where ssl.conf is included
`add_header X-Robots-Tag "noindex, nofollow, nosnippet, noarchive";`
This will *ask* Google et al not to index and list your site. Be careful with this, as you will eventually be de-listed if you leave this line in on a site you wish to be present on search engines
* If you wish to redirect http to https, you must expose port 80
### Using certs in other containers
* This container includes auto-generated pfx and private-fullchain-bundle pem certs that are needed by other apps like Emby and Znc.
  * To use these certs in other containers, do either of the following:
  1. *(Easier)* Mount the container's config folder in other containers (ie. `-v /path-to-le-config:/le-ssl`) and in the other containers, use the cert location `/le-ssl/keys/letsencrypt/`
  2. *(More secure)* Mount the letsencrypt folder `etc/letsencrypt` that resides under `/config` in other containers (ie. `-v /path-to-le-config/etc/letsencrypt:/le-ssl`) and in the other containers, use the cert location `/le-ssl/live/<your.domain.url>/` (This is more secure because the first method shares the entire letsencrypt config folder with other containers, including the www files, whereas the second method only shares the ssl certs)
  * These certs include:
  1. `cert.pem`, `chain.pem`, `fullchain.pem` and `privkey.pem`, which are generated by Let's Encrypt and used by nginx and various other apps
  2. `privkey.pfx`, a format supported by Microsoft and commonly used by dotnet apps such as Emby Server (no password)
  3. `priv-fullchain-bundle.pem`, a pem cert that bundles the private key and the fullchain, used by apps like ZNC
### Using fail2ban
* This container includes fail2ban set up with 3 jails by default:
  1. nginx-http-auth
  2. nginx-badbots
  3. nginx-botsearch
* To enable or disable other jails, modify the file `/config/fail2ban/jail.local`
* To modify filters and actions, instead of editing the `.conf` files, create `.local` files with the same name and edit those because .conf files get overwritten when the actions and filters are updated. `.local` files will append whatever's in the `.conf` files (ie. `nginx-http-auth.conf` --> `nginx-http-auth.local`)
* You can check which jails are active via `docker exec -it swag fail2ban-client status`
* You can check the status of a specific jail via `docker exec -it swag fail2ban-client status <jail name>`
* You can unban an IP via `docker exec -it swag fail2ban-client set <jail name> unbanip <IP>`
* A list of commands can be found here: https://www.fail2ban.org/wiki/index.php/Commands


## Docker Mods
[![Docker Mods](https://img.shields.io/badge/dynamic/yaml?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=mods&query=%24.mods%5B%27letsencrypt%27%5D.mod_count&url=https%3A%2F%2Fraw.githubusercontent.com%2Flinuxserver%2Fdocker-mods%2Fmaster%2Fmod-list.yml)](https://mods.linuxserver.io/?mod=letsencrypt "view available mods for this container.")

We publish various [Docker Mods](https://github.com/linuxserver/docker-mods) to enable additional functionality within the containers. The list of Mods available for this image (if any) can be accessed via the dynamic badge above.


## Support Info

* Shell access whilst the container is running: `docker exec -it swag /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f swag`
* container version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' swag`
* image version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/letsencrypt`

## Updating Info

Most of our images are static, versioned, and require an image update and container recreation to update the app inside. With some exceptions (ie. nextcloud, plex), we do not recommend or support updating apps inside the container. Please consult the [Application Setup](#application-setup) section above to see if it is recommended for the image.

Below are the instructions for updating containers:

### Via Docker Run/Create
* Update the image: `docker pull linuxserver/letsencrypt`
* Stop the running container: `docker stop swag`
* Delete the container: `docker rm swag`
* Recreate a new container with the same docker create parameters as instructed above (if mapped correctly to a host folder, your `/config` folder and settings will be preserved)
* Start the new container: `docker start swag`
* You can also remove the old dangling images: `docker image prune`

### Via Docker Compose
* Update all images: `docker-compose pull`
  * or update a single image: `docker-compose pull swag`
* Let compose update all containers as necessary: `docker-compose up -d`
  * or update a single container: `docker-compose up -d swag`
* You can also remove the old dangling images: `docker image prune`

### Via Watchtower auto-updater (especially useful if you don't remember the original parameters)
* Pull the latest image at its tag and replace it with the same env variables in one run:
  ```
  docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  containrrr/watchtower \
  --run-once swag
  ```

**Note:** We do not endorse the use of Watchtower as a solution to automated updates of existing Docker containers. In fact we generally discourage automated updates. However, this is a useful tool for one-time manual updates of containers where you have forgotten the original parameters. In the long term, we highly recommend using Docker Compose.

* You can also remove the old dangling images: `docker image prune`

## Building locally

If you want to make local modifications to these images for development purposes or just to customize the logic:
```
git clone https://github.com/linuxserver/docker-letsencrypt.git
cd docker-letsencrypt
docker build \
  --no-cache \
  --pull \
  -t linuxserver/letsencrypt:latest .
```

The ARM variants can be built on x86_64 hardware using `multiarch/qemu-user-static`
```
docker run --rm --privileged multiarch/qemu-user-static:register --reset
```

Once registered you can define the dockerfile to use with `-f Dockerfile.aarch64`.

## Versions

* **28.07.20:** - Start transition to new name, SWAG.
* **17.06.20:** - Reformat ssl.conf. Pull in pre-generated dhparams.pem from DO Spaces. Deprecate `DHLEVEL` param.
* **01.06.20:** - Rebasing to alpine 3.12, change ldap login address to `/ldaplogin` to avoid clashes (existing users need to manually update).
* **31.05.20:** - Tweak Authelia confs (existing users can delete `authelia-server.conf` and `authelia-location.conf`, and restart to update).
* **23.05.20:** - Add support for Authelia.
* **15.05.20:** - Remove `php7-pecl-imagick` due to upstream issues. Add support for `Geoip2` auto db retrieval.
* **10.05.20:** - Added support for fail2ban deny statements.
* **04.05.20:** - Allow for optionally setting propagation time for dns plugins. Add repo version of `whois` to replace the built-in busybox version. Update `jail.local` to change default fail2ban ban action to more widely supported `iptables-allports`.
* **13.04.20:** - Update cloudflare.ini with token info.
* **11.03.20:** - Add php7-sodium.
* **06.03.20:** - Implement cert renewal attempt during container start (only if the cert is already expired or will expire within the next 24 hours, otherwise it will be attempted at 2:08am).
* **05.03.20:** - Use port and proto upstream variables for ldap and default sample confs.
* **24.02.20:** - Remove world/group read permissions in dns-conf.
* **23.02.20:** - Add aliyun dns validation plugin.
* **28.01.20:** - Deprecate tls-sni validation method, remove from docs.
* **27.01.20:** - Add support for cpanel dns validation.
* **10.01.20:** - Add support for domeneshop dns validation.
* **07.01.20:** - Update ciphers from Mozilla ssl-config recommendations.
* **01.01.20:** - Add support for gandi dns validation.
* **31.12.19:** - GeoIP2 databases now require personal license keys to download. Auto download is disabled and log message is added.
* **19.12.19:** - Rebasing to alpine 3.11.
* **19.12.19:** - Increase large_client_header_buffers in nginx.conf to prevent 414 errors.
* **18.12.19:** - Add php7-imap and php7-pecl-apcu.
* **11.12.19:** - Fix Google Cloud DNS to use .json file for authentication.
* **20.11.19:** - Fix cryptography version mismatch due to pip issue.
* **17.11.19:** - Add php7-pdo_odbc.
* **17.11.19:** - Add transip dns validation plugin.
* **27.10.19:** - Turn off lua resty core to get rid of error message in the log (existing users will have to delete `/config/nginx/nginx.conf` and restart the container).
* **26.10.19:** - Add new package for stream-geoip2, remove geoip2 module patch.
* **24.10.19:** - Add php7-pecl-imagick.
* **23.10.19:** - Update Host header in `proxy.conf` to fix CSRF issues.
* **12.10.19:** - Add linode dns validation plugin.
* **23.09.19:** - Move GeoIP2 db to /config to make it persistent.
* **14.08.19:** - Add inwx dns validation plugin.
* **06.08.19:** - Add php7-ftp.
* **04.08.19:** - Add php7-bcmath, php7-pear, php7-xmlrpc.
* **02.08.19:** - Add php7-ldap, remove geoip v1(deprecated).
* **01.08.19:** - Mark https redirect block as default_server (effective only for new installs).
* **31.07.19:** - Create GeoIP2 databse (libmaxminddb) during container start if it doesn't exist.
* **30.07.19:** - Support main domain via duckdns validation.
* **29.07.19:** - Enable http to https redirect by default (effective only for new installs).
* **01.07.19:** - Patch geoip2 module until upstream is fixed.
* **30.06.19:** - Add geoip2 module.
* **28.06.19:** - Rebasing to alpine 3.10.
* **19.06.19:** - Set resolver to docker dns in ssl.conf.
* **29.05.19:** - Compensate for changes to the reverse-proxy-confs repo.
* **26.05.19:** - Remove botocore/urllib patch.
* **08.05.19:** - Remove default.conf when nginx is upgraded in downstream image.
* **30.04.19:** - Add php-redis.
* **12.04.19:** - Rebase aarch64 image to 3.9.
* **25.03.19:** - Rebase aarch64 image back to 3.8 due to python issues (specifically with fail2ban), switch packages to python 3 on amd64 and armhf, clean up pip/python cache to shrink image size.
* **23.03.19:** - Switching to new Base images, shift to arm32v7 tag.
* **10.03.19:** - Add TLSv1.3 to ssl.conf.
* **02.03.19:** - Add php intl and posix modules.
* **27.02.19:** - Add gnupg package.
* **22.02.19:** - Rebase to alpine 3.9.
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
* **01.02.18:** - Big changes. `VALIDATION` parameter added for choosing certbot validation methods, including dns through official plugins. `HTTPVAL` is deprecated. `STAGING` parameter added for testing. Backwards compatibility for the short term. Since tls-sni is disabled by letsencrypt, most users will have to change their settings and adopt the new parameters within the next 90 days. Reorganized the nginx default config, split ssl settings into new ssl.conf
* **13.01.18:** - Re-enable ipv6 due to update to fail2ban 0.10.1. Existing users can enable ipv6 by deleting `/config/fail2ban/action.d/iptables-common.local` and restarting the container after updating the image
* **11.01.18:** - Halt the container if validation fails instead of a stop (so restart=always doesn't get users throttled with Let's Encrypt)
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
