describe('Ensure header image is the correct size in all viewport sizes...', function () {

    it('...landing page does not have a title bar header image.', function () {
        cy.visit('')
        cy.get('body > nav.navbar.navbar-default.navbar-fixed-top > div > div.navbar > a')
            .should('not.have.descendants', 'img')
    })

    it('...do see header image in the Sign Up view.', function () {
        cy.visit('/users/sign_up')
        cy.get('#navbar > div > a > img').should('have.css', 'height', '55px')
        cy.get('#navbar > div > a > img').should('have.css', 'width', '194.328125px')
    })
})
