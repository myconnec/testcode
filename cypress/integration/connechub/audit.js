describe('Release 1.1.12 changes ...', function () {
  it("audits the home page", function () {
    cy.visit("/");
    cy.lighthouse();
  });
});
