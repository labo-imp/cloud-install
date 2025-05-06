#!/bin/bash
# fecha revision   2025-05-06  13:01

logito="ins_rlang.txt"
# si ya corrio esta seccion, exit
[ -e "/home/$USER/log/$logito" ] && exit 1

# requiero que el system este instalado
[ ! -e "/home/$USER/log/ins_system.txt" ] && exit 1


source  /home/$USER/cloud-install/sh/common.sh

# instalar  R   version: 4.4.3 | released: 2025-02-28
# Documentacion  https://cran.r-project.org/

cd
R_LIBS_USER=/home/$USER/.local/lib/R/site-library
mkdir  -p $R_LIBS_USER

cat > /home/$USER/.Renviron  <<FILE
R_LIBS_USER=$R_LIBS_USER
FILE


# update indices
sudo apt update -qq
# install two helper packages we need
sudo  DEBIAN_FRONTEND=noninteractive  apt install --no-install-recommends software-properties-common dirmngr
# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
# Fingerprint: E298A3A825C0D65DFD57CBB651716619E084DAB9
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
sudo DEBIAN_FRONTEND=noninteractive add-apt-repository --yes "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

sudo DEBIAN_FRONTEND=noninteractive  apt install --yes --no-install-recommends r-base  r-base-dev  r-cran-devtools


bitacora   "rlang"

# grabo
fecha=$(date +"%Y%m%d %H%M%S")
echo $fecha > /home/$USER/log/$logito
