#!/bin/bash
# fecha revision   2025-05-06  13:01

logito="ins_memcpy.txt"
# si ya corrio esta seccion, exit
[ -e "/home/$USER/log/$logito" ] && exit 0

# requiero que el system este instalado
[ ! -e "/home/$USER/log/ins_system.txt" ] && exit 1

source  /home/$USER/cloud-install/sh/common.sh



rm /home/$USER/install/memcpu  /home/$USER/install/settimeout
gcc -Wall /home/$USER/cloud-install/c/memcpu.cpp   -o /home/$USER/install/memcpu `pkg-config --libs gio-2.0 --cflags`
gcc  /home/$USER/cloud-install/c/settimeout.cpp   -o /home/$USER/install/settimeout


cp /home/$USER/cloud-install/sh/memcpu.sh  /home/$USER/install/
cp /home/$USER/cloud-install/sh/settimeout.sh  /home/$USER/install/



envsubst < /home/$USER/cloud-install/unit/memcpu.service   >   /home/$USER/install/memcpu.service
sudo  cp   /home/$USER/install/memcpu.service   /etc/systemd/system/


sudo  systemctl enable /etc/systemd/system/memcpu.service
sudo  systemctl daemon-reload
# sudo  systemctl start  memcpu
# sudo  systemctl status  memcpu

bitacora   "memcpu"

# grabo
fecha=$(date +"%Y%m%d %H%M%S")
echo $fecha > /home/$USER/log/$logito
