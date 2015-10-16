#! /bin/bash

apt-get -y update

logger "Installing Apache + PHP"

root_path="/var/www/html/";

apt-get -y install apache2 unzip
apt-get -y install php5 php5-fpm php5-cli php5-mysql php5-mcrypt php5-curl php5-gd
a2dismod mpm_prefork mpm_event
a2enmod rewrite actions alias proxy proxy_fcgi mpm_worker

mv /tmp/000-default.conf /etc/apache2/sites-available/000-default.conf
sed -i -e 's#listen = /var/run/php5-fpm.sock#listen = 9000#' /etc/php5/fpm/pool.d/www.conf
