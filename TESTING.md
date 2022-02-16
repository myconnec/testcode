# Testing

## RSpec - Unit

## Cypress - UAT

- [https://www.cypress.io](https://www.cypress.io)
- [https://docs.cypress.io/guides/getting-started/installing-cypress.html#System-requirements](https://docs.cypress.io/guides/getting-started/installing-cypress.html#System-requirements)

### Preflight

```sh
source ./libs/.env
# mysql -u $DB_USER -p$DB_PASS -h $DB_HOST < ./db/sql/database.sql
mysql -u $DB_USER -p$DB_PASS -h $DB_HOST < ./cypress/support/reset-db.sql
```

### Execute Cypress

```sh
cd ./lib
sudo time ./run_uat.sh
```

## Open Cypress UI

```sh
$(npm bin)/cypress open
```
