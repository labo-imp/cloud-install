#!/bin/bash
# fecha revision   2025-05-19  23:05

webfiles="https://storage.googleapis.com/open-courses/austral2025-af91/labo1r"

script_instalar2="instalar-ba02.sh"
script_final="final-ba.sh"
script_finalzzzz="final-zzzz-ba.sh"

dataset1="gerencial_competencia_2025.csv.gz"
dataset2="analistajr_competencia_2025.csv.gz"
dataset3="analistasr_competencia_2025.csv.gz"
dataset4="dataset_pequeno.csv"
pseudopublic="list"

export zulipbot="GoogleCloud-bot@austral2025.zulip.rebelare.com:01VXAC02ESF98VlImLjZIysfPtORMCsX"
export zulipurl="https://austral2025.zulip.rebelare.com/api/v1/messages"

kaggleprueba="102_kaggle_prueba-rosario.r"

kaggle_competencia="labo-i-2025-rosario"

export github_catedra_user="labo-imp"
export github_catedra_repo="labo2025ros"
export github_install_repo="cloud-install"

export mlflow_usuario="labo2025ros"
export mlflow_clave="constructivism"



tabulador="	"
logfile="/home/$USER/install/log_install.txt"

MIHOST=$(echo $HOSTNAME | /usr/bin/cut -d . -f1)

bitacora () {
  local fecha=$(date +"%Y%m%d %H%M%S")

  echo "$fecha""$tabulador""$1"  >>  "$logfile"
}
