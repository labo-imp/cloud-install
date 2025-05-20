#!/bin/bash
# fecha revision   2025-05-19  23:05

logito="ins_architecture.txt"
# si ya corrio esta seccion, exit
[ -e "/home/$USER/log/$logito" ] && exit 0

source  /home/$USER/cloud-install/sh/common.sh

# instalo Google Cloud SDK
# Documentacion  https://cloud.google.com/sdk/docs/install#deb

sudo  DEBIAN_FRONTEND=noninteractive  apt-get update
sudo  DEBIAN_FRONTEND=noninteractive  apt-get --yes install apt-transport-https ca-certificates gnupg
echo  "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl  https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo  DEBIAN_FRONTEND=noninteractive  apt-get update && sudo DEBIAN_FRONTEND=noninteractive  apt-get --yes install google-cloud-sdk

# arquitectura
sudo  DEBIAN_FRONTEND=noninteractive  apt-get update  && sudo dpkg --add-architecture  i386
sudo  DEBIAN_FRONTEND=noninteractive  apt-get --yes install  software-properties-common
sudo  DEBIAN_FRONTEND=noninteractive  apt-get --yes install  build-essential


bitacora   "architecture"

# grabo
fecha=$(date +"%Y%m%d %H%M%S")
echo $fecha > /home/$USER/log/$logito
