describe('Listing Search CRUD...', function () {

  const listingData = [
    {
      "category": "Campus",
      "sub_category": "Activities & Events",
      "price": "12.34",
      "title": "Searching Test Title",
      "city": "Tampa",
      "state": "FL",
      "zipcode": "33612",
      "description": "Searching Test Description.",
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
    cy.create_new_listing(listingData[0])
  })

  // no need for this in the searching suite
  //  it('...reads a listing.', function () {
  //  })

  // no need for this in the searching suite
  //  it('...updating a listing data.', function () {
  //  })

  it('...search for listing, as logged in user.', function () {
    cy.visit('')
    
    cy.get('#search').clear().type(listingData[0]['title'])
    cy.get('form > div > input').click()
    cy.get('div.grid > div > div.panel-footer.pin-content > div.name > b > a').contains(listingData[0]['title']).click()

    cy.get('div.hero-title > span > b > p').contains('Searching Test Title')
    cy.get('div.comments > small > b').contains('This post has 0 Comments')
    cy.get('div.hero-title > span > b').contains(listingData[0]['title'])
    cy.get('div.post-metadata > div > div > span > div > b').contains(listingData[0]['price'])
  })

  // log out and search for listing
  it('...search for listing, as guest user.', function () {
    // search as a guest user
    cy.logout()
    cy.visit('')

    cy.get('#search').clear().type(listingData[0]['title'])
    cy.get('form > div > input').click()
    cy.get('div.grid > div > div.panel-footer.pin-content > div.name > b > a').contains(listingData[0]['title']).click()

    cy.get('div.hero-title > span > b > p').contains('Searching Test Title')
    cy.get('div.comments > small > b').contains('This post has 0 Comments')
    cy.get('div.hero-title > span > b').contains(listingData[0]['title'])
    cy.get('div.post-metadata > div > div > span > div > b').contains(listingData[0]['price'])

    cy.login()
  })

  it('...deleting a listing.', function () {
    cy.view_user_profile()
    
    cy.get('div.grid. > div > div.panel-footer.pin-content > div.name > b > a').contains(listingData[0]['title']).should('be.visible').click()
    cy.get('div:nth-child(11) > a:nth-child(2)').contains('Delete').click()
    cy.handle_splash_message('Listing has been deleted.', 'success')
  })
})
