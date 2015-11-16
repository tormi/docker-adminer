#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get -y install \
  nginx-light supervisor php5-fpm \
  php5-pgsql php5-mysql php5-sqlite

# add adminer as the only nginx site
rm /etc/nginx/sites-enabled/default

chown www-data:www-data -R /var/www

# Increase PHP upload limit
sed -r -i -e 's/upload_max_filesize = [0-9]+M/upload_max_filesize = 2000M/g' \
          -e 's/post_max_size = [0-9]+M/post_max_size = 2000M/g' \
    /etc/php5/fpm/php.ini

# Slimming down
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
