#!/bin/bash

# $1 string env
# $2 string RND_STRING
# $3 string SCOPE 'all', 'app', 'configs', 'cypress'

echo 'INFO: Starting...'

if [[ $3 == "" ]]
then
    echo "ERR: Please provide sync scope"
    exit 1
fi

echo "INFO: Sync'ing ConnecHub S3 buckets to localhost..."

if [[ $3 == 'all' ||  $3 == 'configs' ]]
then
    aws s3 sync --profile connechub_"${1}" s3://connechub-configs ../s3_backup/connechub-configs
fi

if [[ $3 == 'all' ||  $3 == 'cypress' ]]
then
    aws s3 sync --profile connechub_"${1}" s3://connechub-configs/cypress ../s3_backup/connechub-configs/cypress
fi

if [[ $3 == 'all' ||  $3 == 'app' ]]
then
    aws s3 sync --profile connechub_"${1}" s3://connechub-"${1}"-media-display-"${2}" ../s3_backup/connechub-"${1}"-media-display-"${2}"
    aws s3 sync --profile connechub_"${1}" s3://connechub-"${1}"-media-source-"${2}" ../s3_backup/connechub-"${1}"-media-source-"${2}"
    aws s3 sync --profile connechub_"${1}" s3://connechub-"${1}"-profile-display-"${2}" ../s3_backup/connechub-"${1}"-profile-display-"${2}"
fi

echo 'INFO: ...done.'
