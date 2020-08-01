#!/bin/bash 

# source https://www.mariedrake.com/post/using-docker-to-run-your-cypress-tests
# source https://stackoverflow.com/questions/20796200/how-to-loop-over-files-in-directory-and-change-path-and-add-suffix-to-filename
# source https://unix.stackexchange.com/questions/344360/collect-exit-codes-of-parallel-background-processes-sub-shells
# source https://stackoverflow.com/questions/29568352/using-docker-compose-with-ci-how-to-deal-with-exit-codes-and-daemonized-linked
# source

export AWS_PROFILE='connechub_dev'

export CYPRESS_abort_strategy='spec'
export CYPRESS_baseUrl='https://dev.connechub.com/'
export CYPRESS_VERSION='0.0.7'

export DB_HOST='connechub-dev-rds-mariadb-5j1m.c8d4gbylpdxg.us-west-2.rds.amazonaws.com'
export DB_PASS='dev_ch_rds_pass'
export DB_SCHE='connechub'
export DB_USER='dev_ch_rds_user'

echo 'Init clean database...'
mysql -u $DB_USER -p$DB_PASS -h $DB_HOST < ./db/sql/database.sql

if [[ ! $(docker login) ]]; then
    echo 'You will need to run `docker login` and auth first.'
    exit $(echo $?)
fi

echo "Resetting cypress_tests.tmp..."
if [ -f cypress_tests.tmp ]; then
    echo "" > cypress_tests.tmp
fi

echo "Resetting snapshot images..."
aws s3 sync s3://connechub-configs/cypress/snapshots/connechub/ ./cypress/snapshots/connechub/ --profile $AWS_PROFILE

if [[ ! $(docker images | grep cypress-test-image | grep $CYPRESS_VERSION) ]];then
    echo "Building base image container..."
    docker build \
    -t cypress-test-image:$CYPRESS_VERSION \
    -f cypress/Dockerfile \
    .
fi

# counter
i=0

for filename in cypress/integration/connechub/*.js; do
    echo "Iteration $i for $filename"

    echo "docker run \
    -e CYPRESS_baseUrl="$CYPRESS_baseUrl" \
    -e CYPRESS_abort_strategy="$CYPRESS_abort_strategy" \
    -e CYPRESS_VERSION="$CYPRESS_VERSION" \
    -v $(pwd)/cypress:/app/cypress \
    --name "cypress_$i" \
    --rm \
    cypress-test-image:$CYPRESS_VERSION \
    ./node_modules/cypress/bin/cypress run --browser chrome --headless true --spec $filename" >> cypress_tests.tmp

    ((i++))
done

echo "Executing parallel Docker containers for testing..."
parallel \
    --bar \
    --keep-order \
    --halt now,fail=1 \
    --max-procs 16 \
    < cypress_tests.tmp

EXIT_CODE=$(echo $?)
echo "Exit code from parallel is $EXIT_CODE"

if [ $EXIT_CODE != 0 ]; then
    echo "Something failed, stopping all other running containers..."
    docker stop $(docker ps -a -q)
fi

echo "Resetting file permissions due to Docker volume mounting..."
sudo chown $USER:$USER -R ./cypress/

echo "...done."

exit $EXIT_CODE
