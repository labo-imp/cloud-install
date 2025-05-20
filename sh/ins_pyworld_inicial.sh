#!/bin/bash
# fecha revision   2025-05-19  23:05

logito="ins_pyworld_inicial.txt"
# si ya corrio esta seccion, exit
[ -e "/home/$USER/log/$logito" ] && exit 0

# requiero que el system este instalado
[ ! -e "/home/$USER/log/ins_system.txt" ] && exit 1


source  /home/$USER/cloud-install/sh/common.sh

# Instalo Python SIN  Anaconda, Miniconda, etc-------------------------------
# Documentacion  https://docs.python-guide.org/starting/install3/linux/

export PATH="$PATH:/home/$USER/.local/bin"
echo  "export PATH=/home/\$USER/.local/bin:\$PATH"  >>  /home/$USER/.bashrc
chmod u+x /home/$USER/.bashrc
source /home/$USER/.bashrc 


sudo  apt-get update
sudo  DEBIAN_FRONTEND=noninteractive  apt-get --yes install \
        python3  python3-pip  python3-dev  ipython3  python3.13-venv


python3  /home/$USER/cloud-install/py/test_python.py  /home/$USER/log/ins_python.txt


[ ! -e "/home/$USER/log/ins_python.txt" ] && exit 1

# creo el Virtual Environment
cd
python3 -m venv .venv
source  /home/$USER/.venv/bin/activate

# actualizo  pip
pip3 install --upgrade pip
pip3 install setuptools

bitacora   "Python"

# instalo paquetes iniciales de Python
pip3 install  kaggle  zulip

bitacora   "python packages"

# grabo
fecha=$(date +"%Y%m%d %H%M%S")
echo $fecha > /home/$USER/log/$logito
