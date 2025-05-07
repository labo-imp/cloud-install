#!/bin/bash
# fecha revision   2025-05-06  13:01

logito="ins_kernels.txt"
# si ya corrio esta seccion, exit
[ -e "/home/$USER/log/$logito" ] && exit 1

# requiero que el system este instalado
[ ! -e "/home/$USER/log/ins_jupyterlab.txt" ] && exit 1

source  /home/$USER/cloud-install/sh/common.sh

# configuro R para que pueda usarse desde Jupyter, kernel de R
# Cuarta instalacion de paquetes de R
# Documentacion  https://developers.refinitiv.com/article/setup-jupyter-notebook-r


Rscript --verbose  /home/$USER/cloud-install/r/instalar_paquetes_4.r

bitacora   "R  kernel"
# Used  25G
#------------------------------------------------------------------------------
# Agrego el kernel de Julia a Jupyterlab

chmod  u+x      /home/$USER/cloud-install/jl/instalar_paquetes_julia_2.jl
/home/$USER/.juliaup/bin/julia   /home/$USER/cloud-install/jl/instalar_paquetes_julia_2.jl

bitacora   "Julia kernel"

bitacora   "kernels"

# grabo
fecha=$(date +"%Y%m%d %H%M%S")
echo $fecha > /home/$USER/log/$logito
