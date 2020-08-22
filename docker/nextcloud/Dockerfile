ARG ALPINE_VERSION="3.12"

FROM alpine:${ALPINE_VERSION}

RUN addgroup -g 101 -S nginx && adduser -u 100 -S nginx -G nginx && \
    apk add --no-cache curl php7-fpm php7-ctype php7-curl php7-dom php7-gd \
    php7-iconv php7-json php7-xml php7-mbstring php7-openssl php7-posix \
    php7-session php7-simplexml php7-xmlreader php7-xmlwriter php7-zip \
    php7-zlib php7-pdo_mysql php7-fileinfo php7-bz2 php7-bcmath php7-pdo_sqlite \ 
    php7-intl php7-opcache php7-gmp php7-pecl-imagick php7-pecl-redis php7-pecl-apcu php7-ldap && \
    curl -#Lo nextcloud-19.0.0.zip https://download.nextcloud.com/server/releases/nextcloud-19.0.0.zip && \
    mkdir /var/www && unzip nextcloud-19.0.0.zip -d /var/www/ && \
    mv /var/www/nextcloud /var/www/html && \
    chown -R nginx:nginx /var/www/html && \
    rm nextcloud-19.0.0.zip && \ 
    sed -i \
        -e 's/^listen.*/listen = 9000/' /etc/php7/php-fpm.d/www.conf  \
        -e 's/^user.*/user = nginx/' /etc/php7/php-fpm.d/www.conf     \
        -e 's/^group.*/group = nginx/' /etc/php7/php-fpm.d/www.conf   \
        -e 's/^memory_limit.*/memory_limit = 512M/' /etc/php7/php.ini \ 
        -e '/^;.*clear_env/s/^;//' /etc/php7/php-fpm.d/www.conf

COPY autoconfig.php /var/www/html/config/autoconfig.php
COPY cache.config.php /var/www/html/config/cache.config.php

VOLUME [ "/var/www/html" ]

EXPOSE 9000

CMD ["php-fpm7", "--force-stderr", "--nodaemonize"]

HEALTHCHECK CMD nc -w 1 localhost 9000 || exit 1