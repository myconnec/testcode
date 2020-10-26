# Testing

## RSpec - Unit

## Cypress - UAT

- [https://www.cypress.io](https://www.cypress.io)
- [https://docs.cypress.io/guides/getting-started/installing-cypress.html#System-requirements](https://docs.cypress.io/guides/getting-started/installing-cypress.html#System-requirements)

<<<<<<< HEAD
### Automation
=======
## Automation
>>>>>>> c0dedbdabdbda4b1246bcdf07a81c07caec1ca2d

```sh
sudo time ./helpers/run_uat.sh
```

<<<<<<< HEAD
### Manually
=======
## Manually
>>>>>>> c0dedbdabdbda4b1246bcdf07a81c07caec1ca2d

```sh
source ./helpers/.env
# mysql -u $DB_USER -p$DB_PASS -h $DB_HOST < ./db/sql/database.sql
mysql -u $DB_USER -p$DB_PASS -h $DB_HOST < ./cypress/support/reset-db.sql
npm update npm
npm install
npm audit fix
# verbose performance output
# DEBUG=cypress:server:util:process_profiler ./node_modules/cypress/bin/cypress open
./node_modules/cypress/bin/cypress open
```

Then select the suite you wish to run in the UI.

## Performance

- Version: 1.1.12
- System: Top of the line 2015 Macbook Pro.
- Manual: 16.2 minutes
- Parallel (export $PARALLEL_PROC_COUNT=8): 4 minutes
