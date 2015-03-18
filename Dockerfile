FROM debian:stable
MAINTAINER Arnaud de Mouhy <arnaud@flyingpingu.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
  nginx supervisor php5-fpm \
  php5-pgsql php5-mysql php5-sqlite
RUN DEBIAN_FRONTEND=noninteractive apt-get clean

# add adminer as the only nginx site
ADD adminer.nginx.conf /etc/nginx/sites-available/adminer
RUN ln -s /etc/nginx/sites-available/adminer /etc/nginx/sites-enabled/adminer
RUN rm /etc/nginx/sites-enabled/default

# install adminer and default theme
ADD adminer/adminer-4.2.1.php /var/www/index.php
ADD adminer/adminer.css /var/www/adminer.css

WORKDIR /var/www
RUN chown www-data:www-data -R /var/www

# Increase PHP upload limit
RUN sed -r -i -e 's/upload_max_filesize = [0-9]+M/upload_max_filesize = 2000M/g' /etc/php5/fpm/php.ini
RUN sed -r -i -e 's/post_max_size = [0-9]+M/post_max_size = 2000M/g' /etc/php5/fpm/php.ini

# expose only nginx HTTP port
EXPOSE 80

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD supervisord -c /etc/supervisor/conf.d/supervisord.conf
