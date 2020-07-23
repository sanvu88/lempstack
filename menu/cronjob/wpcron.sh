#!/bin/bash

######################################################################
#           Auto Install & Optimize LEMP Stack on CentOS 7, 8        #
#                                                                    #
#                Author: Sanvv - HOSTVN Technical                    #
#                  Website: https://hostvn.vn                        #
#                                                                    #
#              Please don't remove copyright. Thank!                 #
#   Please don't copy under any circumstance for commercial reason!  #
######################################################################

for domains in "${WORDPRESS_CRON_DIR}"/* ; do
    if [ -f "${domains}" ]; then
        domain=${domains##*/}
        #wget -q -O - http://"${domain}"/wp-cron.php?doing_wp_cron
        curl -I -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36" http://"${domain}"/wp-cron.php?doing_wp_cron
    fi
done