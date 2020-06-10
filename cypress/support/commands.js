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

// source https://github.com/palmerhq/cypress-image-snapshot
import { addMatchImageSnapshotCommand } from 'cypress-image-snapshot/command';
addMatchImageSnapshotCommand({
  failureThreshold: 0.03, // threshold for entire image
  failureThresholdType: 'percent', // percent of image or number of pixels
  customDiffConfig: { threshold: 0.1 }, // threshold for each pixel
  capture: 'fullPage', // capture viewport in screenshot
});

/**
 * TODO Re-load the database after each test. Ensures a known good dataset. This will only work once we have a local version of the app running as we need rake and a working DB connection.
 */
// beforeEach(function () {
//   cy.exec('rake db:setup').its('code').should('eq', 0)
//   cy.exec('rake db:migrate').its('code').should('eq', 0)
// })

/**
 * Log in user
 */
Cypress.Commands.add('login', (userData = false, alert = true) => {
  // this is an example of skipping your UI and logging in programmatically

  if (userData == false) {
    // setup some basic types
    // and user properties
    userData = {
      name: 'Test User',
      email: 'test@test.com',
      password: 'testtest'
    }
  }

  cy.visit('')
  // log in using the test user
  cy.get('#navbar > ul > li > a > button').contains('POST A VIDEO AD').click()

  cy.get('#app_view_devise > div > div > div > div.panel-heading > h3').contains('Log In!')
  cy.get('#user_email').type(userData.email)
  cy.get('#user_password').type(userData.password)
  cy.get('#user_remember_me').check()
  cy.get('form.new_user').submit()

  cy.handle_splash_message('Signed in successfully.', 'notice')
})

/**
 * Log out user
 */
Cypress.Commands.add('logout', () => {
  cy.get('#navbar > ul > li:nth-child(3) > a').contains('Logout').click()
  cy.handle_splash_message('Signed out successfully.', 'notice')
})

/**
 * Handle splash (flash) UI messages
 */
Cypress.Commands.add('handle_splash_message', (msg, type) => {
  cy.get('body > div:nth-child(7) > div > div', {timeout: 60000}).should('have.class', 'alert-' + type).contains(msg)
  cy.get('body > div:nth-child(7) > div > div > button > span').click()
  cy.get('body').contains(msg).should('not.be.visible')
})

/**
 * Create a new user. If userData is not provided, create a random on
 */
Cypress.Commands.add('create_new_user', (userData = false) => {

  if (userData === false) {
    const rnd = Math.floor(Math.random() * Math.floor(1024));

    userData = {
      bio: 'Lorem ipsum dolor sit amet' + rnd + '.',
      email: 'test' + rnd + '+admin@connechub.com',
      name: 'Test User ' + rnd,
      password: Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15)
    }
  }

  cy.visit('')
  cy.get('#navbar > ul.nav.navbar-nav.navbar-right > li:nth-child(2) > a').click()
  cy.get('#user_username').type(userData.name)
  cy.get('#user_email').type(userData.email)
  cy.get('#user_password').type(userData.password)
  cy.get('#user_password_confirmation').type(userData.password)
  cy.get('form.new_user').submit()
  cy.get('body > div > div > div').contains('Welcome! You have signed up successfully.')
})

/**
 * Since so much of ConnecHub revolves around the Listing, make it easier to create one
 * Allow listingData and userData to be passed in and override defaults
 */
Cypress.Commands.add('create_new_listing', (listingData = false) => {

  if (listingData === false) {
    listingData = {
      "category": "Campus",
      "sub_category": "Activities & Events",
      "price": "12.34",
      "title": "Test Demo Title",
      "city": "Tampa",
      "state": "FL",
      "zipcode": "33612",
      "description": "Test Demo Description.",
      "fileupload": "24fps.mp4"
    }
  }

  // see top menu item
  cy.get('#navbar > ul > li > a > button').contains('POST A VIDEO AD').click()

  // step 1 of listing creation
  cy.get('div.panel-heading > h2').contains('Create New Listing')
  cy.get('.panel > .panel-body > #new_listing > .input-group > .form-control > #listing_category_id').select(listingData.category)
  cy.get('.panel > .panel-body > #new_listing > .input-group > .form-control > #listing_subcategory_id', {timeout: 1000}).select(listingData.sub_category)
  cy.get('#listing_price').clear().type(listingData.price)
  cy.get('#listing_title').clear().type(listingData.title)
  cy.get('#listing_city').clear().type(listingData.city)
  cy.get('#listing_state').clear().type(listingData.state)
  cy.get('#listing_zipcode').clear().type(listingData.zipcode)
  cy.get('#listing_description').clear().type(listingData.description)
  cy.get('#listings_submit').click()
  // cy.get('div#overlay').should('be.not.visible') // TODO get this to work

  // step 2 of listing creation
  cy.get('#fileupload').then(subject => {
    return cy.fixture('24fps.mp4', 'base64')
      .then(Cypress.Blob.base64StringToBlob)
      .then(blob => {
        const el = subject[0]
        if (el != null) {
          const testFile = new File([blob], '24fps.mp4')
          const dataTransfer = new DataTransfer()
          dataTransfer.items.add(testFile)
          el.files = dataTransfer.files
        }
        return subject
      })
  })

  cy.get('#fileupload').trigger('change')
  cy.get('#listings_submit').click()
  // cy.get('#overlay > img').should('be.visible')
  cy.handle_splash_message('Video has been uploaded. You will recieve an email once processing completed.', 'success')

  cy.visit('')
})

/**
 * Delete an existing listing
 */
Cypress.Commands.add('delete_listing', (listingData = false, userData = false) => {
  
  if (listingData === false) {
    return false;
  }

  if (userData === false) {
    // setup some basic types
    // and user properties
    userData = {
      name: 'Test User',
      email: 'test@test.com',
      password: 'testtest'
    }
  }

  cy.visit('').login(userData).view_user_profile()
  cy.contains(listingData['title']).click()
  cy.get('body > div > div > div > div > a').contains('Delete').click()
  cy.handle_splash_message('Listing has been deleted.', 'success')
})

/**
 * This requires a user be logged in. Else is will fail.
 */
Cypress.Commands.add('view_user_profile', () => {
  cy.get('#navbar > ul > li.dropdown > a').contains('Your Account').should('be.visible').click()
  cy.get('#navbar > ul > li.dropdown.open > ul').contains('Your Profile').should('be.visible').click()
})

/**
 * Interacting with iframe content
 * source https://www.cypress.io/blog/2020/02/12/working-with-iframes-in-cypress/
 */
Cypress.Commands.add('getIframeBody', (selector) => {
  // get the iframe > document > body
  // and retry until the body element is not empty
  cy.log('getIframeBody')

  return cy
  .get(selector, { log: false })
  .its('0.contentDocument.body', { log: false }).should('not.be.empty')
  // wraps "body" DOM element to allow
  // chaining more Cypress commands, like ".find(...)"
  // https://on.cypress.io/wrap
  .then((body) => cy.wrap(body, { log: false }))
})