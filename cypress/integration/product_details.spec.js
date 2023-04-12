describe('home', () => {
  it("should visit root", () => {
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it('can navigate from the home page to the product detail page by clicking on a product', () => {
    cy.get(".products article").first().click();
    cy.contains(".products-show", "Scented Blade")
  });
})