#!/bin/bash 

# source https://www.mariedrake.com/post/using-docker-to-run-your-cypress-tests
# source https://stackoverflow.com/questions/20796200/how-to-loop-over-files-in-directory-and-change-path-and-add-suffix-to-filename
# source https://unix.stackexchange.com/questions/344360/collect-exit-codes-of-parallel-background-processes-sub-shells
# source https://stackoverflow.com/questions/29568352/using-docker-compose-with-ci-how-to-deal-with-exit-codes-and-daemonized-linked
# source

# docker build \
# -t cypress-test-image:0.0.5 \
# -f cypress/Dockerfile \
# .

export CYPRESS_baseUrl='https://dev.connechub.com/'
export CYPRESS_abort_strategy='spec'
export CYPRESS_VERSION='0.0.5'

i=0

docker container prune -f

for filename in cypress/integration/connechub/*.js; do

    echo "Iteration $i for $filename"

    docker run \
    -d \
    -e CYPRESS_baseUrl="$CYPRESS_baseUrl" \
    -e CYPRESS_abort_strategy="$CYPRESS_abort_strategy" \
    -e CYPRESS_VERSION="$CYPRESS_VERSION" \
    -v $(pwd)/cypress:/app/cypress \
    --name "cypress_$i" \
    --rm \
    cypress-test-image:$CYPRESS_VERSION \
    ./node_modules/cypress/bin/cypress run --browser chrome --headless true --spec $filename

    ((i++))
done

# docker-compose ps -q | xargs docker inspect -f '{{ .Name }} exited with status {{ .State.ExitCode }}'
