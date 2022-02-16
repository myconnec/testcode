/**
 * Handle splash (flash) UI messages
 */
Cypress.Commands.add('handle_splash_message', (msg, type) => {
    cy.get('body > div > div > div').then(($el, type) => {
        if ($el.hasClass('alert-' + type)) {
            cy.get($el).should('be-visible')
            cy.get($el).contains(msg)
            cy.get('button').click()
            cy.get($el).contains(msg).should('not.be.visible')
        }
    })
})

/**
 * Solve Google ReCaptcha
 * Source https://stackoverflow.com/questions/58684920/cypress-testing-a-contact-form-with-google-recaptcha
 * Source https://developers.google.com/recaptcha/docs/faq#id-like-to-run-automated-tests-with-recaptcha.-what-should-i-do
 */
Cypress.Commands.add('solveGoogleReCAPTCHA', () => {
    // Wait until the iframe (Google reCAPTCHA) is totally loaded
    cy.wait(500);
    cy.get('div.g-recaptcha  * > iframe')
        .then($iframe => {
            const $body = $iframe.contents().find('body');
            cy.wrap($body)
                .find('.recaptcha-checkbox-border')
                .should('be.visible')
                .click();
        });
    cy.wait(500);
});
