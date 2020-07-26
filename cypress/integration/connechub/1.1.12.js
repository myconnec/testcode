/**
 * Release 1.1.12 changes
 */
describe('Release 1.1.12 changes ...', function () {
    
    const listingData = []
    const userData = []

    // https://trello.com/c/Di4sjIO0/51-add-newsletter-data
    it('...UPDATED newsletter data.', function () {
        cy.visit('/newsletter')
        cy.contains('Connechub feels that it takes a community of one to provide an experience that is safe and easy to use. As a company, we will listen to the needs of our users and will continue to make changes to improve the environment.')
    })

    // https://trello.com/c/6674txFF/33-update-about-us-page-with-new-verbiage
    it('...UPDATE About us content.', function () {
        cy.visit('/about')
        cy.contains('Connechub is a local classified ad website where you can; Buy, Sell, Promote and Watch Local Video Classifieds.')
    })
    
    // https://trello.com/c/YMLb1pw6/10-audit-and-refactor-iam-security-policies
    // If everything continues to work correctly, this is validated

    // https://trello.com/c/bnRZCVr0/67-list-of-emails-for-users-on-the-site-that-are-active-not-disabled
    // UAT test not needed

    // https://trello.com/c/5BQUdTkF/35-update-about-us-photo
    it('...UPDATED about us head image.', function () {
        cy.visit('/about')
        cy.get('header', {timeout: 5000}).matchImageSnapshot('about_us_header');
    })
    
    // https://trello.com/c/eyFxjmn6/69-replace-terms-of-conditions-with-terms-of-service-throughout
    it('...replace terms of condition with terms of service.', function () {
        cy.visit('/')
        cy.get('#myNavbar > div > ul > li:nth-child(2) > a > span').click()
        cy.get('#myNavbar > div > ul > li.dropup.open > ul > li:nth-child(1) > a').contains('Terms of Service')

        cy.visit('/terms')
        cy.get('body > div:nth-child(8) > div.container').contains('conditions').should('not.exist')
    })

    // https://trello.com/c/8gJJhawv/71-enable-concurrent-execution-of-uat-tests
    // See TESTING.md

    // https://trello.com/c/xCrcOlC0/52-add-uat-screenshots-stored-to-s3
    // See TESTING.md

    // https://trello.com/c/043WKwV6/63-error-from-google-analytics
    // UAT test not needed
})
