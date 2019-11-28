/**
 * ConnecHub User Stories
 *
 * Test phases:
 * Arrange - Setup Init application state
 * Act - Do some action
 * Assert - make an assertion
 */
describe('Sign In as an existing user.', function () {
    it('...user fullfils Sign In form', function () {
        cy.login()
        cy.logout()
    })
})
