#!/bin/bash
# fecha revision   2025-05-06  13:01

/home/$USER/cloud-install/sh/ins_architecture.sh
/home/$USER/cloud-install/sh/ins_buckets.sh


/home/$USER/cloud-install/sh/ins_secrets.sh
if [ $? -eq 0 ]; then
    echo "ABORTANDO. Falla catastrofica con los secretos  kaggle.json  secrets.sh"
fi


/home/$USER/cloud-install/sh/ins_system.sh
/home/$USER/cloud-install/sh/ins_gnome.sh

/home/$USER/cloud-install/sh/ins_sysstat.sh
/home/$USER/cloud-install/sh/ins_expshared.sh
/home/$USER/cloud-install/sh/ins_datasets.sh

/home/$USER/cloud-install/sh/ins_rworld.sh
/home/$USER/cloud-install/sh/ins_python.sh
/home/$USER/cloud-install/sh/ins_julia.sh

/home/$USER/cloud-install/sh/ins_jupyterlab.sh
/home/$USER/cloud-install/sh/ins_kernels.sh

/home/$USER/cloud-install/sh/ins_memcpu.sh
/home/$USER/cloud-install/sh/ins_mlflow.sh
/home/$USER/cloud-install/sh/ins_cambiar_claves.sh




/home/$USER/cloud-install/sh/ins_gnome_apps.sh