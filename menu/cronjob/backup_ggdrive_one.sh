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

# shellcheck disable=SC2154
source /var/hostvn/ipaddress
source /var/hostvn/hostvn.conf
source /var/hostvn/menu/helpers/variable_common

for domains in ${BASH_DIR}/ggdrive/*; do
    domain=$(echo $domains | cut -f5 -d'/')
    if [[ -f "${USER_DIR}/.${domain}.conf" ]]; then
        user=$(grep -w "username" "${USER_DIR}/.${domain}.conf" | cut -f2 -d'=')
        db_name=$(grep -w "db_name" "${USER_DIR}/.${domain}.conf" | cut -f2 -d'=')
        if [[ ! -d "/home/backup/${CURRENT_DATE}/${domain}" ]]; then
            mkdir -p /home/backup/"${CURRENT_DATE}"/"${domain}"
        fi
        rm -rf /home/backup/"${CURRENT_DATE}"/"${domain}"/*
        cd /home/backup/"${CURRENT_DATE}"/"${domain}" || exit
        mysqldump -uadmin -p"${mysql_pwd}" "${db_name}" | gzip > "${db_name}".sql.gz

        cd /home/"${user}"/"${domain}" || exit
        tar -cpzvf /home/backup/"${CURRENT_DATE}"/"${domain}"/"${domain}".tar.gz "public_html" \
                        --exclude "public_html/wp-content/cache" --exclude "public_html/storage/framework/cache" \
                        --exclude "public_html/storage/framework/view"
    fi
done

rclone copy /home/backup "${remote}":"${IPADDRESS}" >> /var/log/rclone.log 2>&1
rm -rf /home/backup/*
rclone -q --min-age "${backup_num}"d delete "${remote}:$IPADDRESS" >> /var/log/rclone.log 2>&1
rclone -q --min-age "${backup_num}"d rmdirs "${remote}:$IPADDRESS" >> /var/log/rclone.log 2>&1
