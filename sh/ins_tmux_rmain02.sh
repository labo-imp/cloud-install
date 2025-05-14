#!/bin/bash

gcloud compute ssh "$USER"@instance-instalacion \
    --zone=us-west4-c \
    --project="$myfirstproject" \
    -- bash -s < /home/$USER/cloud-install/sh/ins_tmux_main02.sh
