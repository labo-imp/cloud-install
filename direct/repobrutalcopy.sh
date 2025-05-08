#!/bin/bash

source  /home/$USER/install/common.sh

MIHOST=$(echo $HOSTNAME | /usr/bin/cut -d . -f1)

cd  /home/$USER/$repo_name
git checkout  $MIHOST
rsync -a /home/$USER/$repo_name/   /home/$USER/buckets/b1/repos/$repo_name/  --delete-after


if [[ $MIHOST == "desktop-analistajr" ]]; then
  rsync -a /home/$USER/buckets/b1/   /home/$USER/buckets/b2/
fi

