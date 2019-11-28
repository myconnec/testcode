describe('Ensure header image is the correct size in all viewport sizes...', function () {
    // basic boolean assertion
    it('...landing page does not have a title bqar header image.', function () {
        cy.viewport('macbook-15')
        cy.visit('')
        cy.get('body > nav.navbar.navbar-default.navbar-fixed-top > div > div.navbar > a')
            .should('not.have.descendants', 'img')
    })

    it('...do see header image in the Sign Up view.', function () {
        cy.visit('users/sign_in')
        cy.get('body > nav.navbar.navbar-default.navbar-fixed-top > div > div.navbar-header > a')
            .should('have.css', 'float', 'left')

        // TODO learn how to access DOM elements and attributes in CY
        // width
        // width = document.querySelector('body > nav.navbar.navbar-default.navbar-fixed-top > div > div.navbar-header > a > img').width
        // height = document.querySelector('body > nav.navbar.navbar-default.navbar-fixed-top > div > div.navbar-header > a > img').height

        // assertEquals(height, 55)
        // assertEquals(width, 229)
    })
})
