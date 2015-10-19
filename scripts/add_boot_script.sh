#! /bin/bash

logger "Add script at boot"

mv /tmp/prestashop_first_boot.sh /usr/local/bin/prestashop_first_boot.sh
chmod u+x /usr/local/bin/prestashop_first_boot.sh
sed -i -e 's#exit 0#/usr/local/bin/prestashop_first_boot.sh\nexit 0#' /etc/rc.local

logger "Script added"
