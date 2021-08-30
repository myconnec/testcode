describe('User password management functionality.', function () {

    const userData = [
        {
            name: 'Test User Reset Password',
            email: 'admin+reset_password@connechub.com',
            password: '~Asdf1234',
            new_password: '~Asdf5678'
        }
    ]

    it('...reset password on website.', function () {
        cy.create_user(userData[0]).view_user_profile()

        cy.get('#inside_view_left > div > a').contains('Edit Your Profile').click()

        cy.get('div.small-heading').contains('Optional')
        cy.get('div.small-heading').contains('The following two fields must match to change password.')
        cy.get('div.small-heading').contains('You will be prompted to log in with your new password after the change.')

        cy.get('#user_password').clear().type(userData[0].new_password)
        cy.get('#user_password_confirmation').clear().type(userData[0].new_password)
        cy.get('#profile_submit').click()
    })

    it('...confirm new password works.', function () {
        // use the new password 'cause the prev. it(...) set it to new_password's value
        userData[0].password = userData[0].new_password

        cy.create_user(userData[0]).view_user_profile()

        cy.get('#inside_view_left > div > a').contains('Edit Your Profile').click()

        cy.get('#user_password').clear().type('new_test_password')
        cy.get('#user_password_confirmation').clear().type('new_test_password')
        cy.get('#profile_submit').click()
        cy.logout()
    })
})
