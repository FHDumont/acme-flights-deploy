#!/bin/bash

FILE=docker-compose.yml
PULL=false
BUILD=false

for ARGUMENT in "$@"
do
    if [ "$ARGUMENT" = "clean" ]; then
        FILE=docker-compose-clean.yml
    elif [ "$ARGUMENT" = "--pull" ]; then
        PULL=true
    elif [ "$ARGUMENT" = "--build" ]; then
        BUILD=true
    fi
done

echo "============================================"
echo "Starting docker-compose [${FILE}]"
echo ""

PIPE=`ps -ef | grep -v color | grep -v grep | grep pipe.sh | awk '{print $2}'`
if [[ ! -z $PIPE ]]; then
    kill -9 $PIPE
fi
./pipe.sh &

if [ $PULL == true ];then
    ( export DOCKER_BUILDKIT=1; export HOSTNAME=`hostname`; docker-compose -f ${FILE} pull )
fi

if [ $BUILD == true ];then
    ( export DOCKER_BUILDKIT=1; export HOSTNAME=`hostname`; docker-compose -f ${FILE} build )
fi


( export DOCKER_BUILDKIT=1; export HOSTNAME=`hostname`; docker-compose -f ${FILE} up -d )
echo ""
echo "============================================"