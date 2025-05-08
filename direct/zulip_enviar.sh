#!/bin/bash

/usr/bin/curl -X POST $zulipurl \\
    -u $zulipbot \\
    --data-urlencode type=direct \\
    --data-urlencode 'to=email' \\
    --data-urlencode 'content= '"$1"'.'
