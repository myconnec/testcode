#!/bin/bash

# $1 string env
# $2 string RND_STRING

echo "Sync'ing ConnecHub S3 buckets to localhost..."

aws s3 sync --profile connechub_${1} s3://connechub-configs ../s3_backup/connechub-configs
aws s3 sync --profile connechub_${1} s3://connechub-${1}-media-display-${2} ../s3_backup/connechub-${1}-media-display-${2}
aws s3 sync --profile connechub_${1} s3://connechub-${1}-media-source-${2} ../s3_backup/connechub-${1}-media-source-${2}
aws s3 sync --profile connechub_${1} s3://connechub-${1}-profile-display-${2} ../s3_backup/connechub-${1}-profile-display-${2}

echo '...done.'
