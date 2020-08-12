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

  const userData = [
    {
      bio: 'Lorem ipsum dolor sit amet....',
      email: 'test+listing_crud_mov@connechub.com',
      name: 'Test User Listing CRUD MOV',
      password: 'H@nt8wZLcsdfgwerdua^F#8l3AEJ2452345c'
    }
  ]

  it('...creating the MOV listing.', function () {
    cy.create_user(userData[0]).create_listing(listingData[0]).logout()
  })

  it('...reads the MOV listing.', function () {
    cy.login(userData[0]).view_user_profile()

    cy.get('div.grid > div:nth-child(1) > div.panel-footer.pin-content > div.name > b > a').contains(listingData[0]['title']).click()

    cy.get('body > div:nth-child(8) > div > a:nth-child(2)').contains('Connechub')
    cy.get('body > div:nth-child(8) > div > a:nth-child(3)').contains(listingData[0]['category'])
    cy.get('body > div:nth-child(8) > div > a:nth-child(4)').contains(listingData[0]['sub_category'])
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > b').contains(listingData[0]['title'])
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div:nth-child(7) > p').contains(listingData[0]['description'])
    cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.post-metadata > div > div > span > div > b').contains(listingData[0]['price'])
    cy.get('body > div:nth-child(8) > div > div:nth-child(6) > div.comments > h4').contains('Post a Comment')

    cy.logout()
  })
})
