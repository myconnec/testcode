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

  const userData = [
    {
      bio: 'Lorem ipsum dolor sit amet....',
      email: 'admin+deployment_1_1_8@connechub.com',
      name: 'Test User Deployment OneOneEight',
      password: 'k%p$79SG4&U1@$#u&DwMMV^XqX%4l2&q'
    }
  ]

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
    cy.create_user(userData[0])
    cy.create_listing(listingData[0])
    cy.logout()
  })

  it('...search a listing.', function () {
    cy.create_user(userData[0]).create_listing(listingData[0])
    cy.visit('')
    cy.get('#location').type('Orlando, Florida')
    cy.get('form > div.col-xs-12.col-sm-4.col-sm-offset-4 > input').click()
    cy.get('div.panel-footer.pin-content > div.name > b > a').contains(listingData[0]['title'])
  })

  it('...deleting a listing.', function () {
    cy.create_user(userData[0]).create_listing(listingData[0]).view_user_profile()
    cy.get('a').contains(listingData[0]['title']).should('be.visible')
    cy.get('a').contains('Delete').click()
    cy.handle_splash_message('Listing has been deleted.', 'success')
    cy.logout()
  })
})
