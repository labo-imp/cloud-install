#!/bin/bash
# fecha revision   2025-05-06  13:01

logito="ins_system.txt"
# si ya corrio esta seccion, exit
[ -e "/home/$USER/log/$logito" ] && exit 1

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

# librerias necesarias para R, Python, Julia, JupyterLab, son mas de 700
sudo  DEBIAN_FRONTEND=noninteractive  apt-get --yes install  \
      libssl-dev  apt-utils                \
      libcurl4-openssl-dev  libxml2-dev    \
      libgeos-dev  libproj-dev             \
      libgdal-dev  librsvg2-dev            \
      ocl-icd-opencl-dev  libmagick++-dev  \
      libv8-dev  libsodium-dev             \
      libharfbuzz-dev  libfribidi-dev      \
      pandoc texlive  texlive-xetex        \
      texlive-fonts-recommended            \
      texlive-latex-recommended            \
      cmake  gdebi  curl  sshpass  nano    \
      htop  atop  iotop  iputils-ping      \
      cron  tmux  git-core  zip  unzip     \
      sysstat  smbclient cifs-utils  rsync \
      libudunits2-dev  inotify-tools       \
      libssh2-1-dev  libgit2-dev           \
      ffmpeg  gir1.2-gtop-2.0 lm-sensors   \
      libdbus-glib-1-dev libdbus-1-dev     \
      debconf-utils

bitacora   "system packages"

# grabo
fecha=$(date +"%Y%m%d %H%M%S")
echo $fecha > /home/$USER/log/$logito
