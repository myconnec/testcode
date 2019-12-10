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

        cy.get('#inside_view_left > div:nth-child(7) > a').contains('Edit Your Profile').click()

        cy.get('#user_current_password').clear().type('testtest')
        cy.get('#user_password').clear().type(userData.password)
        cy.get('#user_password_confirmation').clear().type(userData.password)
        cy.get('#edit_user > div.form-group > input').click()

        cy.logout()
    })

    it('...confirm new password works.', function() {
        cy.login(userData)
        cy.view_user_profile()

        cy.get('#inside_view_left > div:nth-child(7) > a').contains('Edit Your Profile').click()

        cy.get('#user_current_password').clear().type(userData.password)
        cy.get('#user_password').clear().type('testtest')
        cy.get('#user_password_confirmation').clear().type('testtest')
        cy.get('#edit_user > div.form-group > input').click()

        cy.logout()
    })
})