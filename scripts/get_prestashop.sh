#! /bin/bash

if [ "$ENV_REQUEST" == "nginx" ]; then
	root_path="/usr/share/nginx/www/";
else
	root_path="/var/www/html/";
fi

logger "Preparing PrestaShop ..."

# Downloading PrestaShop
wget "https://www.prestashop.com/download/old/prestashop_1.6.0.14.zip" -O prestashop.zip

unzip -q prestashop.zip
mv prestashop/* $root_path

rmdir prestashop
rm prestashop.zip
cd $root_path
rm index.html

chown -R www-data:www-data $root_path;
chmod -R g+w $root_path;

logger "PrestaShop is ready to be installed !"
