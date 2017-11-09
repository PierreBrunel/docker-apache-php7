FROM ubuntu:16.04
MAINTAINER Pierre Brunel <pierrebrunel84@gmail.com>

VOLUME ["/var/www"]

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y \
      apache2 \
      php \
      php-intl \
      php-cli \
      libapache2-mod-php \
      php-apcu \
      php-gd \
      php-json \
      php-ldap \
      php-mbstring \
      php-mysql \
      php-opcache \
      php-pgsql \
      php-sqlite3 \
      php-xml \
      php-xsl \
      php-zip \
      php-soap \
      php-curl \
      php-mcrypt \
      php-xdebug \
      composer

COPY apache_default /etc/apache2/sites-available/000-default.conf
COPY run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN a2enmod rewrite

EXPOSE 80
CMD ["/usr/local/bin/run"]
