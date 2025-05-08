#!/bin/bash
# fecha revision   2025-05-06  13:01

# verifico el repo de la catedra
/home/$USER/cloud-install/sh/ins_common.sh
if [ ! $? -eq 0 ]; then
    echo "ABORTANDO. Falla catastrofica en common.sh"
    exit 1
fi


# lo minimo necesario antes de secrets
/home/$USER/cloud-install/sh/ins_architecture.sh
/home/$USER/cloud-install/sh/ins_buckets.sh
if [ ! $? -eq 0 ]; then
    echo "ABORTANDO. Falla catastrofica buckets NO esta funcionando"
    exit 1
fi


/home/$USER/cloud-install/sh/ins_secrets.sh
if [ ! $? -eq 0 ]; then
    echo "ABORTANDO. Falla catastrofica con los secretos  kaggle.json  secrets.sh"
    exit 1
fi


# instalacion pesada
/home/$USER/cloud-install/sh/ins_system.sh
/home/$USER/cloud-install/sh/ins_gnome.sh

# tonterias
/home/$USER/cloud-install/sh/ins_sysstat.sh
/home/$USER/cloud-install/sh/ins_expshared.sh
/home/$USER/cloud-install/sh/ins_datasets.sh

# los lenguajes y sus paquetes
/home/$USER/cloud-install/sh/ins_pyworld.sh
/home/$USER/cloud-install/sh/ins_rworld.sh
/home/$USER/cloud-install/sh/ins_jlworld.sh

/home/$USER/cloud-install/sh/ins_jupyterlab.sh
/home/$USER/cloud-install/sh/ins_kernels.sh


# utilidades
/home/$USER/cloud-install/sh/ins_memcpu.sh
/home/$USER/cloud-install/sh/ins_mlflow.sh
/home/$USER/cloud-install/sh/ins_cambiar_claves.sh


/home/$USER/cloud-install/sh/ins_zulip.sh
/home/$USER/cloud-install/sh/ins_kaggle.sh

/home/$USER/cloud-install/sh/ins_gnome_apps.sh