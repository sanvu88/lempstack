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
                        if [[ ! -d "/home/backup/vps/${domain}" ]]; then
                            mkdir -p /home/backup/vps/"${domain}"
                        fi
                        rm -rf /home/backup/vps/"${domain}"/*
                        cd /home/backup/vps/"${domain}" || exit

                        mysqldump -uadmin -p"${mysql_pwd}" "${db_name}" > "${db_name}".sql

                        cd /home/"${user}"/"${domain}" || exit
                        tar -cpzvf /home/backup/vps/"${domain}"/"${domain}".tar.gz "${public}" \
                            --exclude "public_html/wp-content/cache" --exclude "public_html/storage/framework/cache" \
                            --exclude "public_html/storage/framework/view"
                    fi
                done
            fi
        done
    fi
done

rclone sync /home/backup/vps "${sftp_remote}":/home/backup/vps
rm -rf /home/backup/vps
