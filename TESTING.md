# Testing

## RSpec - Unit

## Cypress - UAT

- [https://www.cypress.io](https://www.cypress.io)
- [https://docs.cypress.io/guides/getting-started/installing-cypress.html#System-requirements](https://docs.cypress.io/guides/getting-started/installing-cypress.html#System-requirements)

## Automation

```sh
sudo time ./libs/run_uat.sh
```

## Manually

```sh
# system requirements
sudo apt-get install -y \
libasound2 \
libgbm-dev \
libgconf-2-4 \
libgtk-3-0 \
libgtk2.0-0 \
libnotify-dev \
libnss3 \
libxss1 \
libxtst6 \
xauth \
xvfb

# Node version manager and node install
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.bashrc
nvm list-remote
nvm install v14.17.5
npm update npm
npm install
npm audit fix

source ./libs/.env
# mysql -u $DB_USER -p$DB_PASS -h $DB_HOST < ./db/sql/database.sql
mysql -u $DB_USER -p$DB_PASS -h $DB_HOST < ./cypress/support/reset-db.sql
# verbose performance output
# DEBUG=cypress:server:util:process_profiler ./node_modules/cypress/bin/cypress open
$(npm bin)/cypress open
```

Then select the suite you wish to run in the UI.

## Performance

- Version: 1.1.12
- System: Top of the line 2015 Macbook Pro.
- Manual: 16.2 minutes
- Parallel (export $PARALLEL_PROC_COUNT=8): 4 minutes

- Version: 1.1.12
- System: AMD® Ryzen 7 3700x 8-core processor × 16, 64Gb RAM, Ubuntu 20.04.3 LTS
- Manual: 
- Parallel (export $PARALLEL_PROC_COUNT=16): - Can not run due to `Truncate ${table}`
