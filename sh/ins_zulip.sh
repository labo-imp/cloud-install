#!/bin/bash
# fecha revision   2025-05-06  13:01

logito="ins_zulip.txt"
# si ya corrio esta seccion, exit
[ -e "/home/$USER/log/$logito" ] && exit 0

# requiero que system este instalado
[ ! -e "/home/$USER/log/ins_system.txt" ] && exit 1


source  /home/$USER/cloud-install/sh/common.sh
source  /home/$USER/install/sh/secrets.sh

# cambio in-situ zulip_email es el del usuario
sed -i  's/email/'"$zulip_email"'/g'  /home/$USER/install/zulip_enviar.sh


bitacora   "zulip"

fecha=$(date +"%Y%m%d %H%M%S")
echo $fecha > /home/$USER/log/$logito
exit 0
