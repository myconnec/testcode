#!/bin/bash

echo "Sync'ing ConnecHub S3 bukcets to localhost..."

aws s3 sync --profile connechub_prd s3://connechub-configs ../s3_backup/connechub-configs
aws s3 sync --profile connechub_prd s3://connechub-prd-media-display-32ml ../s3_backup/connechub-prd-media-display-32ml
aws s3 sync --profile connechub_prd s3://connechub-prd-media-source-32ml ../s3_backup/connechub-prd-media-source-32ml
aws s3 sync --profile connechub_prd s3://connechub-prd-profile-display-32ml ../s3_backup/connechub-prd-profile-display-32ml

echo '...done.'
