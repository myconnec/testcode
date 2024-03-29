/**
 * Release 1.1.11 changes
 */
describe('Release 1.1.11 changes ...', function () {


    // typical user `admin+deployment_1_1_11@connechub.com` causes a FATAL error return from Devise
    // Source: https://github.com/heartcombo/devise/issues/5304
    const userData = [
        {
            name: 'Test User OneOneEleven',
            email: 'admin+deployment_1_1_11_test_user@connechub.com',
            password: '~T0V4vhFc*EvulAOWb1ys$jjUv3TCAt7Y'
        }
    ]

    // Forgot password form submit error
    // https://trello.com/c/bU835RXS/59-forgot-password-form-submit-error
    it('...forgot password form submit error.', function () {
        cy.create_user(userData[0]).logout()
        cy.visit('/users/password/new')
        cy.get('#user_email').clear().invoke('val', userData[0]['email'])
        cy.contains('Reset Your Password').click()

        cy.handle_splash_message('If your email address exists in our database, you will receive a password recovery link at your email address in a few minutes.', 'notice')
    })

    // UPDATE About us photo.
    it('...UPDATE About us photo.', function () {
        cy.visit('/about')
        cy.get('body > div:nth-child(8) > div.container > header', { timeout: 5000 })
            .matchImageSnapshot('1_1_11_update_about_us_header_image');
    })

    // UPDATE About Us page with new verbiage
    // superseded by 1.1.12 change
    // it('...UPDATE About Us page with new verbiage.', function () {
    //     cy.visit('/about')
    //     cy.contains('Connechub is a local classified ad website that allows users to post their video content; to list a job, promote your business, unbox the latest item, or sell your stuff.')
    //     cy.contains('With Connechub you can post your video content from any source such as; your cellphone (Android, IOS), DLSR camera, Mirrorless Camera, Video camera and any other video source.')
    //     cy.contains('As the old cliche goes, "A picture is worth a thousand words". However, "a video is worth a million more".');
    // })
})
