FROM nimmis/alpine-glibc

MAINTAINER fadlihub <fadli.ramadhan@elitery.com>

COPY root/. /

RUN apk update && apk upgrade && \
    cd /root && \
    curl http://download-lb.utorrent.com/endpoint/btsync/os/linux-x64/track/stable | tar xfz - && \
    mv btsync /usr/local/bin && \
    rm -rf /var/cache/apk/* && mkdir -p /var/www/html && adduser -S www-data && addgroup -S www-data && chown -R www-data:www-data /var/www/html

VOLUME /var/www/html


