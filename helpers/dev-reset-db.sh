#!/bin/bash

source ./helpers/.env

if [[ $DB_HOST ]]; then
    echo 'Importing ./db/sql/database.sql to baseline database...'
    mysql -u $DB_USER -p$DB_PASS -h $DB_HOST < ./db/sql/database.sql
fi

echo "...done."
