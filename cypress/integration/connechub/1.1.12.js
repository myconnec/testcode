/**
 * Release 1.1.12 changes
 */
describe('Release 1.1.12 changes ...', function () {
    
    const listingData = []
    const userData = []

    // https://trello.com/c/eyFxjmn6/69-replace-terms-of-conditions-with-terms-of-service-throughout
    it('...replace terms of condition with terms of service.', function () {
        cy.visit('/')
        cy.get('#myNavbar > div > ul > li:nth-child(2) > a > span').click()
        cy.get('#myNavbar > div > ul > li.dropup.open > ul > li:nth-child(1) > a').contains('Terms of Service')

        cy.visit('/terms')
        cy.get('body > div:nth-child(8) > div.container').contains('conditions').should('not.exist')
    })
})
