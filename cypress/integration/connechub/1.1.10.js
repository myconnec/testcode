/**
 * Release 1.1.10 changes
 * 
 * This release involved a major change to the UI; the sub/caregory meny was moved and iterated on as well as the landing page changed. These changes are reflected throughout the Cypress e2e test suite, not simply in here.
 */
describe('Release 1.1.10 changes ...', function () {
    
      const listingData = [
        {
          "category": "Unboxing",
          "sub_category": "Computers",
          "price": "0.00",
          "condition": "Excellent",
          "title": "Test FB Share Title",
          "city": "Tampa",
          "state": "FL",
          "zipcode": "33612",
          "description": "Test FB Share Description.",
          "fileupload": "24fps.mp4"
        },
        {
            "category": "Sale",
            "sub_category": "Home & Garden",
            "price": "123.00",
            "condition": "Excellent",
            "title": "Test Subcategory and Category Shows Title",
            "city": "Tampa",
            "state": "FL",
            "zipcode": "33612",
            "description": "Test Subcategory and Category Shows Description.",
            "fileupload": "24fps.mp4"
        },
        {
            "title": "Testing Special Characters Title 0123456789!$,.?"
        }
      ]
    
    // FIX Stripe value source. Add Listing PAID crud UAT testing.
    // https://trello.com/c/U6pfaJSh/49-fix-stripe-value-source-add-listing-paid-crud-uat-testing
    // see listing_crud_paid.js

    // ADD UpTime Robot
    // https://trello.com/c/rFKdFu3r/48-add-uptime-robot
    // not in scope of UAT testing

    // We need something on the home page to tell users who we are.
    // https://trello.com/c/gWcKTaQG/32-we-need-something-on-the-home-page-to-tell-users-who-we-are
    // screenshot specifically of the header image    
    it('...new landing page header image.', function () {
        cy.visit('')
        cy.get('body > div:nth-child(8) > div > div:nth-child(1) > img', {timeout: 5000})
            .matchImageSnapshot('1_1_10_new_header_image');
    })

    // Facebook Open Graph Meta Tags
    // https://trello.com/c/sr1jg9dq/31-facebook-open-graph-meta-tags
    // not possible w/o FB account credentials
    // create listing, goto FB Share debugger, submit listing, screen capture result
    // 
    // part 1
    // it('...create new listing to as the target of a Facebook share.', function () {
    //     cy.visit('').login().create_new_listing(listingData[0]).logout()
    // })

    // part 2
    // it('...confirm output of Facebook share via debugger.', function() {
    //     // wait / sleep 60s?
    //     cy.visit('https://developers.facebook.com/tools/debug/')
    //     cy.contains('#u_0_6').type('https://dev.connechub.com/listings/1')
    //     cy.click('#u_0_5 > div._2pis > button', {timeout: 5000})
    //     cy.get('#u_0_0 > div:nth-child(2) > div._4-u3._3a8w.noPadding > table > tbody > tr._23m0', {timeout: 5000})
    //         .matchImageSnapshot('1_1_10_facebook_share_debug_output');
    // })
    
    // Website Redesign (www.connechub.com)
    // https://trello.com/c/zgNPmX3D/38-website-redesign-wwwconnechubcom
    // sub/category change, landing page layout change
    it('...new landing page category menu.', function () {
        cy.visit('')
        cy.get('body > div > div > div.side-menu', {timeout: 5000})
            .matchImageSnapshot('1_1_10_landing_page_cat_menu');
    })
    // cat: only its own subcats are visible
    it('...new subcategory menu.', function () {
        cy.visit('/categories/1')
        cy.get('div.sub_category_1', {timeout: 5000})
            .matchImageSnapshot('1_1_10_campus_category_1');
    })
    it('...new subcategory menu.', function () {
        cy.visit('/categories/2')
        cy.get('div.sub_category_2', {timeout: 5000})
            .matchImageSnapshot('1_1_10_campus_category_2');
    })
    it('...new subcategory menu.', function () {
        cy.visit('/categories/3')
        cy.get('div.sub_category_3', {timeout: 5000})
            .matchImageSnapshot('1_1_10_campus_category_3');
    })

    // Add another subcategory called "Auto Parts" this will go under the "Sale" category
    // https://trello.com/c/M7rBsihc/28-add-another-subcategory-called-auto-parts-this-will-go-under-the-sale-category
    // new items under Sale cat: https://dev.connechub.com/categories/9
    it('...add Auto Parts under Sale category.', function () {
        cy.visit('/categories/9')
        cy.get('div.category_title').contains('Auto Parts')
    })

    // Update Cypress UAT tests for better performance
    // https://trello.com/c/tqchBOgA/41-update-cypress-uat-tests-for-better-performance
    // done throughout test suite

    // Google Analytics is not recording session data
    // https://trello.com/c/7JNtSTkZ/29-google-analytics-is-not-recording-session-data
    // not in scope of UAT testing

    // Listings not displaying on Subcategory index views
    // https://trello.com/c/Plsj5OOw/56-listings-not-displaying-on-subcategory-index-views
    it('...Listings display in category show AND subcategory show VWs.', function () {
        cy.visit('').login().create_new_listing(listingData[1]).logout()
        // category show
        cy.visit('/categories/9').contains('Test Subcategory and Category Shows Title')
        // subcategory show
        cy.visit('/categories/9/subcategories/167').contains('Test Subcategory and Category Shows Title')
    })

    // Updating a listing title does not allow numbers, but it should
    // https://trello.com/c/0Dhhn91b/57-updating-a-listing-title-does-not-allow-numbers-but-it-should
    it('...UPDATE listing, allow numbers in title.', function () {
        cy.visit('').login().view_user_profile()
        cy.contains('Edit Listing').click()
        cy.get('#listing_title').clear().type(listingData[2]['title'])
        cy.get('#listings_submit').click()
        cy.handle_splash_message('Listing has been updated.', 'success')
        cy.contains(listingData[2]['title'])
        cy.delete_listing(listingData[2])
    })

    // Profile image changing not working.
    // https://trello.com/c/0CWb6GMp/58-profile-image-changing-not-working
    it('...UPDATE listing, allow numbers in title.', function () {
        
        // add profile image
        cy.visit('').login().view_user_profile()
        cy.get('#inside_view_left > div:nth-child(8) > a').contains('Edit Your Profile').click()
        cy.get('#user_avatar').then(subject => {
            return cy.fixture('user_profile_0.jpg', 'base64')
            .then(Cypress.Blob.base64StringToBlob)
            .then(blob => {
                const el = subject[0]
                if (el != null) {
                    const testFile = new File([blob], 'user_profile_0.jpg')
                    const dataTransfer = new DataTransfer()
                    dataTransfer.items.add(testFile)
                    el.files = dataTransfer.files
                }
                return subject
            })
        })
        cy.get('#profile_submit').contains('Update Profile').click()
        cy.visit('').view_user_profile()
        cy.get('#inside_view_left > div.profile-info > img', {timeout: 5000}).matchImageSnapshot('1_1_10_user_profile_0');

        // change confirm profile image change
        cy.visit('').view_user_profile()
        cy.get('#inside_view_left > div:nth-child(8) > a').contains('Edit Your Profile').click()
        cy.get('#user_avatar').then(subject => {
            return cy.fixture('user_profile_1.png', 'base64')
            .then(Cypress.Blob.base64StringToBlob)
            .then(blob => {
                const el = subject[0]
                if (el != null) {
                    const testFile = new File([blob], 'user_profile_1.png')
                    const dataTransfer = new DataTransfer()
                    dataTransfer.items.add(testFile)
                    el.files = dataTransfer.files
                }
                return subject
            })
        })
        cy.get('#profile_submit').contains('Update Profile').click()
        cy.visit('').view_user_profile()
        cy.get('#inside_view_left > div.profile-info > img', {timeout: 5000}).matchImageSnapshot('1_1_10_user_profile_1');
    })
})
