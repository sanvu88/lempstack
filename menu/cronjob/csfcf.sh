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

CFINCLUDEFILE='/etc/nginx/extra/cloudflare.conf'

CFIPS=$(/usr/bin/curl https://www.cloudflare.com/ips-v4/)
CFIP6S=$(/usr/bin/curl https://www.cloudflare.com/ips-v6/)

# Config CSF Firewall
for ip in $CFIPS;
do
    if [[ "$(grep "$ip" /etc/csf/csf.allow >/dev/null 2>&1; echo $?)" = '1' ]] || [[ "$(grep "$ip" /etc/csf/csf.ignore >/dev/null 2>&1; echo $?)" = '1' ]]; then
        if [[ "$(ipcalc -c "$ip" >/dev/null 2>&1; echo $?)" -eq '0' ]]; then
            csf -a "$ip" cloudflare
            echo "$ip" >> /etc/csf/csf.ignore
        fi
    fi
done

if [[ "$(awk -F '= ' '/^IPV6 =/ {print $2}' /etc/csf/csf.conf | sed -e 's|\"||g')" = '1' ]]; then
	  for ip in $CFIP6S;
	  do
		    if [[ "$(grep "$ip" /etc/csf/csf.allow >/dev/null 2>&1; echo $?)" = '1' ]] || [[ "$(grep "$ip" /etc/csf/csf.ignore >/dev/null 2>&1; echo $?)" = '1' ]]; then
			      if [[ "$(ipcalc -c "$ip" >/dev/null 2>&1; echo $?)" -eq '0' ]]; then
				        csf -a "$ip" cloudflare
				        echo "$ip" >> /etc/csf/csf.ignore
			      fi
		    fi
	  done
fi

sed -i '/^ip/d' /etc/csf/csf.ignore

# Config Nginx
if [ -f "$CFINCLUDEFILE" ]; then
		cp -af "$CFINCLUDEFILE" "${CFINCLUDEFILE}.bak"
fi
echo > $CFINCLUDEFILE

for i in $CFIPS; do
    if [[ "$(ipcalc -c "$i" >/dev/null 2>&1; echo $?)" -eq '0' ]]; then
        echo "set_real_ip_from $i;" >> $CFINCLUDEFILE
    fi
done

if [[ -f /etc/sysconfig/network && "$(awk -F "=" '/NETWORKING_IPV6/ {print $2}' /etc/sysconfig/network | grep 'yes' >/dev/null 2>&1; echo $?)" = '0' ]]; then
		for i in $CFIP6S; do
        if [[ "$(ipcalc -c "$i" >/dev/null 2>&1; echo $?)" -eq '0' ]]; then
        		echo "set_real_ip_from $i;" >> $CFINCLUDEFILE
        fi
		done
else
		for i in $CFIP6S; do
        if [[ "$(ipcalc -c "$i" >/dev/null 2>&1; echo $?)" -eq '0' ]]; then
        		echo "#set_real_ip_from $i;" >> $CFINCLUDEFILE
        fi
		done
fi

echo "real_ip_header CF-Connecting-IP;" >> $CFINCLUDEFILE
if [[ "$(diff -u "${CFINCLUDEFILE}.bak" "$CFINCLUDEFILE" >/dev/null 2>&1; echo $?)" -ne '0' ]]; then
		service nginx reload >/dev/null 2>&1
fi
rm -rf "${CFINCLUDEFILE}.bak"