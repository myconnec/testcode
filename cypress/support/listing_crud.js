
/**
 * Create listing
 * 
 */
Cypress.Commands.add('create_listing', (listingData) => {
    cy.visit('/listings/new')

    // step 1 of listing creation
    cy.get('div.panel-heading > h2').contains('Create New Listing')
    cy.get('.panel > .panel-body > #new_listing > .input-group > .form-control > #listing_category_id').select(listingData.category)
    cy.get('.panel > .panel-body > #new_listing > .input-group > .form-control > #listing_subcategory_id', { timeout: 1000 }).select(listingData.sub_category)
    cy.get('#listing_price').clear().invoke('val', listingData.price)
    cy.get('#listing_title').clear().invoke('val', listingData.title)
    cy.get('#listing_city').clear().invoke('val', listingData.city)
    cy.get('#listing_state').clear().invoke('val', listingData.state)
    cy.get('#listing_zipcode').clear().invoke('val', listingData.zipcode)
    cy.get('#new_listing > div:nth-child(20) > div.form-group.trix_editor.required.listing_description > div > trix-editor')
        .focus()
        .invoke('val', '{selectall}{backspace}')
        .invoke('val', listingData.description)
    cy.get('#listings_submit').click()

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
    // cy.get('#overlay > img').should('be.visible')

    cy.waitForPageLoadAfter(() => cy.get('#listings_submit').click())
    cy.handle_splash_message('Video has been uploaded. You will receive an email once processing completed.', 'success')
})

/**
 * Read listing
 */

/**
 * Update listing
 */

/**
 * Delete an existing listing
 */
Cypress.Commands.add('delete_listing', (listingData, userData) => {
    cy.view_user_profile()
    cy.contains(listingData['title']).click()
    cy.get('body > div > div > div > div > a').contains('Delete').click()
    cy.handle_splash_message('Listing has been deleted.', 'success')
})