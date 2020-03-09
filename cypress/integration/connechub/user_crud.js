/**
 * ConnecHub User Stories
 *
 * Test phases:
 * Arrange - Setup Init application state
 * Act - Do some action
 * Assert - make an assertion
 */
describe('User account CRUD...', function () {

    const userData = {
        admin: false,
        bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        email: 'test@test.com',
        name: 'Test User',
        password: 'Cs^6^*HG$AKMowIskiwRF*P$lM6y4g*i'
    }

    // TODO figure out how to NOT do this for the '...create' eval
    // beforeEach(function () {
    //   cy.login()
    // })
    
    // afterEach(function () {
    //   cy.logout()
    // })

    it('...create.', function () {
        const rnd = Math.floor(Math.random() * Math.floor(1024));
        userData.name = userData.name + ' ' + rnd
        userData.email= 'test' + rnd + '+admin@connechub.com'

        cy.visit('')
        console.log('userData: ', userData)
        cy.get('#navbar > ul.nav.navbar-nav.navbar-right > li:nth-child(2) > a').click()
        cy.get('#user_username').type(userData.name)
        cy.get('#user_email').type(userData.email)
        cy.get('#user_password').type(userData.password)
        cy.get('#user_password_confirmation').type(userData.password)
        cy.get('form.new_user').submit()
        cy.get('body > div > div > div').contains('Welcome! You have signed up successfully.')
        cy.logout()
    })

    it('...read.', function () {
        cy.login(userData)
        cy.view_user_profile()
        cy.get('#inside_view_left > div:nth-child(4)').contains(userData.name)
        cy.get('#inside_view_left > div:nth-child(5)').should('be.empty') // nothing in the bio for new users
        cy.logout()
    })

    it('...update.', function () {
        cy.login(userData)
        cy.view_user_profile()

        cy.get('#inside_view_left > div:nth-child(7) > a').contains('Edit Your Profile').click()
        // update w/o password
        cy.get('#user_bio').clear().type(userData.bio)
        cy.get('#edit_user > div.form-group > input').click()
        // gets error
        cy.get('#error_explanation > ul > li').contains('Current password can\'t be blank')

        // update w/ password
        cy.get('#user_bio').clear().type(userData.bio)
        cy.get('#user_current_password').clear().type(userData.password)
        cy.get('#edit_user > div.form-group > input').click()

        // success
        cy.handle_splash_message('Your account has been updated successfully.', 'notice')

        cy.logout()
    })

    it('...delete.', function () {
        cy.login(userData)
        cy.logout()
    })
})
