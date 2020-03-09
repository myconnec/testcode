describe('Listing Search CRUD...', function () {

  const formData = [
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
    cy.create_new_listing(formData[0])
  })

  // no need for this in the searching suite
  //  it('...reads a listing.', function () {
  //  })

  // no need for this in the searching suite
  //  it('...updating a listing data.', function () {
  //  })

  it('...search for listing.', function () {
    cy.get('#search').clear().type(formData[0]['title'])
    cy.get('body > div:nth-child(8) > div > div.form-group.text-center.row > form > div.col-xs-12.col-sm-4.col-sm-offset-4 > input').click()
    cy.get('body > div:nth-child(8) > div > div.leftbar_old.col-xs-6.col-sm-8.col-md-10 > div > div:nth-child(1) > div.panel-footer.pin-content > div.name > b > a')
      .contains(formData[0]['title'])
      .click()

    cy.get('body > div:nth-child(8) > div > div:nth-child(6) > div:nth-child(2) > video').should('be.visible')
    cy.get('body > div:nth-child(8) > div > div:nth-child(6) > div.comments > small > b').contains('This post has 0 Comments')
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > b').contains(formData[0]['title'])
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.post-metadata > div > div > span > div > b').contains(formData[0]['price'])
  })

  // log out and search for listing
  it('...search for listing, as guest user.', function () {
    // search as a guest user
    cy.logout()

    cy.get('#search').clear().type(formData[0]['title'])
    cy.get('body > div:nth-child(8) > div > div.form-group.text-center.row > form > div.col-xs-12.col-sm-4.col-sm-offset-4 > input').click()
    cy.get('body > div:nth-child(8) > div > div.leftbar_old.col-xs-6.col-sm-8.col-md-10 > div > div:nth-child(1) > div.panel-footer.pin-content > div.name > b > a')
      .contains(formData[0]['title'])
      .click()

    cy.get('body > div:nth-child(8) > div > div:nth-child(6) > div:nth-child(2) > video').should('be.visible')
    cy.get('body > div:nth-child(8) > div > div:nth-child(6) > div.comments > small > b').contains('This post has 0 Comments')
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > b').contains(formData[0]['title'])
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.post-metadata > div > div > span > div > b').contains(formData[0]['price'])
    // After v 1.1.3 release
    // cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a > i').click()
    // cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a').contains('1')
    cy.login()
  })

  it('...deleting a listing.', function () {
    cy.view_user_profile()
    
    cy.get('body > div:nth-child(8) > div > div > div:nth-child(2) > div > div > div > div.grid.transitions-enabled.masonry > div:nth-child(1) > div.panel-footer.pin-content > div.name > b > a')
      .contains(formData[0]['title']).should('be.visible').click()
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div:nth-child(11) > a:nth-child(2)')
      .contains('Delete').click()
    cy.handle_splash_message('Listing has been deleted.', 'success')
  })
})
