/**
 * Tickets from the 1.1.8 release
 */

describe('Release 1.1.8 change ...', function () {

  const service_subcategories = [
    "Accountant",
    "Architecture",
    "Artists",
    "Barber",
    "Beauty Salons",
    "Building Remodelling",
    "Business Planner",
    "Taxi Cab/UBER",
    "Car Rental",
    "Chef",
    "Cleaning Services / Maids",
    "Home Decor",
    "Fitness Instructor",
    "Elderly Care",
    "IT / Programmer",
    "Grant Writer",
    "Health Spa",
    "Lawn Care",
    "Legal Services",
    "Limousine",
    "Repair / Handyman",
    "Marketing Firm",
    "nonprofit",
    "Home Security",
    "Structural Engineering",
    "Home Remodelling",
    "Auto Repair",
    "Tutoring/Education",
    "Website Designer",
    "Plumber",
    "Appliance Repair",
    "Dog Walker",
    "Pressure Washing",
    "Computer Repair",
    "Auto Insurance",
    "Small Construction",
    "Life Insurance",
    "Mortgage Refinance",
    "Photographers",
    "Financial Planner",
    "Music Dj & Bands",
    "Moving Company",
    "Dentist",
    "Doctors",
    "Party Bus",
    "Pawn Shops",
    "Gun Shops",
    "Laundromat",
    "Massage Therapists",
    "Garbage Collection",
    "Churches",
    "Pet Grooming",
    "Restaurants",
    "Pest Control Services",
    "Dumpster Rental",
    "Reception Halls",
    "Roofing Contractors",
    "Tow Truck Service",
    "Cash Services",
    "tax services",
    "funerals service",
    "real estate investor",
    "real estate agents",
    "grocery stores",
    "retailers",
    "food trucks/mobile food",
    "internet firm",
    "pain specialist"
  ]

  const listingData = [
    {
      "category": "Campus",
      "sub_category": "Activities & Events",
      "price": "0.01",
      "title": "kk0ntzD9Zbajc9DgbT4qK7WKt96RChIduuCNoomDw5xypJlhyFcYO5VIc0FvY4ak3uPVLbqtWhvml2xre7Yvjo6v0GhPoK44nPZD8zlGNWS9TfTFdcEa9xGZglD3hK0wBWeJNDEEvth21nCz3GuyGfIYoBgrHVIfD8Cd6qo8TNMHEKM75X8EqNoUe2bQ3zWF8Vel54yeY67bJg2BWFfgNvitP51FWJgtkjtdyMuaqfHDrghEbNPj5tYqjkhpm2u1",
      "city": "Orlando",
      "state": "FL",
      "zipcode": "33612",
      "description": "Test Geo Location Description.",
      "fileupload": "24fps.mp4"
    }
  ]

  beforeEach(function () {
    cy.login()
  })

  afterEach(function () {
    cy.logout()
  })

  /**
   * Additional Subcategories under Services
   * https://trello.com/c/k0gmXu0E/25-can-additional-subcategories-be-added
   */
  // disabled due to sub/category changes in 1.1.10
  // it('...additional sub-categories under Services.', function () {
  //   for (var i of service_subcategories) {
  //     cy.get('body > div:nth-child(8) > div > div:nth-child(10) > div > div:nth-child(2) > div:nth-child(6)')
  //       .contains(i)
  //   }
  // })

  /**
   * Geo fencing searches
   * https://trello.com/c/7DZ0jyJ3/21-re-enable-geo-fencing-search-distancing
   *
   * Allow < 1.00 USD priced items
   * https://trello.com/c/XRIxhxOf/15-allow-100-item-price
   *
   * Allow numbers in Listing title
   * https://trello.com/c/t0eFlPtR/16-allow-numbers-in-listing-title
   *
   * 256 character Listing title limit
   * https://trello.com/c/qbjJvU0x/17-there-should-be-a-150-character-limit-on-the-category-title
   */
  it('...creating a new listing.', function () {
    // see top menu item
    cy.get('#navbar > ul > li > a > button').contains('POST A VIDEO AD').click()

    // step 1 of listing creation
    cy.get('div.panel-heading > h2').contains('Create New Listing')
    cy.get('#listing_category_id').select(listingData[0]['category']).should('have.value', '1')
    cy.get('#listing_category_id').select(listingData[0]['category'])
    cy.wait(1000) // wait for ajax response
    cy.get('#listing_subcategory_id').select(listingData[0]['sub_category'])
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
    // cy.get('#overlay > img').should('be.visible')
    cy.handle_splash_message('Video has been uploaded. You will recieve an email once processing completed.', 'success')
  })

  it('...search a listing.', function () {
    cy.get('#location').type('Orlando, Florida')
    cy.get('form > div.col-xs-12.col-sm-4.col-sm-offset-4 > input').click()
    cy.get('div.panel-footer.pin-content > div.name > b > a').contains(listingData[0]['title'])
  })

  it('...deleting a listing.', function () {
    cy.view_user_profile()
    cy.get('a').contains(listingData[0]['title']).should('be.visible')
    cy.get('a').contains('Delete').click()
    cy.handle_splash_message('Listing has been deleted.', 'success')
  })
})
