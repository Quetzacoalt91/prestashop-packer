#! /bin/bash

which apache2 > /dev/null
 if [ $? != 0 ]; then
 	root_path="/usr/share/nginx/www/";
 else
 	root_path="/var/www/html/";
 fi

FLAG="/var/log/prestashop_init.log"
if [ ! -f $FLAG ]; then

    logger "Downloading PrestaShop ..."

    wget "https://www.prestashop.com/download/latest" -O /tmp/prestashop.zip
     if [ $? = 0 ]; then

        logger "PrestaShop downloaded sucessfully"
        rm -rf $root_path*

        logger "Preparing PrestaShop ..."

        unzip -q /tmp/prestashop.zip -d /tmp
        mv /tmp/prestashop/* $root_path

        rmdir /tmp/prestashop
        rm /tmp/prestashop.zip
        cd $root_path
        rm index.html

        chown -R www-data:www-data $root_path;
        chmod -R g+w $root_path;

        logger "PrestaShop is ready to be installed !"
    fi

    touch $FLAG
fi
