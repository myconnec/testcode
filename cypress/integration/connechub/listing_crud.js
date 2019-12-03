describe('Listing CRUD...', function () {

  const fileName = '../fixtures/24fps.mp4';
  
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
    cy.get('.panel > .panel-body > #new_listing > .input-group > .form-control > #listing_category_id').select('1')
    cy.wait(500) // wait for ajax response
    cy.get('.panel > .panel-body > #new_listing > .input-group > .form-control > #listing_subcategory_id').select('1')
    cy.get('.panel > .panel-body > #new_listing > .input-group > #listing_price').type('12.34')
    cy.get('.panel > .panel-body > #new_listing > .input-group > #listing_title').type('Test Title')
    cy.get('.panel > .panel-body > #new_listing > .input-group > #listing_city').type('Tampa')
    cy.get('.panel > .panel-body > #new_listing > .input-group > #listing_state').type('FL')
    cy.get('.panel > .panel-body > #new_listing > .input-group > #listing_zipcode').type('33612')
    cy.get('.panel > .panel-body > #new_listing > .input-group > #listing_description').type('Test description.')
    cy.get('input#listings_submit').click()
    // cy.get('div#overlay').should('be.not.visible') // TODO get this to work

    // step 2 of listing creation
    cy.get('input#fileupload').then(subject => {
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
    cy.get('button#listings_submit').click()
    // cy.get('#overlay > img').should('be.visible')
    cy.wait(10000) // TODO find another way to make cypress wait until the XHR request returns a 200

    cy.handle_splash_message('Video has been uploaded. You will recieve an email once processing completed.', 'success')
  })
})
