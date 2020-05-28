#!/bin/bash

echo "Sync'ing ConnecHub S3 bukcets to localhost."

aws s3 sync --profile connechub_prd s3://cf-templates-1wdaujvdhroai-us-west-2 ./cf-templates-1wdaujvdhroai-us-west-2
aws s3 sync --profile connechub_prd s3://connechub-configs ./connechub-configs
aws s3 sync --profile connechub_prd s3://connechub-media-resources ./connechub-media-resources
aws s3 sync --profile connechub_prd s3://connechub-prd-media-display-32ml ./connechub-prd-media-display-32ml
aws s3 sync --profile connechub_prd s3://connechub-prd-media-display-backup ./connechub-prd-media-display-backup
aws s3 sync --profile connechub_prd s3://connechub-prd-media-profile-backup ./connechub-prd-media-profile-backup
aws s3 sync --profile connechub_prd s3://connechub-prd-media-source-32ml ./connechub-prd-media-source-32ml
aws s3 sync --profile connechub_prd s3://connechub-prd-media-source-backup ./connechub-prd-media-source-backup
aws s3 sync --profile connechub_prd s3://connechub-prd-profile-display-32ml ./connechub-prd-profile-display-32ml
