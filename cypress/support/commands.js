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

Cypress.Commands.add('login', (userData = false) => {
    // this is an example of skipping your UI and logging in programmatically

    if (userData == false) {
        // setup some basic types
        // and user properties
        userData = {
            name: 'Test User',
            email: 'test@test.com',
            password: 'testtest',
            admin: false
        }
    }

    cy.visit('')
    console.log('userData: ', userData)

    // log in using the test user
    cy.get('#navbar > ul > li:nth-child(1) > a').contains('Login').click()

    cy.get('#app_view_devise > div > div > div > div.panel-heading > h3').contains('Log In!')
    cy.get('#user_email').type(userData.email)
    cy.get('#user_password').type(userData.password)
    cy.get('#user_remember_me').check()
    cy.get('form.new_user').submit()

    cy.handle_splash_message('Signed in successfully.', 'notice')
})

Cypress.Commands.add('logout', () => {

    cy.get('#navbar > ul > li:nth-child(3) > a').contains('Logout').click()
    cy.handle_splash_message('Signed out successfully.', 'notice')
})

Cypress.Commands.add('handle_splash_message', (msg, type) => {
    cy.get('body > div:nth-child(7) > div > div').should('have.class', 'alert-' + type).contains(msg)
    cy.get('body > div:nth-child(7) > div > div > button > span').click()
    cy.get('body').contains(msg).should('not.be.visible')
})
