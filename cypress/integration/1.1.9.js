/**
 * Release 1.1.9 changes
 */

describe('Release 1.1.9 changes ...', function () {

    const listingData = [
        {
            "category": "Campus",
            "sub_category": "Activities & Events",
            "condition": 'Average',
            "price": "90.12",
            "title": "Test Title 1.1.9",
            "city": "Tampa",
            "state": "FL",
            "zipcode": "33612",
            "description": "Test Description 1.1.9",
            "fileupload": "24fps.mp4"
        }
    ]

    const userData = [
        {
            admin: false,
            email: 'admin+deployment_1_1_9@connechub.com',
            name: 'Ugly Urubu',
            password: '2QE8XNwhh9V%',
            release: '1.1.9'
        }
    ]

    // email should not be allowed as username
    // source: https://trello.com/c/Sxdqm7Ih/19-email-should-not-be-allowed-as-username
    // updated in 1.1.14
    it('...create user and email should not be allowed as username', function () {
        cy.visit('')

        cy.get('#navbar > ul.nav.navbar-nav.navbar-right > li:nth-child(2) > a').click()

        cy.get('#user_username').type(userData[0].email)
        cy.get('#user_email').type(userData[0].email)
        cy.get('#user_password').type(userData[0].password)
        cy.get('#user_password_confirmation').type(userData[0].password)
        cy.get('form.new_user').submit()

        // client side validation
        cy.get('#user_username').should(($usernameField) => {
            expect($usernameField.get(0).checkValidity()).to.equal(false);
            expect($usernameField.get(0).validationMessage).to.equal('Please match the requested format.');
        });

        // Server side validation
        cy.get('#error_explanation > ul > li').contains('Username is invalid')

        // Now correctly create the new user then log out
        cy.create_user(userData[0])
        cy.logout()
    })

    // new subcategories recently added in the services category are missing .
    // source: https://trello.com/c/fOmIj28Z/27-new-subcategories-recently-added-in-the-services-category-are-missing
    // Handled in 1.1.8.js

    // Create a Connechub newsletter for when we do updates and releases.
    // source: https://trello.com/c/UdxgAoYD/17-create-a-connechub-newsletter-for-when-we-do-updates-and-releases
    // updated in 1.1.14
    it('...added newsletter static content page.', function () {
        cy.visit('')
        cy.get('a').contains('About Us').click()
        cy.get('a').contains('Newsletter').click()
        cy.visit('newsletter')
    })

    it('...creating a new listing.', function () {
        cy.login(userData[0]).create_listing(listingData[0])
        cy.logout()
    })

    // updated in 1.1.14
    it('...mark listing as sold.', function () {
        cy.login(userData[0]).view_user_profile()

        // Word wrap Listing title when long titles are used.
        // source: https://trello.com/c/NXfzZ9Vh/30-word-wrap-listing-title-when-long-titles-are-used
        // snapshot name will be the name passed in
        cy.matchImageSnapshot('30-word-wrap-listing-title-when-long-titles-are-used');

        // "Sold" Button
        // source: https://trello.com/c/iRI7OmSP/6-sold-button
        cy.get('a').contains('Mark as Sold').should('be.visible').click()

        cy.visit('/categories/1')
        cy.contains('Activities & Events').click()
        cy.contains(listingData[0].title).should('not.exist')
        cy.view_user_profile()
        cy.contains('Relist Item').click()
        cy.get('body > div > div > div').handle_splash_message('Listing marked as re-list. It will now be visible to other users.', 'success')

        cy.get('a').contains(listingData[0].title).should('be.visible').click()
        cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div:nth-child(11) > a:nth-child(3)').contains('Edit Listing').click()

        // the system is not retaining my subcategory when i go to edit
        // source: https://trello.com/c/1dPvSkwe/15-the-system-is-not-retaining-my-subcategory-when-i-go-to-edit
        cy.get('#listing_subcategory_id > option:nth-child(2)').should('have.attr', 'selected', 'selected')
        cy.logout()
    })

    // Not sure we can UAT these items:

    // After uploading a new video. I no longer get email confirmation that my upload has completed
    // source: https://trello.com/c/F1KACX0F/18-after-uploading-a-new-video-i-no-longer-get-email-confirmation-that-my-upload-has-completed

    // Progressive video playback using adaptive video quality
    // source: https://trello.com/c/77240W0Z/21-research-automatic-quality-switching-for-video-playback
    it('...deleting a listing.', function () {
        cy.login(userData[0]).view_user_profile()
        cy.get('a').contains(listingData[0]['title']).should('be.visible')
        cy.get('a').contains('Delete').click()
        cy.handle_splash_message('Listing has been deleted.', 'success')
        cy.logout()
    })

    // Unable to edit my profile when I chose forget password. Enter my email I get an error ""
    // source: https://trello.com/c/FOxUEgUr/26-unable-to-edit-my-profile-when-i-chose-forget-password-enter-my-email-i-get-an-error
    // covered in user_crud update
})
