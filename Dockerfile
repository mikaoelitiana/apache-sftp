#+++++++++++++++++++++++++++++++++++++++
# Dockerfile for webdevops/php-apache:7.2
#    -- automatically generated  --
#+++++++++++++++++++++++++++++++++++++++

FROM webdevops/php:7.2

ENV WEB_DOCUMENT_ROOT=/app \
    WEB_DOCUMENT_INDEX=index.php \
    WEB_ALIAS_DOMAIN=*.vm \
    WEB_PHP_TIMEOUT=600 \
    WEB_PHP_SOCKET=""
ENV WEB_PHP_SOCKET=127.0.0.1:9000

ENV FTP_USER=application \
    FTP_PASSWORD=application \
    FTP_UID=1000 \
    FTP_GID=1000 \
    FTP_PATH=/data/ftp/

COPY conf/ /opt/docker/

RUN set -x \
    # Install apache
    && apt-install \
        apache2 \
    && sed -ri ' \
        s!^(\s*CustomLog)\s+\S+!\1 /proc/self/fd/1!g; \
        s!^(\s*ErrorLog)\s+\S+!\1 /proc/self/fd/2!g; \
        ' /etc/apache2/apache2.conf \
    && rm -f /etc/apache2/sites-enabled/* \
    && a2enmod actions proxy proxy_fcgi ssl rewrite headers expires \
    && docker-run-bootstrap \
    && docker-image-cleanup

ENV FTP_USER=application \
    FTP_PASSWORD=application \
    FTP_UID=1000 \
    FTP_GID=1000 \
    FTP_PATH=/data/ftp/

EXPOSE 80 443 20 21 12020 12021 12022 12023 12024 12025
