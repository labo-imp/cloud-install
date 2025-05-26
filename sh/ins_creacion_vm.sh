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
# myfirstproject=$(gcloud projects list  --format='value(PROJECT_ID)' --filter=cran | head -1 )  # filtrado
gcloud projects create proj-labo1  --enable-cloud-apis
gcloud config set project proj-labo1
gcloud services enable compute.googleapis.com


myfirstproject=$(gcloud projects list  --format='value(PROJECT_ID)' | head -1 )  # sin filtrar

myserviceaccount=$(gcloud iam service-accounts list --format='value(EMAIL)' | head -1)
 
# instance-instalacion STANDARD creacion
gcloud compute instances create instance-instalacion \
    --project="$myfirstproject" \
    --zone=us-west4-c \
    --machine-type=t2d-standard-4 \
    --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default \
    --maintenance-policy=MIGRATE \
    --provisioning-model=STANDARD \
    --service-account="$myserviceaccount" \
    --scopes=https://www.googleapis.com/auth/cloud-platform \
    --tags=https-server,http-server \
    --create-disk=auto-delete=yes,boot=yes,device-name=instance-instalacion,image=projects/ubuntu-os-cloud/global/images/ubuntu-minimal-2504-plucky-amd64-v20250430,mode=rw,size=48,type=pd-balanced \
    --no-shielded-secure-boot \
    --shielded-vtpm \
    --shielded-integrity-monitoring \
    --labels=goog-ec-src=vm_add-gcloud \
    --reservation-affinity=any


# verifico que existan buckets, sino creo el primero

myfirstproject=$(gcloud projects list  --format='value(PROJECT_ID)' --filter=cran | head -1 )
gcloud config set project $myfirstproject

mybuckets=$(/bin/gsutil ls)

if [ "$mybuckets" = "" ];
then
    printf "\nNo existen buckets, se creara uno \n\n"
    gcloud storage buckets create gs://"$USER"_bukito  --location=US
fi


echo
echo "Esperando 40 segundos a que se inicie  instance-instalacion"
sleep 40


myfirstproject=$(gcloud projects list  --format='value(PROJECT_ID)' --filter=cran | head -1 )
gcloud compute ssh "$USER"@instance-instalacion \
    --zone=us-west4-c \
    --project="$myfirstproject" \
    -- bash -s < /home/$USER/cloud-install/sh/ins_main01.sh 

