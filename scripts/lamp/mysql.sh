#! /bin/bash

apt-get -y update

logger "Installing MySQL"

export DEBIAN_FRONTEND=noninteractive

db_user=root
db_password=
db_name=prestashop

# Initialize components
echo mysql-server-5.6 mysql-server/root_password password $db_password | debconf-set-selections
echo mysql-server-5.6 mysql-server/root_password_again password $db_password | debconf-set-selections

apt-get -y install mysql-server-5.6

vm /tmp/mysql-azure.cnf /etc/mysql/conf.d/mysql-azure.cnf

if [ "$db_password" == "" ]; then
	mysqladmin -u$db_user create $db_name --force;
else
	mysqladmin -u$db_user -p$db_password create $db_name --force;
fi
