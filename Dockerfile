FROM nimmis/alpine-glibc

MAINTAINER nimmis <kjell.havneskold@gmail.com>

COPY root/. /

RUN apk update && apk upgrade && \
    cd /root && \
    curl https://download-cdn.getsync.com/stable/linux-x64/BitTorrent-Sync_x64.tar.gz | tar xfz - && \
    mv btsync /usr/local/bin && \
#    apk add apache2 libxml2-dev apache2-utils && \
#    mkdir /web/ && chown -R apache.www-data /web && \
   
#    sed -i 's#^DocumentRoot ".*#DocumentRoot "/web/html"#g' /etc/apache2/httpd.conf && \
#    sed -i 's#AllowOverride none#AllowOverride All#' /etc/apache2/httpd.conf && \
#    sed -i 's#^ServerRoot .*#ServerRoot /web#g'  /etc/apache2/httpd.conf && \
#    sed -i 's/^#ServerName.*/ServerName webproxy/' /etc/apache2/httpd.conf && \
#    sed -i 's#^IncludeOptional /etc/apache2/conf#IncludeOptional /web/config/conf#g' /etc/apache2/httpd.conf && \
#    sed -i 's#PidFile "/run/.*#Pidfile "/web/run/httpd.pid"#g'  /etc/apache2/conf.d/mpm.conf && \
#    sed -i 's#Directory "/var/www/localhost/htdocs.*#Directory "/web/html" >#g' /etc/apache2/httpd.conf && \
#    sed -i 's#Directory "/var/www/localhost/cgi-bin.*#Directory "/web/cgi-bin" >#g' /etc/apache2/httpd.conf && \

#    sed -i 's#/var/log/apache2/#/web/logs/#g' /etc/logrotate.d/apache2 && \

    rm -rf /var/cache/apk/*

VOLUME /data

EXPOSE 33333

