#!/bin/bash
# fecha revision   2025-05-06  13:01

logito="ins_cambiar_claves.txt"
# si ya corrio esta seccion, exit
[ -e "/home/$USER/log/$logito" ] && exit 0

# requiero que el system este instalado
[ ! -e "/home/$USER/log/ins_jupyterlab.txt" ] && exit 1

source  /home/$USER/cloud-install/sh/common.sh

cp /home/$USER/cloud-install/r/startup_mlflow.r   /home/$USER/install
cp /home/$USER/cloud-install/r/shutdown_mlflow.r  /home/$USER/install
cp /home/$USER/cloud-install/r/alive_mlflow.r     /home/$USER/install

bitacora   "cambiar_claves"

# grabo
fecha=$(date +"%Y%m%d %H%M%S")
echo $fecha > /home/$USER/log/$logito
