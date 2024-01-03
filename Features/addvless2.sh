#!/bin/bash
sfile="http://sg.warnetgrg.my.id:81/tohlol"

# Authentication
IPADDR=$( curl -s https://ipinfo.io/ip )
IP_REGIS=$( curl -s $sfile/data.txt | grep -w $IPADDR | awk '{print $1}' )
NAME_REGIS=$( curl -s $sfile/data.txt | grep -w $IPADDR | awk '{print $2}' )
EXP_REGIS=$( curl -s $sfile/data.txt | grep -w $IPADDR | awk '{print $3}' )

# Check IP Register
	clear
	sleep 0.5
	echo Checking IP
	sleep 0.5
	echo Done
if [[ $IPADDR == $IP_REGIS ]]; then
        export REGISTER='true'
else
        clear; echo "Mohon maaf, IP anda belum terdaftar !"; exit 1
fi

# Check Expired
waktu_sekarang=$(date -d "0 days" +"%Y-%m-%d");
expired_date="$EXP_REGIS"
now_in_s=$(date -d "$waktu_sekarang" +%s);
exp_in_s=$(date -d "$expired_date" +%s);
days_left=$(( ($exp_in_s - $now_in_s) / 86400 ));
if [[ $days_left -lt 0 ]]; then
        clear; echo "Mohon maaf, script telah expired silakan melakukan renew terlebih dahulu !"; exit 1
fi
clear
#source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /root/domain)
namatoko=$(cat /root/namatoko)
else
domain=$IP
fi
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
                read -rp "User: " -e user
                CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

                if [[ ${CLIENT_EXISTS} == '1' ]]; then
                        echo ""
                        echo "A client with the specified name was already created, please choose another name."
                        exit 1
                fi
        done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vless$/a\### '"Vless $user $exp"'\
},{"id": "'""$uuid""'","email": "'""vlessws-$user""'"' /etc/xray/config.json
sed -i '/#vless$/a\### '"Vless $user $exp"'\
},{"id": "'""$uuid""'","email": "'""vlessws-$user""'"' /etc/xray/none.json
sed -i '/#vlgrpc$/a\### '"Vlgrpc $user $exp"'\
},{"id": "'""$uuid""'","email": "'""vlessgrpc-$user""'"' /etc/xray/config.json
vlesslink1="vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&type=ws#${namatoko}-${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/vless&encryption=none&type=ws#${namatoko}-${user}"
vlesslink3="vless://${uuid}@${domain}:443?encryption=none&security=tls&type=grpc&host=${domain}&serviceName=Vless-GRPC#${namatoko}-${user}"
systemctl restart xray
systemctl restart xray@none
clear
echo -e ""
echo -e "=======-XRAY/VLESS======="
echo -e "Remarks: ${namatoko}-${user}"
echo -e "Domain: ${domain}"
echo -e "uuid: ${uuid}"
echo -e "Encryption: none"
echo -e "AllowInsecure: true"
echo -e "=======-PLUGIN WS TLS======="
echo -e "Port: 443"
echo -e "Network: ws"
echo -e "tls: true"
echo -e "path: /vless"
echo -e "alpn: http/1.1"
echo -e "=======-PLUGIN WS nonTLS======="
echo -e "Port: 80"
echo -e "Network: ws"
echo -e "tls: none"
echo -e "path: /vless"
echo -e "alpn: http/1.1"
echo -e "=======-PLUGIN GRPC TLS======="
echo -e "Port: 443"
echo -e "Network: grpc"
echo -e "tls: true"
echo -e "gRPC Mode: gun/multi"
echo -e "ServiceName: Vless-GRPC"
echo -e "alpn: h2"
echo -e "================================="
echo -e "VLess WS-TLS : ${vlesslink1}"
echo -e "================================="
echo -e "VLess WS-nonTLS : ${vlesslink2}"
echo -e "================================="
echo -e "VLess GRPC : ${vlesslink3}"
echo -e "================================="
echo -e "Expired On: $exp"
