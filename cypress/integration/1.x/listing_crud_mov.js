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
      email: 'admin+test_listing_crud_mov@connechub.com',
      name: 'Test User Listing CRUD MOV',
      password: 'H@nt8wZLcsdfgwerdua^F#8l3AEJ2452345c'
    }
  ]

  it('...creating the MOV listing.', function () {
    cy.create_user(userData[0]).create_listing(listingData[0]).logout()
  })

  it('...reads a MOV listing.', function () {
    cy.login(userData[0]).view_user_profile()
    cy.get('a').contains(listingData[0]['title']).click()
    cy.get('a').contains('Connechub')
    cy.get('a').contains(listingData[0]['category'])
    cy.get('a').contains(listingData[0]['sub_category'])
    cy.get('div.hero-title > span > b').contains(listingData[0]['title'])
    cy.get('div').contains(listingData[0]['description'])
    cy.get('div > b').contains(listingData[0]['price'])
    cy.get('div.comments > h4').contains('Post a Comment')
    cy.logout()
  })
})
