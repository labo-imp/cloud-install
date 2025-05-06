#!/bin/bash
# fecha revision   2025-05-06  13:01

webfiles="https://storage.googleapis.com/open-courses/austral2025-af91"

script_instalar2="instalar-ba02.sh"
script_final="final-ba.sh"
script_finalzzzz="final-zzzz-ba.sh"

dataset1="labo1r/gerencial_competencia_2025.csv.gz"
dataset2="labo1r/analistajr_competencia_2025.csv.gz"
dataset3="labo1r/analistasr_competencia_2025.csv.gz"
dataset4="labo1r/dataset_pequeno.csv"
pseudopublic="list"

zulipbot="GoogleCloud-bot@austral2024.zulip.rebelare.com:01VXAC02ESF98VlImLjZIysfPtORMCsX"
zulipurl="https://austral2025.zulip.rebelare.com/api/v1/messages"

kaggleprueba="100_kaggle_prueba-ba.r"

github_user="labo-imp"
repo_name="labo2025ros"


export mlflow_usuario="labo2025ros"
export mlflow_clave="constructivism"



tabulador="	"
logfile="/home/$USER/install/log_install.txt"

MIHOST=$(echo $HOSTNAME | /usr/bin/cut -d . -f1)

bitacora () {
  local fecha=$(date +"%Y%m%d %H%M%S")

  echo "$fecha""$tabulador""$1"  >>  "$logfile"
}
