FROM debian:jessie

RUN set -x \
    && apt-get update \ 
    && apt-get install libapache2-mod-php5 php5 php5-cli php5-pgsql php5-mysql curl -y --force-yes \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer \
    && apt-get clean

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
