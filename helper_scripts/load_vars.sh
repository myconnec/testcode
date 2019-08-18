#!/bin/bash +xe

echo -e "Loading content of .env into ENV VARS...\n"

SOURCE="./.env"

if [ -f ${SOURCE} ]; then
  echo -e "${SOURCE} found, processing...\n"
  # set -o allexport; source ${SOURCE}; set +o allexport
  # source ${SOURCE}
  # maybe: export $(cat ${SOURCE} | xargs)
  cat ./.env | egrep -v "(^#.*|^$)" | while read -r line ; do
    echo $line
    export $line
  done

else
  echo -e "${SOURCE} NOT found, aborting...\n"
  exit 1
fi

echo -e "...done.\n"
