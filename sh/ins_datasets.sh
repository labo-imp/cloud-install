#!/bin/bash
# fecha revision   2025-05-06  13:01

logito="ins_datasets.txt"
# si ya corrio esta seccion, exit
[ -e "/home/$USER/log/$logito" ] && exit 0

# requiero que el system este instalado
[ ! -e "/home/$USER/log/ins_system.txt" ] && exit 1


source  /home/$USER/cloud-install/sh/common.sh

# copio pseudopublic  a list
cd  /home/$USER/install
wget  $webfiles/$pseudopublic  -O  list
chmod u+x  /home/$USER/install/list


mkdir  -p  /home/$USER/datasets
mkdir  -p  /home/$USER/buckets/b1/datasets
mkdir  -p  /home/$USER/buckets/b1/exp
mkdir  -p  /home/$USER/buckets/b1/log

cd  /home/$USER/buckets/b1/datasets
wget  $webfiles/"$dataset1"  -O  $dataset1
wget  $webfiles/"$dataset2"  -O  $dataset2
wget  $webfiles/"$dataset3"  -O  $dataset3
wget  $webfiles/"$dataset4"  -O  $dataset4

cp /home/$USER/buckets/b1/datasets/*   /home/$USER/datasets


cd

bitacora   "datasets"

# grabo
fecha=$(date +"%Y%m%d %H%M%S")
echo $fecha > /home/$USER/log/$logito
