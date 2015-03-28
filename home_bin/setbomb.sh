#!/bin/bash

if [ -z $1 ]; then
    echo 'error: no file'
    exit -1
fi


FILE=$1

vim $FILE << EOF
:set bomb
:wq
EOF

