#!/bin/sh

set -eux

apk --update add \
    s6 \
    nginx \
    php7-fpm \
    php7-pdo_dblib \
    php7-pdo_mysql \
    php7-pdo_pgsql \
    php7-pdo_sqlite \
    php7-pecl-mongodb \
    php7-xml \
    php7-json \
    php7-session

# Fixing file upload rights
chown -R nginx: /var/lib/nginx

# Increase PHP upload limit
sed -r -i -e 's/upload_max_filesize = [0-9]+M/upload_max_filesize = 2000M/g' \
          -e 's/post_max_size = [0-9]+M/post_max_size = 2000M/g' \
          -e 's/max_execution_time = [0-9]+/max_execution_time = 300/g' \
          -e 's/memory_limit = [0-9]+M/memory_limit = 1024M/g' \
    /etc/php7/php.ini

sed -r -i -e 's/;request_terminate_timeout = [0-9]+/request_terminate_timeout = 300/g' \
    /etc/php7/php-fpm.d/www.conf

find /etc/services.d -name run -exec chmod 755 {} \;
