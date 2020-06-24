/**
 * Release 1.1.11 changes
 */
describe('Release 1.1.11 changes ...', function () {
    
    const listingData = []
    const userData = [
        {
            name: 'Test User',
            email: 'test@connechub.com',
            password: 'testtest'
        }
    ]

    // Forgot password form submit error
    // https://trello.com/c/bU835RXS/59-forgot-password-form-submit-error
    it('...forgot password form submit error.', function () {
        cy.visit('/users/sign_in')
        cy.contains('Forgot your password?').click()

        cy.get('#user_email').clear().type(userData[0]['email'])
        cy.contains('Reset Your Password').click()

        cy.handle_splash_message('You will receive an email with instructions on how to reset your password in a few minutes.', 'success')
    })
})
