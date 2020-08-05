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
source ./helpers/.env
mysql -u $DB_USER -p$DB_PASS -h $DB_HOST < ./db/sql/database.sql
./node_modules/cypress/bin/cypress open
```

Then select the suite you wish to run.

Timing:

As of 1.1.12 the `manual` options takes 16.2 minutes to complete. `Automation` takes ~4 minutes.
