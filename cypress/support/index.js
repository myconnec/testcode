// ***********************************************************
// This example support/index.js is processed and
// loaded automatically before your test files.
//
// This is a great place to put global configuration and
// behavior that modifies Cypress.
//
// You can change the location of this file or turn off
// automatically serving support files with the
// 'supportFile' configuration option.
//
// You can read more here:
// https://on.cypress.io/configuration
// ***********************************************************

// Import commands.js using ES2015 syntax:
import './commands'

// ignore `share this` errors
Cypress.on('uncaught:exception', (err, runnable) => {
    // returning false here prevents Cypress from
    // failing the test
    return false
})

// clear all of localStorage before the window loadsd on each test
Cypress.on('window:before:load', window => {
    window.localStorage.clear();
});

// source https://github.com/cypress-io/cypress/issues/518
switch (Cypress.env('abort_strategy')) {
    case 'run':
        // eslint-disable-next-line no-undef
        before(function onBeforeEach() {
            // Skips any subsequent specs, if the run has been flagged as failed
            cy.getCookie('has_failed_test').then(cookie => {
                if (cookie && typeof cookie === 'object' && cookie.value === 'true') {
                    Cypress.runner.stop();
                }
            });
        });
    /* fallthrough */
    case 'spec':
        afterEach(function onAfterEach() {
            // Skips all subsequent tests in a spec, and flags the whole run as failed
            if (this.currentTest.state === 'failed') {
                cy.setCookie('has_failed_test', 'true');
                Cypress.runner.stop();
            }
        });
        break;
    default:
}

// source https://docs.cypress.io/guides/references/best-practices#State-reset-should-go-before-each-test
beforeEach(() => {
    cy.task('queryDb', 'TRUNCATE `comments`;')
    cy.task('queryDb', 'TRUNCATE `impressions`;')
    cy.task('queryDb', 'TRUNCATE `listings`;')
    cy.task('queryDb', 'TRUNCATE `users`;')
    cy.task('queryDb', 'TRUNCATE `votes`;')
})
