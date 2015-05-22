#! /bin/bash

apt-get -y update

logger "Installing packages"

export DEBIAN_FRONTEND=noninteractive

db_user=root
db_password=
db_name=prestashop

root_path="/var/www/html/";

# Initialize components
echo mysql-server-5.6 mysql-server/root_password password $db_password | debconf-set-selections
echo mysql-server-5.6 mysql-server/root_password_again password $db_password | debconf-set-selections

apt-get -y install apache2 mysql-server php5 php5-mysql php5-mcrypt php5-curl php5-gd unzip

if [ "$db_password" == "" ]; then
	mysqladmin -u$db_user create $db_name --force;
else
	mysqladmin -u$db_user -p$db_password create $db_name --force;
fi
