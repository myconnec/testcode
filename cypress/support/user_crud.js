/**
 * Create a new user
 */
Cypress.Commands.add('create_user', (userData) => {
    cy.visit('')
    cy.get('#navbar > ul.nav.navbar-nav.navbar-right > li:nth-child(2) > a').click()
    cy.get('#user_username').invoke('val', userData.name)
    cy.get('#user_email').invoke('val', userData.email)
    cy.get('#user_password').invoke('val', userData.password)
    cy.get('#user_password_confirmation').invoke('val', userData.password)
    cy.solveGoogleReCAPTCHA()
    cy.get('form.new_user').submit()
    cy.handle_splash_message('Welcome! You have signed up successfully.', 'success')
})

/**
 * Login user
 */
Cypress.Commands.add('login', (userData) => {
    cy.visit('')

    cy.get('#navbar').contains('POST A VIDEO AD').click()

    cy.get('#user_email').invoke('val', userData.email)
    cy.get('#user_password').invoke('val', userData.password)
    cy.get('#user_remember_me').check()
    cy.get('form.new_user').submit()

    cy.contains('Invalid Email or password.').should('not.be.visible')

    cy.handle_splash_message('Signed in successfully.', 'notice')
})

/**
 * Logout user
 * 
 * I dont like it, I dont understand it. But when running Cypress functional tests the user will not always log out.
 * Forcing a page reload 3 times, for whatever reason, corrects the issue.
 * Really have no idea why.
 */
Cypress.Commands.add('logout', () => {
    cy.waitForPageLoadAfter(() =>
        cy.get('a').contains('Logout').click()
    )
    cy.handle_splash_message('Signed out successfully.', 'notice')
    cy.clearCookies()
    cy.clearLocalStorage()
    // confirm log out
    cy.visit('/categories/1').get('#navbar > ul > li > a').contains('Sign Up').visit('')
})

/**
 * view user profile
 * User must be logged in
 */
Cypress.Commands.add('view_user_profile', () => {
    cy.visit('')
    cy.get('#navbar > ul > li.dropdown > a').contains('Your Account').should('be.visible').click()
    cy.get('#navbar > ul > li.dropdown.open > ul > li:nth-child(1) > a').contains('Your Profile').should('be.visible').click()
})
