describe('Listing CRUS PAID...', function () {

  const userData = [
    {
        email: 'listing_paid_user@test.com',
        name: 'Listing Paid User',
        password: '3y%9T*P4eOVwFGrT'
    }
  ]

  const listingData = [
    {
      "category": "Housing",
      "sub_category": "Apartments",
      "price": "12.34",
      "condition": "Average",
      "title": "Test Title",
      "city": "Tampa",
      "state": "FL",
      "zipcode": "33612",
      "description": "Test Description.",
      "fileupload": "24fps.mp4"
    },
    {
      "category": "Jobs",
      "sub_category": "Accounting",
      "price": "56.78",
      "condition": "Not Applicatable",
      "title": "Test Paid Title",
      "city": "Tampa",
      "state": "FL",
      "zipcode": "33612",
      "description": "Test Paid Description.",
      "fileupload": "24fps.mp4"
    }
  ]

  beforeEach(function () {
    cy.login(userData[0])
  })

  afterEach(function () {
    cy.logout()
  })

  it('...creating a paid listing (w/o promo_1).', function () {
    // create three normal posts
    cy.create_new_listing(listingData[0]);
    cy.create_new_listing(listingData[0]);
    cy.create_new_listing(listingData[0]);

    // create a paid listing

    // // step 1 of paid listing creation
    // cy.get('div.panel-heading > h2').contains('Create New Listing')
    // cy.get('#listing_category_id').select(listingData[1]['category']).should('have.value', '1')
    // cy.get('#listing_category_id').select(listingData[1]['category'])
    // cy.get('#listing_subcategory_id', { timeout: 10000}).select(listingData[1]['sub_category'])
    // cy.get('#conition').clear().type(listingData[1]['condition'])
    // cy.get('#listing_price').clear().type(listingData[1]['price'])
    // cy.get('#listing_title').clear().type(listingData[1]['title'])
    // cy.get('#listing_city').clear().type(listingData[1]['city'])
    // cy.get('#listing_state').clear().type(listingData[1]['state'])
    // cy.get('#listing_zipcode').clear().type(listingData[1]['zipcode'])
    // cy.get('#listing_description').clear().type(listingData[1]['description'])
    // cy.get('#listings_submit').click()
    // // cy.get('div#overlay').should('be.not.visible') // TODO get this to work

    // // step 2 of paid listing creation
    // cy.get('div.panel-heading > h2').contains('Pay for Your New Listing')

    // // Stripe form elements
    // cy.get('#root > form > div > div.CardField-input-wrapper.is-ready-to-slide > span.CardField-number.CardField-child > span:nth-child(2) > div > div.CardNumberField-input-wrapper > span > input')
    //   .type('4242 4242 4242 4242')
    // var today = new Date();
    // cy.get('#root > form > div > div.CardField-input-wrapper.is-ready-to-slide > span.CardField-expiry.CardField-child > span > span > input')
    //   .type((today.getMonth() + 3)(today.getYear() + 3))
    // cy.get('#root > form > div > div.CardField-input-wrapper.is-ready-to-slide > span.CardField-cvc.CardField-child > span > span > input')
    //   .type('123')
    // cy.get('#listings_submit').click()

    // // step 3 of paid listing creation
    // cy.get('#fileupload').then(subject => {
    //   return cy.fixture('24fps.mp4', 'base64')
    //     .then(Cypress.Blob.base64StringToBlob)
    //     .then(blob => {
    //       const el = subject[0]
    //       if (el != null) {
    //         const testFile = new File([blob], '24fps.mp4')
    //         const dataTransfer = new DataTransfer()
    //         dataTransfer.items.add(testFile)
    //         el.files = dataTransfer.files
    //       }
    //       return subject
    //     })
    // })

    // cy.get('#fileupload').trigger('change')
    // cy.get('#listings_submit').click()

    // cy.get('#overlay > img').should('be.visible')
  })

  it('...reads most recent listing.', function () {
    cy.view_user_profile()

    // first listing shown
    cy.get('div.grid > div:nth-child(1) > div.panel-footer.pin-content > div.name > b > a').should('be.visible').click()

    cy.get('body > div:nth-child(8) > div > a:nth-child(2)').contains('Connechub')
    cy.get('body > div:nth-child(8) > div > a:nth-child(3)').contains(listingData[0]['category'])
    cy.get('body > div:nth-child(8) > div > a:nth-child(4)').contains(listingData[0]['sub_category'])

    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > b').contains(listingData[0]['title'])
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div:nth-child(7) > p').contains(listingData[0]['description'])
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.post-metadata > div > div > span > div > b').contains(listingData[0]['price'])

    cy.get('body > div:nth-child(8) > div > div:nth-child(6) > div.comments > h4').contains('Post a Comment')
  })
})
