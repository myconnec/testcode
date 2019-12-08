describe('test_name', function() {

 it('...confirm all static pages load.', function() {

    cy.visit('')
    cy.get('.row1 > .nav > .dropup:nth-child(1) > .dropdown-toggle > .ts-label').click()

    cy.get('.nav > .open > .dropdown-menu > li:nth-child(1) > a').click()

    cy.visit('/career')
    cy.get('.row1 > .nav > .dropup:nth-child(1) > .dropdown-toggle > .ts-label').click()
    cy.get('.nav > .open > .dropdown-menu > li:nth-child(2) > a').click()

    cy.visit('/about')
    cy.get('.row1 > .nav > .dropup:nth-child(1) > .dropdown-toggle > .ts-label').click()
    cy.get('.nav > .open > .dropdown-menu > li:nth-child(3) > a').click()

    cy.visit('/howitworks/index')
    cy.get('.row1 > .nav > .dropup:nth-child(1) > .dropdown-toggle > .ts-label').click()
    cy.get('.nav > .dropup > .dropdown-menu > li:nth-child(4) > a').click()

    ]cy.visit('/prices/index')
    cy.get('.row1 > .nav > .dropup:nth-child(2) > .dropdown-toggle > .ts-label').click()
    cy.get('.nav > .open > .dropdown-menu > li:nth-child(1) > a').click()

    cy.visit('/terms')
    cy.get('.row1 > .nav > .dropup:nth-child(2) > .dropdown-toggle > .ts-label').click()
    cy.get('.nav > .open > .dropdown-menu > li:nth-child(2) > a').click()

    cy.visit('/privacy')
    cy.get('.row1 > .nav > .dropup:nth-child(2) > .dropdown-toggle > .ts-label').click()
    cy.get('.nav > .open > .dropdown-menu > li:nth-child(3) > a').click()

    cy.visit('/postterm')
    cy.get('.row1 > .nav > .dropup:nth-child(3) > .dropdown-toggle > .ts-label').click()
    cy.get('.nav > .open > .dropdown-menu > li:nth-child(1) > a').click()

    cy.visit('/faq')
    cy.get('.panel:nth-child(4) > .panel-heading > .small-heading > .pull-right > .glyphicon').click()
    cy.get('.row1 > .nav > .dropup:nth-child(3) > .dropdown-toggle > .ts-label').click()
    cy.get('.nav > .open > .dropdown-menu > li:nth-child(2) > a').click()

    cy.visit('/safetytips')
    cy.get('#myNavbar > .row1 > .nav > .li_no_bg > .ts-copy').click()
    cy.get('.navbar > .container > .navbar-header > a > img').click()

    cy.visit('')
 })
})
