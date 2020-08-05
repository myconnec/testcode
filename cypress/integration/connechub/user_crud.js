/**
 * ConnecHub User Stories
 *
 * Test phases:
 * Arrange - Setup Init application state
 * Act - Do some action
 * Assert - make an assertion
 */
describe('User account CRUD...', function () {

    const userData = [
        {
            admin: false,
            bio: 'User CRUD',
            email: 'test+user_crud@connechub.com',
            name: 'Test User CRUD',
            password: 'T37q1Gm@miyg',
            new_password: 'cAYCZL60aR01'
        }
    ]

    it('...create.', function () {
        cy.visit('')
        cy.get('#navbar > ul > li > a').contains('Sign Up').click()

        cy.get('#user_username').type(userData[0].name)
        cy.get('#user_email').type(userData[0].email)
        cy.get('#user_password').type(userData[0].password)
        cy.get('#user_password_confirmation').type(userData[0].password)
        cy.get('form.new_user').submit()

        cy.get('body > div > div > div').contains('Welcome! You have signed up successfully.')
        cy.logout()
    })

    it('...read.', function () {
        cy.login(userData[0])
        cy.view_user_profile()
        cy.get('#inside_view_left > div:nth-child(4)').contains(userData[0].name)
        cy.get('#inside_view_left > div:nth-child(5)').should('be.empty') // nothing in the bio for new users
        cy.logout()
    })

    it('...update (w/o password change).', function () {
        cy.login(userData[0]).view_user_profile()

        // update w/o password
        cy.get('#inside_view_left > div:nth-child(8) > a').contains('Edit Your Profile').click()
        cy.get('#user_bio').clear().type(userData[0].bio + ' - no password change ')
        cy.get('#profile_submit').click()

        cy.logout()
    })

    it('...update (w/ password change).', function () {
        cy.login(userData[0]).view_user_profile()

        cy.get('#inside_view_left > div:nth-child(8) > a').contains('Edit Your Profile').click()
        cy.get('#user_bio').clear().type(userData[0].bio + ' with password change.')
        cy.get('#user_password').type(userData[0].new_password)
        cy.get('#user_password_confirmation').type(userData[0].new_password)
        cy.get('#profile_submit').click()

        // use new password to log in
        cy.get('body > div > div > div').contains('You need to sign in or sign up before continuing.')
        cy.login({
            email: userData[0].email,
            password: userData[0].new_password,
        }, false).view_user_profile()
        cy.logout()
    })

    // TODO: Users should have a way to disable / delete their account.
    // it('...delete.', function () {
    //     cy.login(userData[0])
    //     cy.logout()
    // })
})
