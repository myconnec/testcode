describe('User Management functionality.', function() {

    const userData = {
        name: 'Test User',
        email: 'test@connechub.com',
        password: '~Asdf1234',
        admin: false
    }

    it('...reset password on website.', function() {
        cy.login()
        cy.view_user_profile()

        cy.get('#inside_view_left > div:nth-child(8) > a').contains('Edit Your Profile').click()

        cy.get('#edit_user_1 > div.small-heading').contains('Optional')
        cy.get('#edit_user_1 > div.small-heading').contains('The following two fields must match to change password.')
        cy.get('#edit_user_1 > div.small-heading').contains('You will be prompted to log in with your new password after the change.')

        cy.get('#user_password').clear().type(userData.password)
        cy.get('#user_password_confirmation').clear().type(userData.password)
        cy.get('#profile_submit').click()

        // cy.logout()
    })

    it('...confirm new password works.', function() {
        cy.login(userData)
        cy.view_user_profile()

        cy.get('#inside_view_left > div:nth-child(8) > a').contains('Edit Your Profile').click()

        cy.get('#user_password').clear().type('testtest')
        cy.get('#user_password_confirmation').clear().type('testtest')
        cy.get('#profile_submit').click()

        // cy.logout()
    })
})
