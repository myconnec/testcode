describe('Listing CRUD (mp4)...', function () {

  const formData = [
    {
      "category": "Campus",
      "sub_category": "Activities & Events",
      "price": "12.34",
      "title": "Test Title",
      "city": "Tampa",
      "state": "FL",
      "zipcode": "33612",
      "description": "Test Description.",
      "fileupload": "24fps.mp4"
    },
    {
      "category": "H2F",
      "sub_category": "Odd Items",
      "price": "43.21",
      "title": "Updated Test Title",
      "city": "Clearwater",
      "state": "FL",
      "zipcode": "33612",
      "description": "Updated Test Description.",
      "fileupload": "24fps.mp4"
    }
  ]

  beforeEach(function () {
    cy.login()
  })

  afterEach(function () {
    cy.logout()
  })

  it('...creating a new listing.', function () {
    // see top menu item
    cy.get('.container > #navbar > .nav > li > a').contains('POST A VIDEO AD').click()

    // step 1 of listing creation
    cy.get('div.panel-heading > h2').contains('Create New Listing')
    cy.get('#listing_category_id').select(formData[0]['category']).should('have.value', '1')
    cy.get('#listing_category_id').select(formData[0]['category'])
    cy.wait(1000) // wait for ajax response
    cy.get('#listing_subcategory_id').select(formData[0]['sub_category'])
    cy.get('#listing_price').clear().type(formData[0]['price'])
    cy.get('#listing_title').clear().type(formData[0]['title'])
    cy.get('#listing_city').clear().type(formData[0]['city'])
    cy.get('#listing_state').clear().type(formData[0]['state'])
    cy.get('#listing_zipcode').clear().type(formData[0]['zipcode'])
    cy.get('#listing_description').clear().type(formData[0]['description'])
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
    // cy.get('#overlay > img').should('be.visible')
    cy.wait(10000) // TODO find another way to make cypress wait until the XHR request returns a 200
    cy.handle_splash_message('Video has been uploaded. You will recieve an email once processing completed.', 'success')
  })

  it('...reads a listing.', function () {
    cy.view_user_profile()
    cy.get('div.grid.transitions-enabled.masonry > div:nth-child(1) > div.panel-body').should('be.visible').click()

    cy.get('body > div:nth-child(8) > div > a:nth-child(2)').contains('Connechub')
    cy.get('body > div:nth-child(8) > div > a:nth-child(3)').contains(formData[0]['category'])
    cy.get('body > div:nth-child(8) > div > a:nth-child(4)').contains(formData[0]['sub_category'])

    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > b').contains(formData[0]['title'])
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div:nth-child(7) > p').contains(formData[0]['description'])
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.post-metadata > div > div > span > div > b').contains(formData[0]['price'])

    cy.get('body > div:nth-child(8) > div > div:nth-child(6) > div.comments > h4').contains('Post a Comment')
  })

  it('...updating a listing data.', function () {
    cy.view_user_profile()
    cy.get('div.grid.transitions-enabled.masonry > div:nth-child(1) > div.panel-body').should('be.visible').click()
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div:nth-child(11) > a:nth-child(3)').contains('Edit Listing').click()

    // change all the field values to ensure changing them works
    cy.get('div.panel-heading > h2').contains('Edit Listing') // Edit New Listing
    cy.get('#listing_category_id').select(formData[1]['category']).should('have.value', '4')
    cy.wait(1000) // wait for ajax response
    cy.get('#listing_subcategory_id').select(formData[1]['sub_category'])
    cy.get('#listing_price').clear().type(formData[1]['price'])
    cy.get('#listing_title').clear().type(formData[1]['title'])
    cy.get('#listing_city').clear().type(formData[1]['city'])
    cy.get('#listing_state').clear().type(formData[1]['state'])
    cy.get('#listing_zipcode').clear().type(formData[1]['zipcode'])
    cy.get('#listing_description').clear().type(formData[1]['description'])
    cy.get('#listings_submit').click()

    cy.get('body > div:nth-child(8) > div > a:nth-child(2)').contains('Connechub')
    cy.get('body > div:nth-child(8) > div > a:nth-child(3)').contains(formData[1]['category'])
    cy.get('body > div:nth-child(8) > div > a:nth-child(4)').contains(formData[1]['sub_category'])

    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > b').contains(formData[1]['title'])
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div:nth-child(7) > p').contains(formData[1]['description'])
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.post-metadata > div > div > span > div > b').contains(formData[1]['price'])
    cy.handle_splash_message('Listing has been updated.', 'success')
  })

  it('...updating a listing media.', function () {
    cy.view_user_profile()

    cy.get('div.grid.transitions-enabled.masonry > div:nth-child(1) > div.panel-body').should('be.visible').click()
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div:nth-child(11) > a:nth-child(1)').contains('Change Video').click()
    cy.get('div.panel-heading > h2').contains('Upload Media for Listing').click()

    cy.get('#fileupload').then(subject => {
      return cy.fixture('24 ~!@#$%^&*()_+ fps.MP4', 'base64')
        .then(Cypress.Blob.base64StringToBlob)
        .then(blob => {
          const el = subject[0]
          if (el != null) {
            const testFile = new File([blob], '24 ~!@#$%^&*()_+ fps.MP4')
            const dataTransfer = new DataTransfer()
            dataTransfer.items.add(testFile)
            el.files = dataTransfer.files
          }
          return subject
        })
    })

    cy.get('#fileupload').trigger('change')
    cy.get('#listings_submit').click()
    // cy.get('#overlay > img').should('be.visible')
    cy.wait(10000) // TODO find another way to make cypress wait until the XHR request returns a 200

    cy.handle_splash_message('Video has been uploaded. You will recieve an email once processing completed.', 'success')
  })

  // hard dependency on Listing being updated
  it('...like a listing.', function () {
    cy.get('body > div:nth-child(8) > div > div:nth-child(10) > div > div:nth-child(4) > div:nth-child(8) > ul > li:nth-child(1) > a')
      .contains(formData[1]['sub_category']).click()
    cy.get('div.grid.transitions-enabled.masonry > div:nth-child(1) > div.panel-footer.pin-content > div.name > b > a')
      .contains(formData[1]['title']).click()
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a > i').should('have.class', 'fa-heart')
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a').contains('0')
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a').click()
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a').contains('1')
  })

  // hard dependency on Listing being updated
  it('...like a listing, as a guest.', function () {
    cy.logout()
    cy.get('body > div:nth-child(8) > div > div:nth-child(10) > div > div:nth-child(4) > div:nth-child(8) > ul > li:nth-child(1) > a')
      .contains(formData[1]['sub_category']).click()
      cy.get('body > div:nth-child(8) > div.container_12 > div.leftbar_old.col-xs-6.col-sm-8.col-md-10 > div > div:nth-child(1) > div.panel-footer.pin-content > div.name > b > a')
      .contains(formData[1]['title']).click()
      cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a').contains('1')
      cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a').click()
      cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a').contains('1')
    cy.login()
  })

  it('...deleting a listing.', function () {
    cy.view_user_profile()

    cy.get('body > div:nth-child(8) > div > div > div:nth-child(2) > div > div > div > div.grid.transitions-enabled.masonry > div:nth-child(1) > div.panel-footer.pin-content > div.name > b > a')
      .contains(formData[1]['title']).should('be.visible').click()
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div:nth-child(11) > a:nth-child(2)')
      .contains('Delete').click()
    cy.handle_splash_message('Listing has been deleted.', 'success')
  })
})
