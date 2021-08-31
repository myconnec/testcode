#!/bin/bash

# source https://www.mariedrake.com/post/using-docker-to-run-your-cypress-tests
# source https://stackoverflow.com/questions/20796200/how-to-loop-over-files-in-directory-and-change-path-and-add-suffix-to-filename
# source https://unix.stackexchange.com/questions/344360/collect-exit-codes-of-parallel-background-processes-sub-shells
# source https://stackoverflow.com/questions/29568352/using-docker-compose-with-ci-how-to-deal-with-exit-codes-and-daemonized-linked

clear

APP_VERSION=2.0.0
AWS_PROFILE=connechub-dev
CYPRESS_SNAP_SOURCE=

export APP_VERSION
export AWS_PROFILE
export CYPRESS_SNAP_SOURCE
# -----

echo 'Checking for tools...'

echo "Setup started..."

echo "Ensure the Docker daemon is running and _docker login_ is successfully completed..."
if [[ ! $(docker login) ]]; then
    echo "You will need to run _docker login_ and auth first."
    # shellcheck disable=SC2116 disable=SC2046
    exit $(echo $?)
fi

if [[ ! $(docker images | grep cypress-test-image | grep $APP_VERSION) ]]; then
    echo "Building base image container..."
    docker build \
        -t cypress-test-image:"$APP_VERSION" \
        -t cypress-test-image:latest \
        -f helpers/Dockerfile \
        .
fi

echo "Resetting snapshot images..."
aws s3 sync "$CYPRESS_SNAP_SOURCE" ./cypress/snapshots/ --profile "$AWS_PROFILE"

if [[ -f ./cypress/cypress_tests.tmp ]]; then
    echo "Prev. Parallel procfile found, removing..."
    echo "" >./cypress/cypress_tests.tmp
fi

if [[ ! $(which parallel) ]]; then
    echo "Installing _parallel_ CLI tool..."
    sudo apt install -y parallel || true # debian systems
    sudo brew install parallel || true  # darwin systems
    sudo yum install -y parallel || true # centos systems
fi

echo "Generating new Parallel procfile..."
i=0
for filename in cypress/integration/*.js; do
    echo "Iteration $i for $filename"

    # shellcheck disable=SC2154
    echo "docker run \
    -v $(pwd)/cypress:/app/cypress \
    --name "cypress_$i" \
    --rm \
    cypress-test-image:$APP_VERSION \
    ./node_modules/cypress/bin/cypress run \
    --spec $filename" >> "./cypress/cypress_tests.tmp"

    i=$((i+1))
done

echo "Executing parallel Docker container tests..."
parallel \
--bar \
--halt now,fail=1 \
--max-procs 16 \
< "./cypress/cypress_tests.tmp"

if [[ $(echo $?) != 0 ]]; then
    echo "Something failed, stopping all other running containers..."
    docker stop "$(docker ps -a -q)"
fi

echo "Resetting file permissions due to Docker volume mounting..."
sudo chown -R "$(whoami)":"$(whoami)" ./cypress

echo "...done."
