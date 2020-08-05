#!/bin/bash 

# source https://www.mariedrake.com/post/using-docker-to-run-your-cypress-tests
# source https://stackoverflow.com/questions/20796200/how-to-loop-over-files-in-directory-and-change-path-and-add-suffix-to-filename
# source https://unix.stackexchange.com/questions/344360/collect-exit-codes-of-parallel-background-processes-sub-shells
# source https://stackoverflow.com/questions/29568352/using-docker-compose-with-ci-how-to-deal-with-exit-codes-and-daemonized-linked

clear

source ./helpers/.env

echo "Setup started..."

if [[ ! $(docker login) ]]; then
    echo 'You will need to run `docker login` and auth first.'
    exit $(echo $?)
fi

if [[ ! $(docker images | grep cypress-test-image | grep $CYPRESS_VERSION) ]];then
    echo "Building base image container..."
    docker build \
    -t cypress-test-image:$CYPRESS_VERSION \
    -t cypress-test-image:latest \
    -f cypress/Dockerfile \
    .
fi

echo "Resetting snapshot images..."
aws s3 sync $CYPRESS_SNAP_SOURCE ./cypress/snapshots/$APP_NAME/ --profile $AWS_PROFILE

if [[ $DB_HOST ]]; then
    echo 'Importing ./db/sql/database.sql to baseline database...'
    mysql -u $DB_USER -p$DB_PASS -h $DB_HOST < ./db/sql/database.sql
fi

if [ -f cypress_tests.tmp ]; then
    echo "Prev. Parallel procfile found, removing..."
    echo "" > cypress_tests.tmp
fi

echo "Generating new Parallel procfile..."
i=0
for filename in cypress/integration/$APP_NAME/*.js; do
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

echo "Executing parallel Docker container tests..."
parallel \
    --bar \
    --keep-order \
    --halt now,fail=1 \
    --max-procs $PARALLEL_PROC_COUNT \
    < cypress_tests.tmp

EXIT_CODE=$(echo $?)
echo "Exit code from parallel is $EXIT_CODE"

if [ $EXIT_CODE != 0 ]; then
    echo "Something failed, stopping all other running containers..."
    docker stop $(docker ps -a -q)
fi

if [[ $PARALLEL_REMOVE_PROCFILE ]]; then
    echo "Removing procfile..."
    rm ./cypress_tests.tmp
fi

echo "Resetting file permissions due to Docker volume mounting..."
sudo chown $USER:$USER -R ./cypress/

echo "...done."

exit $EXIT_CODE
