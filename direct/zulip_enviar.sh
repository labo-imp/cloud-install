#!/bin/bash

source /home/$USER/install/common.sh
source /home/$USER/install/secrets.sh

/usr/bin/curl -X POST $zulipurl \
    -u $zulipbot \
    --data-urlencode type=direct \
    --data-urlencode 'to='"$zulip_email"' \
    --data-urlencode 'content= '"$1"'.'
