/**
 * Release 1.1.13 "Eeroe Eagle" changes
 * https://trello.com/c/XOlP7NmQ/64-1113-eerie-eagle
 */
describe('Release 1.1.13 changes ...', function () {
    
    const listingData = []
    const userData = []

    // Main: https://trello.com/c/pg8fMjsY/90-add-pwa-capabilities
    // https://trello.com/c/ELCYKDOL/95-add-to-home-screen-a2hs
    // https://trello.com/c/043WKwV6/63-error-from-google-analytics
    // https://trello.com/c/8VcyCvK7/83-enable-text-compression
    // TODO: Figure out how to read response headers
    // it("... comfirm text compression is enable", function () {
    //   cy.request('').then((response) => {
    //     expect(response.status).to.eq(200)
    //   })
    //   .then((response) => {
    //     response.headers['cache-control'].eq('max-age=0, private, must-revalidate');
    //     response.headers['content-encoding'].eq('gzip');
    //     response.headers['content-type'].eq('text/html; charset=utf-8');
    //   })

    // });
    // https://trello.com/c/V13ZbXcM/84-preload-key-requests
    // https://trello.com/c/AnK1fz9a/85-remove-unused-css-remove-unused-javascript
    // https://trello.com/c/sKbwBJPU/88-google-pagespeed-now-reports-desktop-99-mobile-95
    // TODO: Maybe after they fix the Service Worker / Network conflagleration throwing an error
    // it("...should verify the lighthouse scores with thresholds", function () {
    //   cy.lighthouse({
    //     performance: 90,
    //     accessibility: 90,
    //     'best-practices': 90,
    //     seo: 90,
    //     pwa: 100,
    //   });
    // });

    // Maint: https://trello.com/c/mwYJC5k3/89-improvements-based-on-skylight
    // https://trello.com/c/3VRpAnZ0/81-iterate-on-categoryindex
    // https://trello.com/c/UxGYzfVh/82-iterate-on-subcategoryindex
    // https://trello.com/c/9OkRq6K9/91-iterated-on-listingscontrollershow
    // https://trello.com/c/IBwpGhSa/92-iterated-on-categorycontrollershow
    // no way to UAT test these reliable. See Trello card's before/after.
    // it('...', function () {
    // })
})
