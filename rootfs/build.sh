#!/bin/sh

set -eux

apk --update add \
    s6 \
    nginx \
    php-fpm \
    php-pdo_mysql \
    php-pdo_pgsql \
    php-pdo_sqlite \
    php-mssql \
    php-xml \
    php-json \
    php-pear \
    php-dev \
    autoconf \
    make \
    gcc \
    g++ \
    openssl-dev

# Patch pecl command
sed -i -e 's/\(PHP -C\) -n/\1/g' /usr/bin/pecl

pecl install mongo

apk del \
    php-pear \
    php-dev \
    autoconf \
    make \
    gcc \
    g++ \
    openssl-dev

# Fixing file upload rights
chown -R nginx: /var/lib/nginx

# Increase PHP upload limit
sed -r -i -e 's/upload_max_filesize = [0-9]+M/upload_max_filesize = 2000M/g' \
          -e 's/post_max_size = [0-9]+M/post_max_size = 2000M/g' \
    /etc/php/php.ini

find /etc/services.d -name run -exec chmod 755 {} \;
