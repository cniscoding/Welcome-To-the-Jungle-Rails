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

  it("clicks add to cart and confirm that the count of the cart button changes", () =>{
    cy.contains('My Cart (0)')
    // cy.get("button.btn").first().click({ force: true });
    cy.contains('Add').first().click({ force: true });
    cy.contains('My Cart (1)')
  });
})