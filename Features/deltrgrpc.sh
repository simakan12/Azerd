#!/bin/bash
NUMBER_OF_CLIENTS=$(grep -c -E "^### Trgrpc" "/etc/xray/config.json")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
                echo ""
                echo "You have no existing clients!"
                exit 1
        fi

        clear
        echo ""
        echo " Select the existing client you want to remove"
        echo " Press CTRL+C to return"
        echo " ==============================="
        echo "     No  Expired   User"
        grep -E "^### Trgrpc " "/etc/xray/config.json" | cut -d ' ' -f 3-4 | nl -s ') '
        until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
                if [[ ${CLIENT_NUMBER} == '1' ]]; then
                        read -rp "Select one client [1]: " CLIENT_NUMBER
                else
                        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
                fi
        done
user=$(grep -E "^### Trgrpc " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### Trgrpc " "/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### Trgrpc $user $exp/,/^},{/d" /etc/xray/config.json
systemctl restart xray
clear
echo " Akun berhasil dihapus"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp"
echo " =========================="

