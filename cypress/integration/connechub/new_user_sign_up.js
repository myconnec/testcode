/**
 * ConnecHub User Stories
 *
 * Test phases:
 * Arrange - Setup Init application state
 * Act - Do some action
 * Assert - make an assertion
 */
describe('Sign up as  a new user.', function () {
    it('...sees the main landing page', function () {
        cy.visit('')
    })

    it('...clicks the Sign Up link', function () {
        cy.get('#navbar > ul.nav.navbar-nav.navbar-right > li:nth-child(2) > a').click()
    })

    it('...fullfils Sign Up form', function () {

        cy.get('#user_username').type('TestUsername_' + Math.random())
        cy.get('#user_email').type('test' + Math.random() + '+admin@connechub.com')
        cy.get('#user_password').type('Cs^6^*HG$AKMowIskiwRF*P$lM6y4g*i')
        cy.get('#user_password_confirmation').type('Cs^6^*HG$AKMowIskiwRF*P$lM6y4g*i')
        cy.get('form.new_user').submit()
    })

    it('...sees Sign Up complete ending page.', function () {
        cy.get('body > div > div > div')
            .contains('Welcome! You have signed up successfully.')
    })
})
