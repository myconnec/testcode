describe('Listing CRUS PAID...', function () {

  const userData = [
    {
      email: 'listing_paid_user+admin@connechub.com',
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

  it('...creating a listing that requires a payment.)', function () {

    // create a paid listing
    cy.get('#navbar > ul > li > a > button').contains('POST A VIDEO AD').click()

    // step 1 of paid listing creation
    cy.get('div.panel-heading > h2').contains('Create New Listing')
    cy.get('#listing_category_id').select(listingData[1]['category']).should('have.value', '6')
    cy.get('#listing_subcategory_id', { timeout: 10000 }).select(listingData[1]['sub_category'])
    cy.get('#listing_condition_id').select(listingData[1]['condition']).should('have.value', '1')
    cy.get('#listing_price').clear().type(listingData[1]['price'])
    cy.get('#listing_title').clear().type(listingData[1]['title'])
    cy.get('#listing_city').clear().type(listingData[1]['city'])
    cy.get('#listing_state').clear().type(listingData[1]['state'])
    cy.get('#listing_zipcode').clear().type(listingData[1]['zipcode'])
    cy.get('#listing_description').clear().type(listingData[1]['description'])
    cy.get('#listings_submit').click()
    // cy.get('div#overlay').should('be.not.visible') // TODO get this to work

    // step 2 of paid listing creation
    cy.get('div.panel-heading > h2').contains('Pay for Your New Listing')

    var date = new Date()
    var card_number = '4242 4242 4242 4242'
    var expiration = ('0630')
    var cvv = '123'
    var zip = '12345'

    // Stripe form elements
    cy.get_iframe_body('#card-element > div > iframe').find('div.CardNumberField-input-wrapper > span > input').type(card_number)
    cy.get_iframe_body('#card-element > div > iframe').find('span.CardField-expiry.CardField-child > span > span > input').type(expiration)
    cy.get_iframe_body('#card-element > div > iframe').find('span.CardField-cvc.CardField-child > span > span > input').type(cvv)
    cy.get_iframe_body('#card-element > div > iframe').find('span.CardField-postalCode.CardField-child > span > span > input').type(zip)

    cy.get('#listings_submit').click()

    // step 3 of paid listing creation
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

    cy.handle_splash_message('Video has been uploaded. You will receive an email once processing completed.', 'success')
  })

  it('...reads most recent paid listing.', function () {
    cy.view_user_profile()

    // first listing shown
    cy.get('div.grid > div:nth-child(1) > div.panel-footer.pin-content > div.name > b > a').should('be.visible').click()

    cy.get('body > div:nth-child(8) > div > a:nth-child(2)').contains('Connechub')
    cy.get('body > div:nth-child(8) > div > a:nth-child(3)').contains(listingData[1]['category'])
    cy.get('body > div:nth-child(8) > div > a:nth-child(4)').contains(listingData[1]['sub_category'])

    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > b').contains(listingData[1]['title'])
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div:nth-child(7) > p').contains(listingData[1]['description'])
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.post-metadata > div > div > span > div > b').contains(listingData[1]['price'])

    cy.get('body > div:nth-child(8) > div > div:nth-child(6) > div.comments > h4').contains('Post a Comment')
  })
})
