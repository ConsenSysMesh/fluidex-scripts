#!/bin/bash

if [ -z $1 ]; then
    echo "Missing username, please provide an username for the active-mq"
    echo "  e.g.: ./run-docker custom-username custom-password"
    exit 1
fi

if [ -z $2 ]; then
    echo "Missing password, please provide an password for the active-mq"
    echo "  e.g.: ./run-docker custom-username custom-password"
    exit 1
fi

echo "Starting active-mq container with user [$1] and password [$2]"

docker run \
  -e 'ACTIVEMQ_NAME=message-service' \
  -e 'ACTIVEMQ_REMOVE_DEFAULT_ACCOUNT=true' \
  -e "ACTIVEMQ_ADMIN_LOGIN=$1" \
  -e "ACTIVEMQ_ADMIN_PASSWORD=$2" \
  --name="fluidex-activemq" -p 8161:8161 -p 61616:61616 -p 61613:61613 -p 61614:61614 -it -d fluidex-activemq

