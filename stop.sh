#!/bin/bash

FILE=docker-compose.yml

for ARGUMENT in "$@"
do
    if [ "$ARGUMENT" = "clean" ]; then
        FILE=docker-compose-clean.yml
    fi
done

echo "============================================"
echo "Stopping docker-compose [${FILE}]"
echo ""

( export DOCKER_BUILDKIT=1; docker-compose -f ${FILE} down )

PIPE=`ps -ef | grep -v color | grep -v grep | grep pipe.sh | awk '{print $2}'`
if [[ ! -z $PIPE ]]; then
    kill -9 $PIPE
fi
rm -rf "$PWD/pipe/acme"

echo ""
echo "============================================"