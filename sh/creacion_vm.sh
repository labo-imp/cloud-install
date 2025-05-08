#!/bin/bash

gcloud compute instances create instance-instalacion \
    --project=cranr001-150423 \
    --zone=us-west4-c \
    --machine-type=e2-standard-4 \
    --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default \
    --no-restart-on-failure \
    --maintenance-policy=TERMINATE \
    --provisioning-model=SPOT \
    --instance-termination-action=STOP \
    --scopes=https://www.googleapis.com/auth/cloud-platform \
    --tags=http-server,https-server \
    --create-disk=auto-delete=yes,boot=yes,device-name=instance-instalacion,image=projects/ubuntu-os-cloud/global/images/ubuntu-minimal-2504-plucky-amd64-v20250430,mode=rw,size=32,type=pd-standard \
    --no-shielded-secure-boot \
    --shielded-vtpm \
    --shielded-integrity-monitoring \
    --labels=goog-ec-src=vm_add-gcloud \
    --reservation-affinity=any

# verifico que existan buckets

mybuckets=$(/bin/gsutil ls )

if [ "$mybuckets" = "" ];
then
    printf "\nNo existen buckets, se creara uno \n\n"
    gcloud storage buckets create gs://"$USER"_bucket  --location=US
fi


#    --project=cranr001-150423 \
#    --service-account=109985757264-compute@developer.gserviceaccount.com \


gcloud compute ssh "$USER"@instance-instalacion --zone=us-west4-c -- bash -s < a.sh