/**Cypress recorder 0.0.3
 * help
 * settings
 */
describe('test_name', function() {

 it('what_it_does', function() {

    cy.viewport(1920, 976)
 
    cy.visit('https://int.connechub.com/')
 
    cy.visit('https://int.connechub.com/')
 
    cy.get('.container > #navbar > .nav > li:nth-child(1) > a').click()
 
    cy.visit('https://int.connechub.com/users/sign_in')
 
    cy.get('.row > .col-sm-12 > .form-group > .input-group > #user_email').type('test@test.com')
 
    cy.get('.row > .col-sm-12 > .form-group > .input-group > #user_password').type('testtest')
 
    cy.get('fieldset > .row > .col-sm-12 > .form-group > .btn').click()
 
    cy.visit('https://int.connechub.com/')
 
    cy.get('.container > #navbar > .nav > li:nth-child(3) > a').click()
 
    cy.visit('https://int.connechub.com/')
 
    cy.get('.container > #navbar > .nav > li:nth-child(1) > a').click()
 
    cy.visit('https://int.connechub.com/users/sign_in')
 
    cy.get('.row > .col-sm-6 > .panel > .panel-footer > a:nth-child(3)').click()
 
    cy.visit('https://int.connechub.com/users/password/new')
 
    cy.get('.row > .col-sm-12 > .form-group > .input-group > #user_email').type('test@test.com')
 
    cy.get('fieldset > .row > .col-sm-12 > .form-group > .btn').click()
 
    cy.visit('https://int.connechub.com/users/sign_in')
 
    cy.get('.row > .col-sm-12 > .form-group > .input-group > #user_email').type('test@test.com')
 
    cy.get('.row > .col-sm-12 > .form-group > .input-group > #user_password').type('testtest')
 
    cy.get('fieldset > .row > .col-sm-12 > .form-group > .btn').click()
 
    cy.visit('https://int.connechub.com/')
 
    cy.get('.container > #navbar > .nav > .dropdown > .dropdown-toggle').click()
 
    cy.get('.nav > .dropdown > .dropdown-menu > li:nth-child(1) > a').click()
 
    cy.visit('https://int.connechub.com/users/edit')
 
    cy.get('.panel > .panel-body > #edit_user > .input-group > #user_email').click()
 
    cy.get('.panel > .panel-body > #edit_user > .input-group > #user_email').click()
 
    cy.get('.panel > .panel-body > #edit_user > .input-group > #user_bio').click()
 
    cy.get('.panel > .panel-body > #edit_user > .input-group > #user_current_password').click()
 
    cy.get('.panel > .panel-body > #edit_user > .input-group > #user_current_password').type('testtest')
 
    cy.get('.panel > .panel-body > #edit_user > .input-group > #user_password').click()
 
    cy.get('.panel > .panel-body > #edit_user > .form-group > .btn').click()
 
    cy.visit('https://int.connechub.com/')
 
    cy.get('.container > #navbar > .nav > li > .post').click()
 
    cy.visit('https://int.connechub.com/listings/new')
 
    cy.get('.panel-body > #new_listing > .input-group > .form-control > #listing_category_id').select('1')
 
    cy.get('.panel-body > #new_listing > .input-group > .form-control > #listing_category_id').click()
 
    cy.get('.panel-body > #new_listing > .input-group > .form-control > #listing_subcategory_id').select('1')
 
    cy.get('.panel > .panel-body > #new_listing > .input-group > #listing_price').type('12.50')
 
    cy.get('.panel > .panel-body > #new_listing > .input-group > #listing_title').type('Test Title Cypress')
 
    cy.get('.panel > .panel-body > #new_listing > .input-group > #listing_state').type('Fl')
 
    cy.get('.panel > .panel-body > #new_listing > .input-group > #listing_state').type('FL')
 
    cy.visit('https://int.connechub.com/listings/upload/17')
 
    cy.get('.row > .panel > .panel-body > #new_listing_upload > #fileupload').click()
 
    cy.get('.row > .panel > .panel-body > #new_listing_upload > #fileupload').type('C:\fakepath\24~!@#$%^&*()_+ fps.MP4')
 
    cy.get('.panel > .panel-body > .input-group > .actions > #listings_submit').click()
 
    cy.visit('https://int.connechub.com/')
 
    cy.get('.col > .category_title:nth-child(5) > ul > .landing_page:nth-child(1) > a').click()
 
    cy.visit('https://int.connechub.com/categories/1/subcategories/1')
 
    cy.get('.panel:nth-child(1) > .panel-footer > .name > b > a').click()
 
    cy.visit('https://int.connechub.com/listings/17')
 
    cy.get('.container > .container_12 > .grid_6 > div > a:nth-child(3)').click()
 
    cy.visit('https://int.connechub.com/listings/17/edit')
 
    cy.get('.panel-body > #edit_listing_17 > .input-group > .form-control > #listing_category_id').select('2')
 
    cy.get('.panel-body > #edit_listing_17 > .input-group > .form-control > #listing_category_id').click()
 
    cy.get('.panel-body > #edit_listing_17 > .input-group > .form-control > #listing_subcategory_id').select('8')
 
    cy.visit('https://int.connechub.com/listings/17')
 
    cy.get('.container_12 > .grid_6 > .comments > #new_comment > #comment_body').click()
 
    cy.visit('https://int.connechub.com/listings/17')
 
    cy.get('.container_12 > .grid_6 > .text-muted > small > a').click()
 
    cy.visit('https://accounts.google.com/signin/v2/identifier?service=mail&passive=true&rm=false&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F%3Fextsrc%3Dmailto%26url%3Dmailto%3Aadmin%40connechub.com%3Fsubject%253DReporting%252520Post%25252017%2526body%253DI%252520would%252520like%252520to%252520report%252520this%252520ConnecHub%252520post%252520for%252520violating%252520the%252520TOS%252520%2F%252520EULA%252520or%252520other%252520reason%252520(please%252520explain).&scc=1&ltmpl=default&ltmplcache=2&emr=1&osid=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin')
 
    cy.get('.post-metadata:nth-child(1) > .post-info > .post-title > span > a').click()
 
    cy.visit('https://int.connechub.com/test')
 
    cy.get('.nav > .open > .dropdown-menu > li:nth-child(1) > a').click()
 
    cy.visit('https://int.connechub.com/career')
 
    cy.get('.row1 > .nav > .dropup:nth-child(1) > .dropdown-toggle > .ts-label').click()
 
    cy.get('.nav > .open > .dropdown-menu > li:nth-child(2) > a').click()
 
    cy.visit('https://int.connechub.com/about')
 
    cy.visit('https://int.connechub.com/howitworks/index')
 
    cy.visit('https://int.connechub.com/prices/index')
 
    cy.get('.row1 > .nav > .dropup:nth-child(2) > .dropdown-toggle > .ts-label').click()
 
    cy.get('.nav > .open > .dropdown-menu > li:nth-child(1) > a').click()
 
    cy.visit('https://int.connechub.com/terms')
 
    cy.visit('https://int.connechub.com/prices/index')
 
    cy.get('.nav > .open > .dropdown-menu > li:nth-child(2) > a').click()
 
    cy.visit('https://int.connechub.com/privacy')
 
    cy.get('.nav > .open > .dropdown-menu > li:nth-child(3) > a').click()
 
    cy.visit('https://int.connechub.com/postterm')
 
    cy.get('.nav > .open > .dropdown-menu > li:nth-child(1) > a').click()
 
    cy.visit('https://int.connechub.com/faq')
 
    cy.get('#myNavbar > .row1 > .nav > .dropup:nth-child(3) > .dropdown-toggle').click()
 
    cy.get('body').click()
 
    cy.get('.container > .container > .panel:nth-child(4) > .panel-heading > .small-heading').click()
 
    cy.get('.panel:nth-child(4) > .panel-heading > .small-heading > .pull-right > .glyphicon').click()
 
    cy.get('.panel:nth-child(24) > .panel-heading > .small-heading > .pull-right > .glyphicon').click()
 
    cy.get('#myNavbar > .row1 > .nav > .dropup:nth-child(3) > .dropdown-toggle').click()
 
    cy.get('.nav > .open > .dropdown-menu > li:nth-child(2) > a').click()
 
    cy.visit('https://int.connechub.com/safetytips')
 
    cy.get('.navbar > .container > .navbar-header > a > img').click()
 
    cy.visit('https://int.connechub.com/')
 
    cy.get('.section > .col:nth-child(2) > .catg_title:nth-child(1) > strong > a').click()
 
    cy.visit('https://int.connechub.com/categories/2')
 
    cy.get('.rightbar0 > .categories1 > .categories > li:nth-child(5) > a').click()
 
    cy.visit('https://int.connechub.com/categories/5')
 
    cy.get('.rightbar > .rightbar-top > .form-inline > .space > #search').click()
 
    cy.get('.rightbar > .rightbar-top > .form-inline > .space > #search').type('test')
 
    cy.get('.rightbar > .rightbar-top > .form-inline > .space > #category').select('2')
 
    cy.visit('https://int.connechub.com/listings/search?utf8=%E2%9C%93&search=test&category=2&commit=SEARCH')
 
    cy.get('.panel > .panel-footer > .name > b > a').click()
 
    cy.visit('https://int.connechub.com/listings/17')
 
    cy.get('.container > .container_12 > .grid_6 > div > a:nth-child(2)').click()
 
    cy.visit('https://int.connechub.com/')
 
    cy.get('.container > #navbar > .nav > li:nth-child(3) > a').click()
 
    cy.visit('https://int.connechub.com/')
 
 })

})