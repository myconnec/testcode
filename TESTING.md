# Testing

## RSpec - Unit

## Cypress - UAT

- [https://www.cypress.io](https://www.cypress.io)
- [https://docs.cypress.io/guides/getting-started/installing-cypress.html#System-requirements](https://docs.cypress.io/guides/getting-started/installing-cypress.html#System-requirements)

Automation:

```sh
./helpers/run_uat.sh
```

Manually:

```sh
# set these values as appropriate
export DB_HOST=''
export DB_PASS=''
export DB_SCHE=''
export DB_USER=''
mysql -u $DB_USER -p$DB_PASS -h $DB_HOST $DB_SCHE -e "DROP DATABASE IF EXISTS $DB_SCHE;"
mysql -u $DB_USER -p$DB_PASS -h $DB_HOST < ./db/sql/database.sql

export CYPRESS_abort_strategy='spec'
export CYPRESS_baseUrl='https://dev.connechub.com/'
export CYPRESS_VERSION='0.0.6'
./node_modules/cypress/bin/cypress open
```

Then select the suite you wish to run.

Timing:

As of 1.1.12 the `manual` options takes 16.2 minutes to complete. Automation takes XmYs.
