#!/bin/bash
# fecha revision   2025-05-06  13:01

sudo  DEBIAN_FRONTEND=noninteractive  apt-get update

rm -rf  /home/$USER/install
mkdir  -p  /home/$USER/install
mkdir  -p  /home/$USER/log

sudo  apt-get --yes  install  git

repo="https://github.com/labo-imp/cloud-install"
github_user="labo-imp"
github_repo="cloud-install"


# clono el repo de instalacion
rm -rf /home/$USER/cloud-install
cd
git clone  https://github.com/"$github_user"/"$github_repo".git   cloud-install
chmod u+x  /home/$USER/cloud-install/sh/*.sh
chmod u+x  /home/$USER/cloud-install/jl/*.jl

chmod u+x  /home/$USER/cloud-install/direct/*.sh
cp /home/$USER/cloud-install/direct/*  ./cloud-install/
cp /home/$USER/cloud-install/sh/common_austral.sh   /home/$USER/cloud-install/sh/common.sh

source  /home/$USER/cloud-install/sh/common.sh
bitacora   "START  instalar.sh"

# tmux vim
/home/$USER/cloud-install/sh/ins_vimtmux.sh


# llamada dentro de tmux
tmux new -sinstalling '/home/$USER/cloud-install/sh/ins_main02.sh; exec $SHELL'

