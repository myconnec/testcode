describe('Ensure header image is the correct size in all viewport sizes...', function () {

    it('...landing page does not have a title bar header image.', function () {
        cy.visit('')
        cy.get('body > nav.navbar.navbar-default.navbar-fixed-top > div > div.navbar > a')
            .should('not.have.descendants', 'img')
    })

    it('...do see header image in the Sign Up view.', function () {
        cy.visit('users/sign_in')
        cy.get('body > nav.navbar.navbar-default.navbar-fixed-top > div > div.navbar-header > a')
            .should('have.css', 'float', 'left')

        cy.get('body > nav.navbar.navbar-default.navbar-fixed-top > div > div.navbar-header > a > img')
            .should('have.property', 'height').should('be', 'auto')
        
        cy.get('body > nav.navbar.navbar-default.navbar-fixed-top > div > div.navbar-header > a > img')
            .should('have.property', 'width').should('be', '65%')
    })
})
