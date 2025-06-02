#!/bin/bash
# fecha revision   2025-05-19  23:05

logito="ins_kaggle.txt"

# requiero que system este instalado
[ ! -e "/home/$USER/log/ins_system.txt" ] && exit 1
[ ! -e "/home/$USER/log/ins_secrets.txt" ] && exit 1
[ ! -e "/home/$USER/log/ins_pyworld_inicial.txt" ] && exit 1

source /home/$USER/.venv/bin/activate
R_LIBS_USER=/home/$USER/.local/lib/R/site-library
export R_LIBS_USER

Rscript --vanilla  /home/$USER/cloud-install/r/102_kaggle_prueba-rosario.r

fecha=$(date +"%Y%m%d %H%M%S")
echo $fecha > /home/$USER/log/$logito
exit 0
