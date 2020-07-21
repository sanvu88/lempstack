#!/bin/bash

#################################################
# Auto Install & Optimize LEMP Stack on CentOS 7#
# Version: 1.0                                  #
# Author: Sanvv - HOSTVN Technical              #
#                                               #
# Please don't remove copyright. Thank!         #
#################################################

for domains in "${WORDPRESS_CRON_DIR}"/* ; do
    if [ -f "${domains}" ]; then
        domain=${domains##*/}
        wget -q -O - http://"${domain}"/wp-cron.php?doing_wp_cron
    fi
done