describe('Ensure header image is the correct size in all viewport sizes...', function () {

    it('...landing page does not have a title bar header image.', function () {
        cy.visit('')
        cy.get('body > nav.navbar.navbar-default.navbar-fixed-top > div > div.navbar > a')
            .should('not.have.descendants', 'img')
    })

    it('...do see header image in the Sign Up view.', function () {
        cy.visit('/users/sign_up')
        cy.get('#navbar > div > a > img').invoke('outerHeight').should('be.gt', 54.9).should('be.lt', 55.1);
        cy.get('#navbar > div > a > img').invoke('outerWidth').should('be.gt', 193.9).should('be.lt', 195.1);
    })
})
