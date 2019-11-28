describe('Posting Functinality', function () {

  const fileName = '24fps.mp4';


  it('... posting displays on User Profile view.', function () {
    cy.login()
    cy.get('.container > #navbar > .nav > li > a').contains('POST A VIDEO AD').click()

    // step 1 loads
    cy.get('div.panel-heading > h2').contains('Create New Listing')
    cy.get('.row > .col-sm-12 > .form-group > .input-group > #user_email').type('test@test.com')
    cy.get('.row > .col-sm-12 > .form-group > .input-group > #user_password').type('testtest')
    cy.visit('')
    cy.get('body > .jbar').click()
    cy.get('.container > #navbar > .nav > li > .post').click()
    cy.get('.panel-body > #new_listing > .input-group > .form-control > #listing_category_id').click()
    cy.get('.panel-body > #new_listing > .input-group > .form-control > #listing_category_id').select('1')
    cy.get('.panel-body > #new_listing > .input-group > .form-control > #listing_subcategory_id').select('1')
    cy.get('.panel > .panel-body > #new_listing > .input-group > #listing_price').type('1.23')
    cy.get('.panel > .panel-body > #new_listing > .input-group > #listing_city').type('Testtown')
    cy.get('.panel > .panel-body > #new_listing > .input-group > #listing_zipcode').type('33612')
    //  cy.get('.panel > .panel-body > #new_listing > .input-group > #listing_media').type('24fps.mp4')

    cy.fixture(fileName).then(fileContent => {
      cy.get('[data-cy="file-input"]').upload({ fileContent, fileName, mimeType: 'video/mp4' });
    });

    cy.get('.panel-body > #new_listing > .input-group > .actions > #listings_submit').click()
    cy.visit('listings/1')
    cy.get('.container > #navbar > .nav > .dropdown > .dropdown-toggle').click()
    cy.get('.nav > .dropdown > .dropdown-menu > li:nth-child(1) > a').click()
    cy.get('body > div > div > div > div.col-xs-6.col-md-10 > div > div > div > div.grid.transitions-enabled.masonry > div > div.panel-footer.pin-content > div.name')
    cy.logout()
  })
})
