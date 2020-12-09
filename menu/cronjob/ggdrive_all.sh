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

for users in /home/*; do
    if [[ -d "${users}" ]]; then
        user=${users##*/}
        for domains in /home/"${user}"/*; do
            if [[ -d "${domains}" ]]; then
                domain=${domains##*/}
                for publics in /home/${user}/${domain}/public_html; do
                    if [[ -d "${publics}" ]]; then
                        public=${publics##*/}
                        #https://www.howtoforge.com/tutorial/linux-grep-command/
                        #https://stackoverflow.com/a/6284370
                        db_name=$(grep -w "db_name" "${USER_DIR}/.${domain}.conf" | cut -f2 -d'=')
                        if [[ ! -d "/home/backup/${CURRENT_DATE}/${domain}" ]]; then
                            mkdir -p /home/backup/"${CURRENT_DATE}"/"${domain}"
                        fi
                        rm -rf /home/backup/"${CURRENT_DATE}"/"${domain}"/*
                        cd /home/backup/"${CURRENT_DATE}"/"${domain}" || exit
                        mysqldump -uadmin -p"${mysql_pwd}" "${db_name}" | gzip > "${db_name}".sql.gz

                        cd /home/"${user}"/"${domain}" || exit
                        tar -cpzvf /home/backup/"${CURRENT_DATE}"/"${domain}"/"${domain}".tar.gz "${public}" \
                            --exclude "public_html/wp-content/cache" --exclude "public_html/storage/framework/cache" \
                            --exclude "public_html/storage/framework/view"

                        rclone copy /home/backup/"${CURRENT_DATE}"/"${domain}" "${remote}":"${IPADDRESS}" >> /var/log/rclone.log 2>&1
                        rm -rf /home/backup/"${CURRENT_DATE}"/"${domain}"
                    fi
                done
            fi
        done
    fi
done

rclone -q --min-age "${backup_num}"d delete "${remote}:$IPADDRESS" >> /var/log/rclone.log 2>&1
rclone -q --min-age "${backup_num}"d rmdirs "${remote}:$IPADDRESS" >> /var/log/rclone.log 2>&1
