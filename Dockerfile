FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive

# Update and install dependencies
RUN apt-get update && \
apt-get install -y \
nginx \
mariadb-server \
mariadb-common \
mariadb-client \
php \
php-fpm \
python3-pymysql \
php-mysql \
php-curl \
php-gd \
php-mbstring \
php-xml \
php-xmlrpc \
php-soap \
php-intl \
php-zip \
wget \
&& rm -rf /var/lib/apt/lists/*

# Configure NGinx and MariaDB
RUN mkdir /var/www/wpbloat
RUN chmod -R 0755 /var/www/wpbloat
RUN chown -R www-data: /var/www/wpbloat
RUN rm -f /etc/nginx/sites-enabled/default
COPY wp.conf /etc/nginx/sites-enabled/
RUN chmod 0644 /etc/nginx/sites-enabled/wp.conf
#RUN mysql -uroot -h localhost -e "CREATE DATABASE wpdb; GRANT ALL PRIVILEGES ON wpdb.* TO 'wpuser'@'localhost' IDENTIFIED BY 'passwd'; FLUSH PRIVILEGES"

# Download and install Wordpress
RUN wget https://wordpress.org/latest.tar.gz -O /tmp/wplatest.tgz
RUN tar xzf /tmp/wplatest.tgz -C /var/www/wpbloat --strip-components=1
RUN chown www-data: /var/www/wpbloat
RUN chmod 0755 -R /var/www/wpbloat
RUN rm /tmp/wplatest.tgz
#RUN rm /var/www/wpbloat/wp-config.php
COPY wp-config.php /var/www/wpbloat
RUN chown www-data: /var/www/wpbloat/wp-config.php
RUN chmod 0644 /var/www/wpbloat/wp-config.php

# Copy and run startscript
COPY docker-entrypoint.sh /
RUN chmod 777 docker-entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]
