#! /bin/bash

logger "Preparing PrestaShop ..."

# Downloading PrestaShop
wget "https://www.prestashop.com/download/old/prestashop_1.6.0.14.zip" -O prestashop.zip
unzip -q prestashop.zip
mv prestashop/* $root_path

cd $root_path
rm index.html
chown -R www-data:www-data $root_path;
chmod -R g+w $root_path;

logger "PrestaShop is ready to be installed !"
