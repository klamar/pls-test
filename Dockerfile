FROM debian:jessie

RUN set -x \
    && apt-get update \ 
    && apt-get install libapache2-mod-php5 php5 php5-cli php5-pgsql php5-mysql curl git -y --force-yes \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer \
    && a2enmod headers && a2enmod rewrite \
    && sed -i   -e 's/AllowOverride None/AllowOverride All/' \
                -e 's/ErrorLog ${APACHE_LOG_DIR}\/error.log/ErrorLog \/dev\/stderr/' /etc/apache2/apache2.conf \
    && sed -i   -e 's/ErrorLog ${APACHE_LOG_DIR}\/error.log/ErrorLog \/dev\/stderr/' /etc/apache2/sites-available/000-default.conf \
    && apt-get clean

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
