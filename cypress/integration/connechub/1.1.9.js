/**
 * Release 1.1.9 changes
 */

describe('Release 1.1.9 changes ...', function () {

    const userData = {
        admin: false,
        email: 'test_1.1.9@test.com',
        name: 'Test User',
        password: '2QE8XNwhh9V%',
        new_password: '2QE8XNwhh9V%'
    }

    const listingData = [
        {
            "category": "Campus",
            "sub_category": "Activities & Events",
            "price": "90.12",
            "title": "Test Title xWndGzzQWWEyX0J3CELYl4mxCJFYlv15SgbdsGItW4e46beWax1JLOolwoP257SkQ2ZTp50lBiQJwmoTQxBMBraART2sMD2c7fd4lVI38iclLaJPICDT7",
            "city": "Tampa",
            "state": "FL",
            "zipcode": "33612",
            "description": "Test Description - trim.*.mov.",
            "fileupload": "24fps.mp4"
        }
    ]

    // email should not be allowed as username
    // source: https://trello.com/c/Sxdqm7Ih/19-email-should-not-be-allowed-as-username
    it('...create: email should not be allowed as username', function () {
        cy.visit('')
        console.log('userData: ', userData)
        cy.get('#navbar > ul.nav.navbar-nav.navbar-right > li:nth-child(2) > a').click()

        cy.get('#user_username').type(userData.email)
        cy.get('#user_email').type(userData.email)
        cy.get('#user_password').type(userData.password)
        cy.get('#user_password_confirmation').type(userData.password)
        cy.get('form.new_user').submit()

        // HTML 5 client side validation
        // cy.get('#user_username').should(($usernameField) => {
        //     expect($usernameField.get(0).checkValidity()).to.equal(false);
        //     expect($usernameField.get(0).validationMessage).to.equal('Please match the requested format.');
        // });

        // Server side validation reponse
        cy.get('#error_explanation > ul > li').contains('Username is invalid')
    })

    // create new user

    // new subcategories recently added in the services category are missing .
    // source: https://trello.com/c/fOmIj28Z/27-new-subcategories-recently-added-in-the-services-category-are-missing
    // Handled in 1.1.8.js

    // Create a Connechub newsletter for when we do updates and releases.
    // source: https://trello.com/c/UdxgAoYD/17-create-a-connechub-newsletter-for-when-we-do-updates-and-releases
    // visit()
    // bottom menu -> About Us -> Click Newsletter


    // Listing changes
    // login
    // create new listing...

    // Condition of the item for sale.
    // source: https://trello.com/c/Vslk0uga/7-condition-of-the-item-for-sale

    // the system is not retaining my subcategory when i go to edit
    // source: https://trello.com/c/1dPvSkwe/15-the-system-is-not-retaining-my-subcategory-when-i-go-to-edit
    // Add listing
    // Edit listing
    // Confirm SubCategory is populated
    // sign out

    // Word wrap Listing title when long titles are used.
    // source: https://trello.com/c/NXfzZ9Vh/30-word-wrap-listing-title-when-long-titles-are-used

    // "Sold" Button
    // source: https://trello.com/c/iRI7OmSP/6-sold-button
    // log in
    // Add listing
    // enable `sold`
    // validate listing is no visable to users
    // disable `sold`
    // validate listing is again visable to users


    // log out


    // Unable to edit my profile when I chose forget password. Enter my email I get an error ""
    // source: https://trello.com/c/FOxUEgUr/26-unable-to-edit-my-profile-when-i-chose-forget-password-enter-my-email-i-get-an-error

    // Not sure we can UAT these items:

    // After uploading a new video. I no longer get email confirmation that my upload has completed
    // source: https://trello.com/c/F1KACX0F/18-after-uploading-a-new-video-i-no-longer-get-email-confirmation-that-my-upload-has-completed

    // Progressive video playback using adaptive video quality
    // source: https://trello.com/c/77240W0Z/21-research-automatic-quality-switching-for-video-playback
})
