#! /bin/bash

apt-get -y update

logger "Installing PrestaShop"

db_user=root
db_password=grolol
db_name=prestashop

root_path="/var/www/html/";

# Initialize components
echo mysql-server-5.6 mysql-server/root_password password $db_password | debconf-set-selections
echo mysql-server-5.6 mysql-server/root_password_again password $db_password | debconf-set-selections

apt-get -y install apache2 mysql-server php5 php5-mysql php5-mcrypt php5-curl php5-gd unzip

mysqladmin -u$db_user -p$db_password create $db_name --force;