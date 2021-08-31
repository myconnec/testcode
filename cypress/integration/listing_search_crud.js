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

  const userData = [
    {
      bio: 'Lorem ipsum dolor sit amet....',
      email: 'admin+listing_search@connechub.com',
      name: 'Test User Search Listing 0',
      password: 'Cs^6^*HG$AKMowIskiwRF*P$lM6y4g*i'
    }
  ]

  beforeEach(() => {
    cy.create_user(userData[0]).create_listing(listingData[0])
  })

  // no need for this in the searching suite
  //  it('...reads a listing.', function () {
  //  })

  // no need for this in the searching suite
  //  it('...updating a listing data.', function () {
  //  })

  it('...search for listing, as logged in user.', function () {
    // cy.get('#search').clear().value(listingData[0]['title'])
    cy.get('#search').clear().invoke('val', listingData[0]['title'])
    cy.get('form > div.col-xs-12.col-sm-4.col-sm-offset-4 > input').click()
    cy.get('div.panel-footer.pin-content > div.name > b > a').contains(listingData[0]['title']).click()

    cy.get('div.hero-title > span > b > p').contains('Searching Test Title')
    cy.get('div.comments > small > b').contains('This post has 0 Comments')
    cy.get('div.hero-title > span > b').contains(listingData[0]['title'])
    cy.get('div.post-metadata > div > div > span > div > b').contains(listingData[0]['price'])
  })

  // log out and search for listing as a guest user
  it('...search for listing, as guest user.', function () {
    cy.logout()

    cy.get('#search').clear().type(listingData[0]['title'])
    cy.get('form > div.col-xs-12.col-sm-4.col-sm-offset-4 > input').click()
    cy.get('div.panel-footer.pin-content > div.name > b > a').contains(listingData[0]['title']).click()

    cy.get('div.hero-title > span > b > p').contains('Searching Test Title')
    cy.get('div.comments > small > b').contains('This post has 0 Comments')
    cy.get('div.hero-title > span > b').contains(listingData[0]['title'])
    cy.get('div.post-metadata > div > div > span > div > b').contains(listingData[0]['price'])
  })

  it('...deleting a listing.', function () {
    cy.get('div.grid > div:nth-child(1) > div.panel-footer.pin-content > div.name > b > a').contains(listingData[0]['title']).should('be.visible').click()
    cy.get('div:nth-child(11) > a:nth-child(2)').contains('Delete').click()
    cy.handle_splash_message('Listing has been deleted.', 'success')
  })
})
