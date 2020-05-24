# Testing

### RSpec - Unit

### Cypress - UAT

- [https://www.cypress.io](https://www.cypress.io)
- [https://docs.cypress.io/guides/getting-started/installing-cypress.html#System-requirements](https://docs.cypress.io/guides/getting-started/installing-cypress.html#System-requirements)


```sh
npm install cypress --save-dev
npm install --save-dev cypress-image-snapshot

export CYPRESS_baseUrl=https://dev.connechub.com/
export CYPRESS_abort_strategy=spec

# `cypress run` to just run the test admin UI
./node_modules/cypress/bin/cypress open \
--reporter cypress-image-snapshot/reporter
```
