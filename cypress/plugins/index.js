// ***********************************************************
// This example plugins/index.js can be used to load plugins
//
// You can change the location of this file or turn off loading
// the plugins file with the 'pluginsFile' configuration option.
//
// You can read more here:
// https://on.cypress.io/plugins-guide
// ***********************************************************

// This function is called when a project is opened or re-opened (e.g. due to
// the project's config changing)

// source https://github.com/palmerhq/cypress-image-snapshot
const { addMatchImageSnapshotPlugin } = require('cypress-image-snapshot/plugin');

// source https://github.com/mfrachet/cypress-audit
const { lighthouse, pa11y, prepareAudit } = require('cypress-audit');

// source https://github.com/mysqljs/mysql
const mysql = require('mysql')

// source https://github.com/cypress-io/cypress/issues/3689
function queryTestDb(query, config) {

  // creates a new mysql connection using credentials from cypress.json env's
  const connection = mysql.createConnection(config.env.db)
  // start connection to db
  connection.connect()
  // exec query + disconnect to db as a Promise
  return new Promise((resolve, reject) => {
    connection.query(query, (error, results) => {
      if (error) reject(error)
      else {
        connection.end()
        // console.log(results)
        return resolve(results)
      }
    })
  })
}

module.exports = (on, config) => {
  addMatchImageSnapshotPlugin(on, config);

  on("before:browser:launch", (browser = {}, launchOptions) => {
    prepareAudit(launchOptions);
  });

  on("task", {
    lighthouse: lighthouse(), // calling the function is important
    pa11y: pa11y(), // calling the function is important
    queryDb: query => { // mysql connector
      return queryTestDb(query, config)
    },
  });
};
