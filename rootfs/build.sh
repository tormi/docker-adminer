#!/bin/sh

apk --update add \
  nginx \
  php-fpm \
  php-mysqli \
  php-sqlite3 \
  php-pgsql

# Fixing file upload rights
chown -R nginx: /var/lib/nginx

# Increase PHP upload limit
sed -r -i -e 's/upload_max_filesize = [0-9]+M/upload_max_filesize = 2000M/g' \
          -e 's/post_max_size = [0-9]+M/post_max_size = 2000M/g' \
    /etc/php/php.ini
