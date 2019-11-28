#!/bin/bash

export $(grep -v '^#' .env | xargs)

export CYPRESS_baseUrl="https://${APP_ENV}.${APP_NAME}.com/"
