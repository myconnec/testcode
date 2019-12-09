describe('User Management functionality.', function() {
    
    const userData = {
        name: 'Test User',
        email: 'test@test.com',
        password: '~Asdf1234',
        admin: false
    }

    it('...reset password on website.', function() {
        cy.login()
        cy.view_user_profile()
        cy.get('#navbar > ul > li.dropdown.open > ul > li:nth-child(2) > a').contains('Edit Your Account').should('be.visible').click()
        cy.get('body > div:nth-child(8) > div > div > div > div.panel-heading > h2').contains('Edit Your Account').click()

        cy.get('#user_current_password').clear().type('testtest')
        cy.get('#user_password').clear().type(userData.password)
        cy.get('#user_password_confirmation').clear().type(userData.password)
        cy.get('#edit_user > div.form-group > input').click()
        cy.logout()
    })

    it('...confirm new password works.', function() {
        cy.login(userData)
        cy.view_user_profile()
        cy.get('#navbar > ul > li.dropdown.open > ul > li:nth-child(2) > a').contains('Edit Your Account').should('be.visible').click()
        cy.get('body > div:nth-child(8) > div > div > div > div.panel-heading > h2').contains('Edit Your Account').click()

        cy.get('#user_current_password').clear().type(userData.password)
        cy.get('#user_password').clear().type('testtest')
        cy.get('#user_password_confirmation').clear().type('testtest')
        cy.get('#edit_user > div.form-group > input').click()
        cy.logout()
    })
})