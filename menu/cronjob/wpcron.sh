#!/bin/bash

######################################################################
#           Auto Install & Optimize LEMP Stack on CentOS 7, 8        #
#                                                                    #
#                Author: Sanvv - HOSTVN Technical                    #
#                  Website: https://hostvn.vn                        #
#                                                                    #
#              Please do not remove copyright. Thank!                #
#  Please do not copy under any circumstance for commercial reason!  #
######################################################################

if [[ "$(ls -A /var/hostvn/wpcron)" ]]; then
   for domains in /var/hostvn/wpcron/* ; do
        domain=${domains##*/}
        wget -q -O - http://"${domain}"/wp-cron.php?doing_wp_cron >/dev/null 2>&1
    done
fi
