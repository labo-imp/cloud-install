#!/bin/bash
# fecha revision   2025-05-06  13:01

logito="ins_rstudio.txt"
# si ya corrio esta seccion, exit
[ -e "/home/$USER/log/$logito" ] && exit 1

# requiero que el system este instalado
[ ! -e "/home/$USER/log/ins_system.txt" ] && exit 1


source  /home/$USER/cloud-install/sh/common.sh

# Instalo RStudio Server    Version:  2024.12.1 | Released:  2025-02-13-------------
# Documentacion  https://rstudio.com/products/rstudio/download-server/debian-ubuntu/

cd
rstudiopack="rstudio-server-2024.12.1-563-amd64.deb"


wget  https://download2.rstudio.org/server/jammy/amd64/"$rstudiopack"


sudo  DEBIAN_FRONTEND=noninteractive  gdebi -n $rstudiopack
rm    $rstudiopack


# cambio el puerto del Rstudio Server al 80 para que se pueda acceder en aulas de universidades detras de firewalls
# Documentacion  https://support.rstudio.com/hc/en-us/articles/200552316-Configuring-the-Server
echo "www-port=80" | sudo tee -a /etc/rstudio/rserver.conf
echo "auth-timeout-minutes=0" | sudo tee -a /etc/rstudio/rserver.conf
echo "auth-stay-signed-in-days=30" | sudo tee -a /etc/rstudio/rserver.conf

echo "session-timeout-minutes=0" | sudo tee -a /etc/rstudio/rsession.conf 
sudo  rstudio-server restart

# rstudio-server status


gcloud compute firewall-rules create rstudio --allow tcp:80  --source-tags=instance-instalacion --source-ranges=0.0.0.0/0 --description="rstudio"


bitacora   "rstudio"

# grabo
fecha=$(date +"%Y%m%d %H%M%S")
echo $fecha > /home/$USER/log/$logito
