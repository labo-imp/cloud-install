#!/bin/bash
# fecha revision   2025-05-06  13:01

logito="ins_buckets.txt"
# si ya corrio esta seccion, exit
[ -e "/home/$USER/log/$logito" ] && exit 1

# requiero que architecture este instalado
[ ! -e "/home/$USER/log/ins_architecture.txt" ] && exit 1


source  /home/$USER/cloud-install/sh/common.sh

# instalo Google Cloud Fuse  para poder ver el bucket  Version:  2.4.2 | Released:2025-04-17
# Documentacion https://cloud.google.com/storage/docs/gcs-fuse?hl=en-419

gcsfusever="2.4.2"
gcsfusepack="gcsfuse_"$gcsfusever"_amd64.deb"
cd
curl  -L -O "https://github.com/GoogleCloudPlatform/gcsfuse/releases/download/v$gcsfusever/$gcsfusepack"
sudo  DEBIAN_FRONTEND=noninteractive  dpkg --install $gcsfusepack
rm   /home/$USER/$gcsfusepack


# Preparo para que puedan haber 9 buckets al mismo tiempo
mkdir  -p  /home/$USER/buckets
mkdir  -p  /home/$USER/buckets/b1
mkdir  -p  /home/$USER/buckets/b2
mkdir  -p  /home/$USER/buckets/b3
mkdir  -p  /home/$USER/buckets/b4
mkdir  -p  /home/$USER/buckets/b5
mkdir  -p  /home/$USER/buckets/b6
mkdir  -p  /home/$USER/buckets/b7
mkdir  -p  /home/$USER/buckets/b8
mkdir  -p  /home/$USER/buckets/b9


envsubst < /home/$USER/cloud-install/unit/buckets.service   >   /home/$USER/install/buckets.service


sudo  cp   /home/$USER/install/buckets.service   /etc/systemd/system/

sudo  systemctl daemon-reload

sudo  systemctl enable /etc/systemd/system/buckets.service
sudo  systemctl start  buckets

# systemctl status buckets

bitacora   "buckets"

# finalizo
systemctl is-active --quiet buckets.service
if [ $? -eq 0 ]; then
    echo "servicio buckets no esta funcionando"
    exit 1
else
  fecha=$(date +"%Y%m%d %H%M%S")
  echo $fecha > /home/$USER/log/$logito
  exit 0
fi

