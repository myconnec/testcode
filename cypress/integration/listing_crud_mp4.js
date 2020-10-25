describe('Listing CRUD (mp4)...', function () {

  const listingData = [
    {
      "category": "Campus",
      "sub_category": "Activities & Events",
      "price": "12.34",
      "title": "Test Title",
      "city": "Tampa",
      "state": "FL",
      "zipcode": "33612",
      "description": "Test Description.",
      "fileupload": "24fps.mp4"
    },
    {
      "category": "H2F",
      "sub_category": "Odd Items",
      "price": "43.21",
      "title": "Updated Test Title",
      "city": "Clearwater",
      "state": "FL",
      "zipcode": "33612",
      "description": "Updated Test Description.",
      "fileupload": "24fps.mp4"
    }
  ]

  const userData = [
    {
      bio: 'Lorem ipsum dolor sit amet....',
      email: 'admin+listing_crud_mp4@connechub.com',
      name: 'Test User Listing CRUD MP4',
      password: 'H@nt@#$%csdfgwerdua^F#8l3AEJ2asdfc'
    }
  ]

  it('...creating a new listing.', function () {
    cy.create_user(userData[0]).create_listing(listingData[0]).logout()
  })

  it('...reads a MP4 listing.', function () {
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

  it('...updating a listing, change related data.', function () {
    cy.login(userData[0]).view_user_profile()
    cy.get('div.grid > div:nth-child(1) > div.panel-body').should('be.visible').click()
    cy.get('a').contains('Edit Listing').click()

    // step 1 of listing creation
    cy.get('div.panel-heading > h2').contains('Edit Listing')
    cy.get('#listing_category_id').select(listingData[1].category)
    cy.get('#listing_subcategory_id', { timeout: 2500 }).select(listingData[1].sub_category)
    cy.get('#listing_price').clear().type(listingData[1].price)
    cy.get('#listing_title').clear().type(listingData[1].title)
    cy.get('#listing_city').clear().type(listingData[1].city)
    cy.get('#listing_state').clear().type(listingData[1].state)
    cy.get('#listing_zipcode').clear().type(listingData[1].zipcode)
    cy.get('div.listing_description > div > trix-editor')
      .focus()
      .type('{selectall}{backspace}')
      .type(listingData[1].description)
    cy.get('#listings_submit').click()

    cy.get('a').contains('Connechub')
    cy.get('a').contains(listingData[1]['category'])
    cy.get('a').contains(listingData[1]['sub_category'])

    cy.get('div.hero-title > span > b > p').contains(listingData[1]['title'])
    cy.get('div div').contains(listingData[1]['description'])
    cy.get('div > b').contains(listingData[1]['price'])
    cy.handle_splash_message('Listing has been updated.', 'success')
    cy.logout()
  })

  it('...updating a listing media.', function () {
    cy.login(userData[0]).view_user_profile()

    cy.get('div.grid > div:nth-child(1) > div.panel-body').should('be.visible').click()
    cy.get('div:nth-child(7) > div:nth-child(11) > a:nth-child(1)').contains('Change Video').click()
    cy.get('div.panel-heading > h2').contains('Upload Media for Listing').click()

    cy.get('#fileupload').then(subject => {
      return cy.fixture('24 ~!@#$%^&*()_+ fps.MP4', 'base64')
        .then(Cypress.Blob.base64StringToBlob)
        .then(blob => {
          const el = subject[0]
          if (el != null) {
            const testFile = new File([blob], '24 ~!@#$%^&*()_+ fps.MP4')
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
    cy.logout()
  })

  it('...deleting a listing.', function () {
    cy.login(userData[0]).view_user_profile()
    cy.get('div.grid > div:nth-child(1) > div.panel-footer.pin-content > div.name > b > a').contains(listingData[1]['title']).should('be.visible').click()
    cy.get('div:nth-child(7) > div:nth-child(11) > a:nth-child(2)').contains('Delete').click()
    cy.handle_splash_message('Listing has been deleted.', 'success')
    cy.logout()
  })
})
