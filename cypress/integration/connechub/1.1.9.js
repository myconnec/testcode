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
            email: 'ugly_urbu@test.com',
            name: 'Ugly Urubu',
            password: '2QE8XNwhh9V%',
            new_password: '#0X9OFOetl*B',
            release: '1.1.9'
        }
    ]

    // email should not be allowed as username
    // source: https://trello.com/c/Sxdqm7Ih/19-email-should-not-be-allowed-as-username
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

        // Now correctly create the new user
        cy.create_new_user(userData[0])
    })

    // new subcategories recently added in the services category are missing .
    // source: https://trello.com/c/fOmIj28Z/27-new-subcategories-recently-added-in-the-services-category-are-missing
    // Handled in 1.1.8.js

    // Create a Connechub newsletter for when we do updates and releases.
    // source: https://trello.com/c/UdxgAoYD/17-create-a-connechub-newsletter-for-when-we-do-updates-and-releases
    it('...added newsletter static content page.', function () {
        cy.visit('')
        cy.get('.row1 > .nav > .dropup:nth-child(1) > .dropdown-toggle > .ts-label').click()
        cy.get('.nav > .open > .dropdown-menu > li:nth-child(3) > a').click()
        cy.visit('newsletter')
    })

    it('...creating a new listing.', function () {
        cy.visit('').login(userData[0])

        // see top menu item
        cy.get('.container > #navbar > .nav > li > a').contains('POST A VIDEO AD').click()

        // step 1 of listing creation
        cy.get('div.panel-heading > h2').contains('Create New Listing')
        cy.get('#listing_category_id').select(listingData[0]['category']).should('have.value', 1)
        cy.get('#listing_category_id').select(listingData[0]['category'])
        cy.get('#listing_subcategory_id', {timeout: 10000}).select(listingData[0]['sub_category'])
        // Condition of the item for sale.
        // source: https://trello.com/c/Vslk0uga/7-condition-of-the-item-for-sale
        cy.get('#listing_condition_id').select(listingData[0]['condition']).should('have.value', 4)
        cy.get('#listing_price').clear().type(listingData[0]['price'])
        cy.get('#listing_title').clear().type(listingData[0]['title'])
        cy.get('#listing_city').clear().type(listingData[0]['city'])
        cy.get('#listing_state').clear().type(listingData[0]['state'])
        cy.get('#listing_zipcode').clear().type(listingData[0]['zipcode'])
        cy.get('#listing_description').clear().type(listingData[0]['description'])
        cy.get('#listings_submit').click()
        // cy.get('div#overlay').should('be.not.visible') // TODO get this to work

        // step 2 of listing creation
        cy.get('#fileupload').then(subject => {
            return cy.fixture('24fps.mp4', 'base64')
                .then(Cypress.Blob.base64StringToBlob)
                .then(blob => {
                    const el = subject[0]
                    if (el != null) {
                        const testFile = new File([blob], '24fps.mp4')
                        const dataTransfer = new DataTransfer()
                        dataTransfer.items.add(testFile)
                        el.files = dataTransfer.files
                    }
                    return subject
                })
        })

        cy.get('#fileupload').trigger('change')
        cy.get('#listings_submit').click()
        cy.handle_splash_message('Video has been uploaded. You will recieve an email once processing completed.', 'success')
    })

    it('...updating a listing data.', function () {
        cy.login(userData[0]).view_user_profile()

        // Word wrap Listing title when long titles are used.
        // source: https://trello.com/c/NXfzZ9Vh/30-word-wrap-listing-title-when-long-titles-are-used
        // snapshot name will be the name passed in
        cy.matchImageSnapshot('30-word-wrap-listing-title-when-long-titles-are-used');

        // "Sold" Button
        // source: https://trello.com/c/iRI7OmSP/6-sold-button
        cy.get('a').contains('Mark as Sold').should('be.visible').click()

        cy.visit('')
        cy.contains('Activities & Events').click()
        cy.contains('No listings found!')        
        cy.view_user_profile()
        cy.contains('Relist Item').click()
        cy.get('body > div > div > div').handle_splash_message('Listing marked as re-list. It will now be visible to other users.', 'success')

        cy.get('a').contains(listingData[0]['title']).should('be.visible').click()
        cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div:nth-child(11) > a:nth-child(3)').contains('Edit Listing').click()

        // the system is not retaining my subcategory when i go to edit
        // source: https://trello.com/c/1dPvSkwe/15-the-system-is-not-retaining-my-subcategory-when-i-go-to-edit
        cy.get('#listing_subcategory_id > option:nth-child(2)', {timeout: 10000}).should('have.attr', 'selected', 'selected')
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
