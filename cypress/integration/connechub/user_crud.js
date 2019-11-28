/**
 * ConnecHub User Stories
 *
 * Test phases:
 * Arrange - Setup Init application state
 * Act - Do some action
 * Assert - make an assertion
 */
describe('User account CRUD...', function () {

    it('...create.', function () {
        cy.get('#navbar > ul.nav.navbar-nav.navbar-right > li:nth-child(2) > a').click()
        cy.get('#user_username').type('TestUsername_' + Math.random())
        cy.get('#user_email').type('test' + Math.random() + '+admin@connechub.com')
        cy.get('#user_password').type('Cs^6^*HG$AKMowIskiwRF*P$lM6y4g*i')
        cy.get('#user_password_confirmation').type('Cs^6^*HG$AKMowIskiwRF*P$lM6y4g*i')
        cy.get('form.new_user').submit()
        cy.get('body > div > div > div').contains('Welcome! You have signed up successfully.')
    })

    it('...read.', function () {
        cy.login()
        cy.get('#navbar > ul > li.dropdown.open > a').contains('Your Account').click()
        cy.get('#navbar > ul > li.dropdown.open > ul > li:nth-child(1) > a').contains('Your Profile').click()
        cy.get('#inside_view_left > div:nth-child(5)').contains('Test test')
        cy.logout()
    })
})
