# Testing

## RSpec - Unit

## Cypress - UAT

- [https://www.cypress.io](https://www.cypress.io)
- [https://docs.cypress.io/guides/getting-started/installing-cypress.html#System-requirements](https://docs.cypress.io/guides/getting-started/installing-cypress.html#System-requirements)

# Automation

```sh
sudo time ./helpers/run_uat.sh
```

## Manually

```sh
source ./helpers/.env
mysql -u $DB_USER -p$DB_PASS -h $DB_HOST < ./db/sql/database.sql
npm update npm
npm install
./node_modules/cypress/bin/cypress open
```

Then select the suite you wish to run in the UI.

# Performance

- Version: 1.1.12
- System: Full spec'd out Macbook Pro 15" 2015.
- Manual: 16.2 minutes
- Parallel (export $PARALLEL_PROC_COUNT=8): 4 minutes
