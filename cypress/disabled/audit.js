describe('Performance Auditing...', function () {

  // TODO Cal we do these in a loop? IE for panding page, cat/subcat/listing vw'  s?
  // Landing page
  it("...Lightouse", function () {
    cy.visit('');
    cy.lighthouse();
  });

  it("...accessibility", function () {
    cy.visit('');
    cy.pa11y();
  });
});

