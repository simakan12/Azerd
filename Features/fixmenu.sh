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

cd /usr/bin
wget -O addtrojan "https://github.com/simakan12/Azerd/raw/ABSTRAK/Features/addtr2.sh"
wget -O addvmess "https://github.com/simakan12/Azerd/raw/ABSTRAK/Features/addvmess2.sh"
wget -O addvless "https://github.com/simakan12/Azerd/raw/ABSTRAK/Features/addvless2.sh"
wget -O deltr "https://github.com/simakan12/Azerd/raw/ABSTRAK/Features/deltr.sh"
wget -O deltrgrpc "https://github.com/simakan12/Azerd/raw/ABSTRAK/Features/deltrgrpc.sh"
wget -O delvmgrpc "https://github.com/simakan12/Azerd/raw/ABSTRAK/Features/delvmgrpc.sh"
wget -O delvlgrpc "https://github.com/simakan12/Azerd/raw/ABSTRAK/Features/delvlgrpc.sh"
wget -O deltrws "https://github.com/simakan12/Azerd/raw/ABSTRAK/Features/delws.sh"
wget -O delvmws "https://github.com/simakan12/Azerd/raw/ABSTRAK/Features/delvmess.sh"
wget -O delvlws "https://github.com/simakan12/Azerd/raw/ABSTRAK/Features/delvless.sh"
wget -O renewtr "https://github.com/simakan12/Azerd/raw/ABSTRAK/Features/renewtr.sh"
wget -O renewtrgrpc "https://github.com/simakan12/Azerd/raw/ABSTRAK/Features/renewtrgrpc.sh"
wget -O renewvmgrpc "https://github.com/simakan12/Azerd/raw/ABSTRAK/Features/renewvmgrpc.sh"
wget -O renewvlgrpc "https://github.com/simakan12/Azerd/raw/ABSTRAK/Features/renewvlgrpc.sh"
wget -O renewtrws "https://github.com/simakan12/Azerd/raw/ABSTRAK/Features/renewws.sh"
wget -O renewvmws "https://github.com/simakan12/Azerd/raw/ABSTRAK/Features/renewvmess.sh"
wget -O renewvlws "https://github.com/simakan12/Azerd/raw/ABSTRAK/Features/renewvless.sh"
wget -O xptr "https://github.com/simakan12/Azerd/raw/ABSTRAK/Features/xptr.sh"
wget -O xptrgrpc "https://github.com/simakan12/Azerd/raw/ABSTRAK/Features/xptrgrpc.sh"
wget -O xpvmgrpc "https://github.com/simakan12/Azerd/raw/ABSTRAK/Features/xpvmgrpc.sh"
wget -O xpvlgrpc "https://github.com/simakan12/Azerd/raw/ABSTRAK/Features/xpvlgrpc.sh"
wget -O xpws "https://github.com/simakan12/Azerd/raw/ABSTRAK/Features/xpws.sh"
wget -O xpvmws "https://github.com/simakan12/Azerd/raw/ABSTRAK/Features/xpvmess.sh"
wget -O xpvlws "https://github.com/simakan12/Azerd/raw/ABSTRAK/Features/xpvless.sh"
chmod +x addtrojan
chmod +x addvmess
chmod +x addvless
chmod +x deltr
chmod +x deltrgrpc
chmod +x delvmgrpc
chmod +x delvlgrpc
chmod +x deltrws
chmod +x delvmws 
chmod +x delvlws 
chmod +x renewtr 
chmod +x renewtrgrpc 
chmod +x renewvmgrpc 
chmod +x renewvlgrpc 
chmod +x renewtrws 
chmod +x renewvmws 
chmod +x renewvlws 
chmod +x xptr 
chmod +x xptrgrpc 
chmod +x xpvmgrpc 
chmod +x xpvlgrpc 
chmod +x xpws 
chmod +x xpvmws
chmod +x xpvlws
cd
rm -f fixmenu.sh
