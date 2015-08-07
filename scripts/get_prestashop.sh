#! /bin/bash

logger "Downloading PrestaShop ..."

apt-get -y install wget

wget "https://www.prestashop.com/download/latest" -O prestashop.zip

logger "PrestaShop downloaded"
