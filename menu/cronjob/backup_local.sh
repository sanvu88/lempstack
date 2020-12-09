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
# shellcheck disable=SC1091
source /var/hostvn/hostvn.conf
# shellcheck disable=SC1091
source /var/hostvn/menu/helpers/variable_common

#https://www.howtoforge.com/tutorial/linux-grep-command/
#https://stackoverflow.com/a/6284370
backup_num=$(grep -w "backup_num" "${FILE_INFO}" | cut -f2 -d'=')

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
                    fi
                done
            fi
        done
    fi
done

find /home/backup -type d -mtime +"$backup_num" -exec rm -r {} \;

#old_backup=$(date -d "$backup_num days ago" +%Y-%m-%d)
#date1=$(echo "$old_backup"| cut -d'-' -f3)
#month1=$(echo "$old_backup" | cut -d'-' -f2)
#year1=$(echo "$old_backup" | cut -d'-' -f1)
#old_backup="$year1-$((10#$month1))-$((10#$date1))"
#
#for D in /home/backup/*; do
#    [[ -d "${D}" ]] || continue
#        folder=${D##*/}
#        date=$(echo "$folder"| cut -d'-' -f3)
#        month=$(echo "$folder" | cut -d'-' -f2)
#        year=$(echo "$folder" | cut -d'-' -f1)
#        folder1="$year-$((10#$month))-$((10#$date))"
#    if [[ ${old_backup} -gt ${folder1} ]]; then
#        rm -rf /home/backup/"${folder}"
#    fi
#done
