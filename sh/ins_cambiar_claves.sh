#!/bin/bash
# fecha revision   2025-05-06  13:01

logito="ins_cambiar_claves.txt"
# si ya corrio esta seccion, exit
[ -e "/home/$USER/log/$logito" ] && exit 1

# requiero que el system este instalado
[ ! -e "/home/$USER/log/ins_jupyterlab.txt" ] && exit 1

source  /home/$USER/cloud-install/sh/common.sh

mv  /home/$USER/install/cambiar_claves.sh  /home/$USER/

bitacora   "cambiar_claves"

# grabo
fecha=$(date +"%Y%m%d %H%M%S")
echo $fecha > /home/$USER/log/$logito
