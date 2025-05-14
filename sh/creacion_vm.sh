#!/bin/bash

# este script corre en Cloud Shell

sudo  DEBIAN_FRONTEND=noninteractive  apt-get update

rm -rf  /home/$USER/install
mkdir  -p  /home/$USER/install
mkdir  -p  /home/$USER/log

sudo  apt-get --yes  install  git rsync


github_catedra_user="labo-imp"
github_install_repo="cloud-install"

# clono el repo de instalacion
rm -rf /home/$USER/cloud-install
cd
git clone  https://github.com/"$github_catedra_user"/"$github_install_repo".git   cloud-install

# permisos de ejecucion
chmod u+x  /home/$USER/cloud-install/sh/*.sh
chmod u+x  /home/$USER/cloud-install/jl/*.jl
chmod u+x  /home/$USER/cloud-install/direct/*.sh

# despersonalizacion
cp /home/$USER/cloud-install/sh/common_austral.sh   /home/$USER/cloud-install/sh/common.sh
cp /home/$USER/cloud-install/sh/common.sh /home/$USER/install/

# copia de direct
cp /home/$USER/cloud-install/direct/*   /home/$USER/install/


source  /home/$USER/cloud-install/sh/common.sh
bitacora   "START  instalar.sh"

# tmux vim
/home/$USER/cloud-install/sh/ins_vimtmux.sh


# quitar cran para produccion
myfirstproject=$(gcloud projects list  --format='value(PROJECT_ID)' --filter=cran | head -1 )


# instance-instalacion creacion
gcloud compute instances create instance-instalacion \
    --project="$myfirstproject" \
    --zone=us-west4-c \
    --machine-type=e2-standard-4 \
    --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default \
    --no-restart-on-failure \
    --maintenance-policy=TERMINATE \
    --provisioning-model=SPOT \
    --instance-termination-action=STOP \
    --scopes=https://www.googleapis.com/auth/cloud-platform \
    --tags=http-server,https-server \
    --create-disk=auto-delete=yes,boot=yes,device-name=instance-instalacion,image=projects/ubuntu-os-cloud/global/images/ubuntu-minimal-2504-plucky-amd64-v20250430,mode=rw,size=64,type=pd-standard \
    --no-shielded-secure-boot \
    --shielded-vtpm \
    --shielded-integrity-monitoring \
    --labels=goog-ec-src=vm_add-gcloud \
    --reservation-affinity=any


#    --project=cranr001-150423 \


# verifico que existan buckets, sino creo el primero

mybuckets=$(/bin/gsutil ls )

if [ "$mybuckets" = "" ];
then
    printf "\nNo existen buckets, se creara uno \n\n"
    gcloud storage buckets create gs://"$USER"_bukito  --location=US
fi



sleep 10
gcloud compute ssh "$USER"@instance-instalacion --zone=us-west4-c -- bash -s < /home/$USER/cloud-install/sh/ins_main01.sh
