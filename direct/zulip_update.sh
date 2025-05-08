#!/bin/bash

/usr/bin/curl -X PATCH $zulipurl/api/v1/messages/$1 \\
    -u $zulipbot \\
    --data-urlencode 'content= '"$2"'.'
