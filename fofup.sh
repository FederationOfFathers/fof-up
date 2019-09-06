#!/bin/bash

MODE=$1
echo "mode: $MODE"

source ./setenv.sh # copy setenv.sh.example to setenv.sh and update

if [ -z "$MODE" ] || [ $MODE == "up" ]
then
    echo "starting up containers..."
    docker-compose up -d --force-recreate
fi


if [ $MODE == "config" ]
then
    echo "checking docker-compose configuration"
    docker-compose config
    exit 0
fi

if [ $MODE == "down" ]
then
    echo "spinning down"
    docker-compose down
    exit 0
fi


echo "done!"
