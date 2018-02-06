# LETS ORG!

Organizr setup right with a docker and ready to do some reverse proxying

## Usage

```
docker create \
  --cap-add=NET_ADMIN \
  --name=letsorg \
  -v <path to data>:/config \
  -e PGID=<gid> -e PUID=<uid>  \
  -e EMAIL=<email> \
  -e URL=<url> \
  -e SUBDOMAINS=<subdomains> \
  -e VALIDATION=<method> \
  -e SONARR_URL=http://sonarr:8989/sonarr \
  -e RADARR_URL=http://radarr:7878/radarr \
  -e LIDARR_URL=http://lidarr:8686/lidarr \
  -e OMBI_URL=http://ombi:5000/ombi \
  -e CALIBREWEB_URL=http://calibre-web:8080 \
  -e GUACAMOLE_URL=http://guacamole:8080 \
  -e MYLAR_URL=http://mylar:8888 \
  -e NETDATA_URL=http://netdata:19999 \
  -e PLEX_URL=http://127.0.0.1:32400 \
  -e TAUTULLI_URL=http://tautulli:8181/tautulli \
  -e DELUGE_URL=http://deluge:6000 \
  -e RUTORRENT_URL=http://rutorrent:443 \
  -p 80:80 -p 443:443 \
  -e TZ=<timezone> \
  vertig0ne/letsorg
```
## Details

So... Since this is forked from letsencrypt, only a little tighter to a single use-case. It's designed to be used with Organizr as the root, but comes pre-loaded with loads of things that may require reverse proxying to work with org properly.

Most of the options in the create comes from [linuxserver/letsencrypt](https://github.com/linuxserver/docker-letsencrypt) so please, check them first. If you run into issues.

 '*_URL=' is obviously following a format, you put the URL in that it goes to, if you are using internal networking, use named instances and go from there, obviously, as you know most of these apps do require some kind of basedir set. This does NOT perform that action, but aims to help ease the burden of figuring out whats wrong as these are designed to work. 

## Versions

+ **06.02.18:** Added SONARR_URL, RADARR_URL, LIDARR_URL, OMBI_URL, TAUTULLI_URL
+ **05.02.18:** Forked code from linuxserver/letsencrypt as theirs is the best base, so why not go from there.
