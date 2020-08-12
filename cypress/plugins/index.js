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
  
module.exports = (on, config) => {
  on("before:browser:launch", (browser = {}, launchOptions) => {
    prepareAudit(launchOptions);
  });

  on("task", {
    lighthouse: lighthouse((lighthouseReport) => {
      console.log.bind(console);
      console.log(lighthouseReport); // raw lighthouse report
    }),
    pa11y: pa11y((pa11yReport) => {
      console.log.bind(console);
      console.log(pa11yReport); // raw pa11y report
    }),
  });

  addMatchImageSnapshotPlugin(on, config);
};