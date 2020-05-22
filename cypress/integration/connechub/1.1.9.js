/**
 * Release 1.1.9 changes
 */

describe('Release 1.1.9 changes ...', function () {

    const userData = {
        admin: false,
        bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        email: 'test@test.com',
        name: 'Test User',
        password: 'Cs^6^*HG$AKMowIskiwRF*P$lM6y4g*i',
        new_password: 'Cs^6^*HG$ASDFwIskiwRF*P$lM6y4g*i'
    }

    // email should not be allowed as username
    // source: https://trello.com/c/Sxdqm7Ih/19-email-should-not-be-allowed-as-username
    it('...create: email should not be allowed as username', function () {
        const rnd = Math.floor(Math.random() * Math.floor(1024));
        userData.name = userData.name + ' ' + rnd
        userData.email= 'test' + rnd + '+admin@connechub.com'

        cy.visit('')
        console.log('userData: ', userData)
        cy.get('#navbar > ul.nav.navbar-nav.navbar-right > li:nth-child(2) > a').click()

        cy.get('#user_username').type(userData.email)
        cy.get('#user_email').type(userData.email)
        cy.get('#user_password').type(userData.password)
        cy.get('#user_password_confirmation').type(userData.password)
        cy.get('form.new_user').submit()

        cy.get('#user_username').should(($usernameField) => {
            expect($usernameField.get(0).checkValidity()).to.equal(false);
            expect($usernameField.get(0).validationMessage).to.equal('Please match the requested format.');
        });
    })

    // new subcategories recently added in the services category are missing .
    // source: https://trello.com/c/fOmIj28Z/27-new-subcategories-recently-added-in-the-services-category-are-missing
    // Handled in 1.1.8.js

    // "Sold" Button
    // source: https://trello.com/c/iRI7OmSP/6-sold-button
    // Add listing
    // enable `sold`
    // validate listing is no visable to users
    // disable `sold`
    // validate listing is again visable to users

    // the system is not retaining my subcategory when i go to edit
    // source: https://trello.com/c/1dPvSkwe/15-the-system-is-not-retaining-my-subcategory-when-i-go-to-edit

    // Create a Connechub newsletter for when we do updates and releases.
    // source: https://trello.com/c/UdxgAoYD/17-create-a-connechub-newsletter-for-when-we-do-updates-and-releases

    // Condition of the item for sale.
    // source: https://trello.com/c/Vslk0uga/7-condition-of-the-item-for-sale

    // Word wrap Listing title when long titles are used.
    // source: https://trello.com/c/NXfzZ9Vh/30-word-wrap-listing-title-when-long-titles-are-used

    // Unable to edit my profile when I chose forget password. Enter my email I get an error ""
    // source: https://trello.com/c/FOxUEgUr/26-unable-to-edit-my-profile-when-i-chose-forget-password-enter-my-email-i-get-an-error

    // Not sure we can UAT these items:

    // After uploading a new video. I no longer get email confirmation that my upload has completed
    // source: https://trello.com/c/F1KACX0F/18-after-uploading-a-new-video-i-no-longer-get-email-confirmation-that-my-upload-has-completed

    // Progressive video playback using adaptive video quality
    // source: https://trello.com/c/77240W0Z/21-research-automatic-quality-switching-for-video-playback
})
