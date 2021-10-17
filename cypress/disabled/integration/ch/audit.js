describe('Performance Auditing...', function () {

  // TODO Only run UI/UX tests in ENVs > DEV.

  // TODO Can we do these in a loop? IE for pending page, cat/subcat/listing vw'  s?
  // Landing page
  it("...Lighthouse", function () {
    cy.visit('');
    cy.lighthouse();
  });

  it("...accessibility", function () {
    cy.visit('');
    cy.pa11y();
  });
});
