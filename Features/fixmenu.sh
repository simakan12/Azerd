#!/bin/bash
sfile="wget https://github.com/simakan12/Azerd/raw/ABSTRAK/Features"
cd /usr/bin
wget -O addtrojan "$sfile/addtr2.sh"
wget -O addvmess "$sfile/addvmess2.sh"
wget -O addvless "$sfile/addvless2.sh"
wget -O deltr "$sfile/deltr.sh"
wget -O deltrgrpc "$sfile/deltrgrpc.sh"
wget -O delvmgrpc "$sfile/delvmgrpc.sh"
wget -O delvlgrpc "$sfile/delvlgrpc.sh"
wget -O deltrws "$sfile/delws.sh"
wget -O delvmws "$sfile/delvmess.sh"
wget -O delvlws "$sfile/delvless.sh"
wget -O renewtr "$sfile/renewtr.sh"
wget -O renewtrgrpc "$sfile/renewtrgrpc.sh"
wget -O renewvmgrpc "$sfile/renewvmgrpc.sh"
wget -O renewvlgrpc "$sfile/renewvlgrpc.sh"
wget -O renewtrws "$sfile/renewws.sh"
wget -O renewvmws "$sfile/renewvmess.sh"
wget -O renewvlws "$sfile/renewvless.sh"
wget -O xptr "$sfile/xptr.sh"
wget -O xptrgrpc "$sfile/xptrgrpc.sh"
wget -O xpvmgrpc "$sfile/xpvmgrpc.sh"
wget -O xpvlgrpc "$sfile/xpvlgrpc.sh"
wget -O xpws "$sfile/xpws.sh"
wget -O xpvmws "$sfile/xpvmess.sh"
wget -O xpvlws "$sfile/xpvless.sh"
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