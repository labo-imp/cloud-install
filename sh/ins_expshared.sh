#!/bin/bash
# fecha revision   2025-05-06  13:01

logito="ins_expshared.txt"
# si ya corrio esta seccion, exit
[ -e "/home/$USER/log/$logito" ] && exit 1

# requiero que el system este instalado
[ ! -e "/home/$USER/log/ins_system.txt" ] && exit 1


source  /home/$USER/cloud-install/sh/common.sh

envsubst < /home/$USER/cloud-install/cfg/expshared_cred.txt   >   /home/$USER/install/expshared_cred.txt

envsubst < /home/$USER/cloud-install/unit/shareddirs.service   >   /home/$USER/install/shareddirs.service
sudo  cp   /home/$USER/install/shareddirs.service   /etc/systemd/system/
sudo  systemctl enable /etc/systemd/system/shareddirs.service
sudo  systemctl daemon-reload
sudo  systemctl start  shareddirs

# sudo systemctl status  shareddirs

bitacora   "expshared"

# grabo
fecha=$(date +"%Y%m%d %H%M%S")
echo $fecha > /home/$USER/log/$logito
