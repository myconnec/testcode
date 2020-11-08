/**
 * Release 1.1.14 changes
 */
describe('Release 1.1.14 changes ...', function () {

    const listingData = []
    const userData = []

    // iOS PWA support
    // https://trello.com/c/D3FdEbtt/106-add-as-much-ios-pwa-support-as-possible
    it('...UPDATED newsletter data.', function () {
        cy.visit('/newsletter')
        cy.contains('Connechub feels that it takes a community of one to provide an experience that is safe and easy to use. As a company, we will listen to the needs of our users and will continue to make changes to improve the environment.')
    })

    // Fix database migrations start to finish
    // https://trello.com/c/GEb3yMUy/105-fix-database-migrations-in-non-prd
    // No need; if new ENV stands up w/o intervention this works

    // Upload user experience
    // https://trello.com/c/gRpsacuM/113-upload-bar-not-updating-when-media-is-being-uploaded

    // Upload progress bar
    // https://trello.com/c/68PqwjbN/100-upload-time-and-speed-is-taking-to-long

    // User account security

    // password complexity setup
    // https://trello.com/c/YRAMD0vJ/103-increase-user-account-security

    // Password complexity
    // https://trello.com/c/Ln4z4lar/9-use-case-password-and-security

    // Add Recaptcha / sign up
    // https://trello.com/c/5QXQeQdm/13-use-case-sign-up-security-option

    // https://trello.com/c/nQYYBY3k/104-implement-https-frontdeveloperpl-2018-10-5-security-issues-in-ruby-on-rails-recommendations

    // Rich text editor addition
    // https://trello.com/c/U5SuKlqr/61-allow-url-links-in-listing-descriptions

    // Remove Hamburger menu in mobile
    // https://trello.com/c/KGAITL6c/70-remove-the-top-hamburger-from-the-cellphone

    // Add JUnit reporting
    // https://trello.com/c/OV82E7O0/112-added-cypress-junit-test-reporting

    // FIX category icons
    // https://trello.com/c/d0Cm6apF/116-incorrect-and-missing-icons

})
