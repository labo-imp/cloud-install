#!/bin/bash

source  /home/$USER/install/common.sh

if [ ! -d /home/$USER/$github_catedra_repo ]; then
    echo "Error Fatal : No existe la carpeta del repositorio /home/$USER/$github_catedra_repo"
    exit
fi

if [ ! -d /home/$USER/$github_catedra_repo/src ]; then
    echo "Error Fatal : No existe la carpeta  del repositorio  /home/$USER/$github_catedra_repo/src"
    exit
fi


if [ ! -d /home/$USER/$github_catedra_repo/src/rpart ]; then
    echo "Error Fatal : No existe la carpeta  del repositorio  /home/$USER/$github_catedra_repo/src/rpart"
    exit
fi

if [ ! -f /home/$USER/$github_catedra_repo/src/rpart/z101_PrimerModelo.R ]; then
    echo "Error Fatal : No existe el archivo  /home/$USER/$github_catedra_repo/src/rpart/z101_PrimerModelo.R"
    exit
fi


cd /home/$USER/$github_catedra_repo/

git rev-parse
if [ ! $? -eq 0 ]; then 
  echo "Error Fatal: git rev-parse fallo"
  exit
fi

git status
if [ ! $? -eq 0 ]; then 
  echo "Error Fatal: git status fallo"
  exit
fi

git branch --all
if [ ! $? -eq 0 ]; then 
  echo "Error Fatal: git branch -all  fallo"
  exit
fi

git rev-parse --verify   main
if [ ! $? -eq 0 ]; then 
  echo "Error Fatal: No existe branch  main"
  exit
fi

git rev-parse --verify   origin/main
if [ ! $? -eq 0 ]; then 
  echo "Error Fatal: No existe branch  origin/main"
  exit
fi

# git rev-parse --verify   instance-instalacion
# if [ ! $? -eq 0 ]; then 
#  echo "Error Fatal: No existe instance-instalacion"
#  exit
#fi


git ls-remote --exit-code --heads origin  main
if [ ! $? -eq 0 ]; then 
  echo "Error Fatal: No existe main en remote"
  exit
fi

git ls-remote --exit-code --heads origin  catedra
if [ ! $? -eq 0 ]; then 
  echo "Error Fatal: No existe catedra en remote"
  exit
fi

# git ls-remote --exit-code --heads origin  instance-instalacion
# if [ ! $? -eq 0 ]; then 
#  echo "Error Fatal: No existe instance-instalacion en remote"
#  exit
# fi


git fetch upstream
if [ ! $? -eq 0 ]; then 
  echo "Error Fatal: Fallo  git fetch upstream"
  exit
fi


if [ ! -f /home/$USER/install/100_kaggle_prueba.r ]; then
    echo "Error : No existe el archivo  /home/$USER/install/100_kaggle_prueba.r"
    exit
fi

cp /home/$USER/install/100_kaggle_prueba.r  /home/$USER/$github_catedra_repo/src/rpart
if [ ! $? -eq 0 ]; then 
  echo "Error : No se pudo copiar /home/$USER/install/100_kaggle_prueba.r"
  exit
fi

cd /home/$USER/$github_catedra_repo/

MIHOST=\$(echo \$HOSTNAME | /usr/bin/cut -d . -f1)

git checkout catedra
if [ ! $? -eq 0 ]; then 
  echo "Fatal Error : git checkout catedra"
  exit
fi

git pull origin catedra
if [ ! $? -eq 0 ]; then 
  echo "Fatal Error : git pull origin catedra"
  exit
fi

git fetch upstream
if [ ! $? -eq 0 ]; then 
  echo "Fatal Error : git fetch upstream"
  exit
fi

git merge  -X theirs   upstream/main  -m "sync upstream/main to catedra"
if [ ! $? -eq 0 ]; then 
  echo "Fatal Error : git merge  -X theirs   upstream/main  -m 'sync upstream/main to catedra' "
  exit
fi

git push  origin  catedra
if [ ! $? -eq 0 ]; then 
  echo "Fatal Error : git push  origin  catedra "
  exit
fi

#--------

git checkout main
if [ ! $? -eq 0 ]; then 
  echo "Fatal Error : git checkout main"
  exit
fi

git pull origin main
if [ ! $? -eq 0 ]; then 
  echo "Fatal Error : git pull origin main"
  exit
fi

git merge  -X theirs  catedra   -m "catedra domina a main"
if [ ! $? -eq 0 ]; then 
  echo "Fatal Error : git merge  -X theirs  catedra   -m 'catedra domina a main'"
  exit
fi

git push --set-upstream origin  main
if [ ! $? -eq 0 ]; then 
  echo "Fatal Error : git push --set-upstream origin  main"
  exit
fi

git checkout main
if [ ! $? -eq 0 ]; then 
  echo "Fatal Error : git checkout main"
  exit
fi


# activo el branch
git checkout \$MIHOST
if [ ! $? -eq 0 ]; then 
  echo "Fatal Error : git checkout \$MIHOST"
  exit
fi

git pull origin \$MIHOST
if [ ! $? -eq 0 ]; then 
  echo "Fatal Error : git pull origin \$MIHOST"
  exit
fi

git merge  -X theirs  catedra   -m "catedra domina  a MIHOST"
if [ ! $? -eq 0 ]; then 
  echo "Fatal Error : git merge  -X theirs  catedra   -m 'catedra domina  a MIHOST'"
  exit
fi

git merge  -X ours    main      -m "MIHOST domina  a main"
if [ ! $? -eq 0 ]; then 
  echo "Fatal Error : git merge  -X ours    main      -m 'MIHOST domina  a main'"
  exit
fi

git push  origin  \$MIHOST
if [ ! $? -eq 0 ]; then 
  echo "Fatal Error : git push  origin  \$MIHOST"
  exit
fi

git checkout main

git merge  -X theirs  \$MIHOST   -m "MIHOST domina  a main"
if [ ! $? -eq 0 ]; then 
  echo "Fatal Error : git merge  -X theirs  \$MIHOST   -m 'MIHOST domina  a main'"
  exit
fi

git push  origin  main
if [ ! $? -eq 0 ]; then 
  echo "Fatal Error : git push  origin  main"
  exit
fi


# cargo lo nuevo
git checkout \$MIHOST
git add /home/$USER/$github_catedra_repo/src/rpart/100_kaggle_prueba.r
if [ ! $? -eq 0 ]; then 
  echo "Fatal Error : git add /home/$USER/$github_catedra_repo/src/rpart/100_kaggle_prueba.r"
  exit
fi

git commit -m "rpart/100_kaggle_prueba.r"
if [ ! $? -eq 0 ]; then 
  echo "Fatal Error : git commit -m 'rpart/100_kaggle_prueba.r'"
  exit
fi

git push   origin  \$MIHOST
git checkout main
git merge  -X theirs  \$MIHOST   -m "MIHOST domina  a main"
if [ ! $? -eq 0 ]; then 
  echo "Fatal Error : git merge  -X theirs  \$MIHOST   -m 'MIHOST domina  a main'"
  exit
fi

git push  origin  main
if [ ! $? -eq 0 ]; then 
  echo "Fatal Error : git push  origin  main"
  exit
fi

git checkout \$MIHOST


echo
echo  repositorio OK

