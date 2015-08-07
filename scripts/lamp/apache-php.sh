#! /bin/bash

apt-get -y update

logger "Installing Apache + PHP"

root_path="/var/www/html/";

apt-get -y install apache2 php5 php5-mysql php5-mcrypt php5-curl php5-gd unzip
a2enmod rewrite
