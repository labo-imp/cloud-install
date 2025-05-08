#!/bin/bash
# fecha revision   2025-05-06  13:01

logito="ins_secrets.txt"
# si ya corrio esta seccion, exit
[ -e "/home/$USER/log/$logito" ] && exit 1


# requiero que buckets este instalado
[ ! -e "/home/$USER/log/ins_buckets.txt" ] && exit 1


source  /home/$USER/cloud-install/sh/common.sh

# multiples verificaciones

if [ ! -d /home/$USER/install ]; then
    echo "Error Fatal : No existe la carpeta  /home/$USER/install"
    exit 1
fi

if [ ! -d /home/$USER/buckets ]; then
    echo "Error Fatal : No existe la carpeta  /home/$USER/buckets"
    exit 1
fi

if [ ! -d /home/$USER/buckets/b1 ]; then
    echo "Error Fatal : No existe la carpeta  /home/$USER/buckets/b1"
    exit 1
fi


if [ ! -f /home/$USER/buckets/b1/kaggle.json ]; then
    echo "Error Fatal : No existe el archivo  /home/$USER/buckets/b1/kaggle.json"
    exit 1
fi

if [ ! -f /home/$USER/buckets/b1/secrets.sh ]; then
    echo "Error Fatal : No existe el archivo  /home/$USER/buckets/b1/secrets.sh"
    exit 1
fi



# verificacion de los parametros de secrets.sh
if ! grep -q zulip_email /home/$USER/buckets/b1/secrets.sh; then
    echo "Error Fatal : el archivo secrets.sh no tiene el parametro  zulip_email"
    exit 1
fi

if ! grep -q github_usuario /home/$USER/buckets/b1/secrets.sh; then
    echo "Error Fatal : el archivo secrets.sh no tiene el parametro  github_usuario"
    exit 1
fi

if ! grep -q github_token /home/$USER/buckets/b1/secrets.sh; then
    echo "Error Fatal : el archivo secrets.sh no tiene el parametro  github_token"
    exit 1
fi

if ! grep -q github_email /home/$USER/buckets/b1/secrets.sh; then
    echo "Error Fatal : el archivo secrets.sh no tiene el parametro  github_email"
    exit 1
fi

if ! grep -q github_nombre /home/$USER/buckets/b1/secrets.sh; then
    echo "Error Fatal : el archivo secrets.sh no tiene el parametro  github_nombre"
    exit 1
fi




rm -rf /home/$USER/.kaggle
mkdir -p /home/$USER/.kaggle
cp  /home/$USER/buckets/b1/kaggle.json   /home/$USER/.kaggle/
chmod 600 /home/$USER/.kaggle/kaggle.json


cp  /home/$USER/buckets/b1/secrets.sh   /home/$USER/install/
chmod u+x  /home/$USER/install/secrets.sh




# grabo
fecha=$(date +"%Y%m%d %H%M%S")
echo $fecha > /home/$USER/log/$logito

exit 0