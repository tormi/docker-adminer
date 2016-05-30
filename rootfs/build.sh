#!/bin/sh

set -eux

apk --update add \
    s6 \
    nginx \
    php5-fpm \
    php5-pdo_mysql \
    php5-pdo_pgsql \
    php5-pdo_sqlite \
    php5-mssql \
    php5-xml \
    php5-json \
    php5-pear \
    php5-dev \
    autoconf \
    make \
    gcc \
    g++ \
    openssl-dev

# Patch pecl command
sed -i -e 's/\(PHP -C\) -n/\1/g' /usr/bin/pecl

pecl install mongo

apk del \
    php5-pear \
    php5-dev \
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
    /etc/php5/php.ini

find /etc/services.d -name run -exec chmod 755 {} \;
