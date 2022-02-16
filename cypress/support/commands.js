// ***********************************************
// This example commands.js shows you how to
// create various custom commands and overwrite
// existing commands.
//
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************
//
//
// -- This is a parent command --
// Cypress.Commands.add("login", (email, password) => { ... })
//
//
// -- This is a child command --
// Cypress.Commands.add("drag", { prevSubject: 'element'}, (subject, options) => { ... })
//
//
// -- This is a dual command --
// Cypress.Commands.add("dismiss", { prevSubject: 'optional'}, (subject, options) => { ... })
//
//
// -- This is will overwrite an existing command --
// Cypress.Commands.overwrite("visit", (originalFn, url, options) => { ... })

// source https://github.com/mfrachet/cypress-audit
import "cypress-audit/commands";

// source https://github.com/palmerhq/cypress-image-snapshot
import { addMatchImageSnapshotCommand } from 'cypress-image-snapshot/command';
addMatchImageSnapshotCommand({
  failureThreshold: 1, // threshold for entire image
  failureThresholdType: 'percent', // percent of image or number of pixels
  customDiffConfig: { threshold: 0.1 }, // threshold for each pixel
  capture: 'fullPage', // capture viewport in screenshot
});

/**
 * Interacting with iframe content
 * source https://www.cypress.io/blog/2020/02/12/working-with-iframes-in-cypress/
 */
Cypress.Commands.add('get_iframe_body', (selector) => {
  // get the iframe > document > body
  // and retry until the body element is not empty
  cy.log('get_iframe_body')

  return cy
    .get(selector, { log: false })
    .its('0.contentDocument.body', { log: false }).should('not.be.empty')
    // wraps "body" DOM element to allow
    // chaining more Cypress commands, like ".find(...)"
    // https://on.cypress.io/wrap
    .then((body) => cy.wrap(body, { log: false }))
})

/**
 * Given a function with some commands that cause the page to change or even
 * just reload, this command runs the command then waits for that page load.
 *
 * Ideally this command should be used sparingly, instead preferring to use
 * matching functionality to wait for reload.
 *
 * Adapted from:
 * https://github.com/cypress-io/cypress/issues/1805#issuecomment-525482440
 */
Cypress.Commands.add("waitForPageLoadAfter", block => {
  // mark our window object to "know" when it gets reloaded
  cy.window().then(win => {
    // eslint-disable-next-line no-param-reassign
    win.beforeReload = true;
  });
  // initially the new property is there
  cy.window().should("have.prop", "beforeReload", true);

  // Run the code that triggers the page reload/change
  block();

  // after reload the property should be gone
  cy.window().should("not.have.prop", "beforeReload");
});