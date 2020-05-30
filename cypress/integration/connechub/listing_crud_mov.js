describe('Listing CRUD (mov)...', function () {

  const listingData = [
    {
      "category": "Campus",
      "sub_category": "Activities & Events",
      "price": "56.78",
      "title": "Test Title trim MOV",
      "city": "Tampa",
      "state": "FL",
      "zipcode": "33612",
      "description": "Test Description - trim.*.mov.",
      "fileupload": "trim.bf2f8a8c-e7ec-40ac-8df5-b7042edb5d9b.480p.mov"
    }
  ]

  beforeEach(function () {
    cy.login()
  })

  afterEach(function () {
    cy.logout()
  })

  it('...creating the MOV listing.', function () {
    // see top menu item
    cy.get('.container > #navbar > .nav > li > a').contains('POST A VIDEO AD').click()

    // step 1 of listing creation
    cy.get('div.panel-heading > h2').contains('Create New Listing')
    cy.get('.panel > .panel-body > #new_listing > .input-group > .form-control > #listing_category_id').select(listingData[0]['category'])
    cy.wait(1000) // wait for ajax response
    cy.get('.panel > .panel-body > #new_listing > .input-group > .form-control > #listing_subcategory_id').select(listingData[0]['sub_category'])
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
      return cy.fixture('trim.bf2f8a8c-e7ec-40ac-8df5-b7042edb5d9b.480p.mov', 'base64')
        .then(Cypress.Blob.base64StringToBlob)
        .then(blob => {
          const el = subject[0]
          if (el != null) {
            const testFile = new File([blob], 'trim.bf2f8a8c-e7ec-40ac-8df5-b7042edb5d9b.480p.mov')
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

  it('...reads the MOV listing.', function () {
    cy.view_user_profile()

    cy.get('div.grid > div > div.panel-body').should('be.visible').click()

    cy.get('body > div:nth-child(8) > div > a:nth-child(2)').contains('Connechub')
    cy.get('body > div:nth-child(8) > div > a:nth-child(3)').contains(listingData[0]['category'])
    cy.get('body > div:nth-child(8) > div > a:nth-child(4)').contains(listingData[0]['sub_category'])

    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > b').contains(listingData[0]['title'])
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div:nth-child(7) > p').contains(listingData[0]['description'])
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.post-metadata > div > div > span > div > b').contains(listingData[0]['price'])

    cy.get('body > div:nth-child(8) > div > div:nth-child(6) > div.comments > h4').contains('Post a Comment')
  })
})
