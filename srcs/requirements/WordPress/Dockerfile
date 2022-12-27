FROM debian:buster
EXPOSE 9000
ARG DOMAIN_NAME_
RUN apt upgrade && apt update && apt install -y wget php libapache2-mod-php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip php-fpm mariadb-client-core-10.3
RUN wget -P /usr/local/bin https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod -R 777 /usr/local/bin/wp-cli.phar && mv /usr/local/bin/wp-cli.phar /usr/local/bin/wp
RUN service php7.3-fpm start

COPY conf/wp-config.php /var/www/wordpress/
RUN sed -i "s|DOMAIN_NAME_|$DOMAIN_NAME_|g" /var/www/wordpress/wp-config.php

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/

WORKDIR /var/www/wordpress
RUN wp core download --allow-root && \
   chown -R www-data:www-data .
COPY tools/init.sh /
CMD /bin/bash /init.sh



