#!/bin/bash

# $1 string env
# $2 string RND_STRING
# "${SCOPE}" string SCOPE 'all', 'app', 'configs', 'cypress'

ENV="${1}"
RND_STRING="${2}"
SCOPE="${3}"

echo 'INFO: Starting...'

if [[ ! "${SCOPE}" ]]
then
    echo "ERR: Please provide sync scope"
    exit 1
fi

echo "INFO: Sync'ing ConnecHub S3 buckets to localhost..."

if [[ "${SCOPE}" == 'all' ||  "${SCOPE}" == 'configs' ]]
then
    aws s3 sync --profile connechub_"${ENV}" s3://connechub-configs ../s3_backup/connechub-configs
fi

if [[ "${SCOPE}" == 'all' ||  "${SCOPE}" == 'cypress' ]]
then
    aws s3 sync --profile connechub_"${ENV}" s3://connechub-configs/cypress ../s3_backup/connechub-configs/cypress
fi

if [[ "${SCOPE}" == 'all' ||  "${SCOPE}" == 'app' ]]
then
    aws s3 sync --profile connechub_"${ENV}" s3://connechub-"${ENV}"-media-display-"${RND_STRING}" ../s3_backup/connechub-"${ENV}"-media-display-"${RND_STRING}"
    aws s3 sync --profile connechub_"${ENV}" s3://connechub-"${ENV}"-media-source-"${RND_STRING}" ../s3_backup/connechub-"${ENV}"-media-source-"${RND_STRING}"
    aws s3 sync --profile connechub_"${ENV}" s3://connechub-"${ENV}"-profile-display-"${RND_STRING}" ../s3_backup/connechub-"${ENV}"-profile-display-"${RND_STRING}"
fi

echo 'INFO: ...done.'
