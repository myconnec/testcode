# Testing

Execute the following on the database before running tests.

```sql
truncate listings;
truncate comments;
truncate votes;
delete from users where id > 10;
update users set promo_1 = 0 where id < 10;
```

## RSpec - Unit

## Cypress - UAT

- [https://www.cypress.io](https://www.cypress.io)
- [https://docs.cypress.io/guides/getting-started/installing-cypress.html#System-requirements](https://docs.cypress.io/guides/getting-started/installing-cypress.html#System-requirements)

```sh
npm install cypress cypress-image-snapshot --save-dev

export CYPRESS_baseUrl=https://dev.connechub.com/
export CYPRESS_abort_strategy=spec

# `cypress run` to just run the test admin UI
./node_modules/cypress/bin/cypress open
# --reporter cypress-image-snapshot/reporter
```

... or in a container

```sh
cd ./cypress
docker build -t cypress-test-image:1.0.0 -f cypress.Dockerfile .
docker run -t cypress-test-image:1.0.0 .
```

## SQL

Reset DB between runs.

```sql
truncate listings;
truncate comments;
truncate votes;
delete from users where id > 10;
update users set promo_1 = 3 where id < 10;
```
