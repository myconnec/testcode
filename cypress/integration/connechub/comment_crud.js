/**
 * Create a new Listing
 * View Listing
 * Comment on Listing
 * Confirm comment is readable
 */
describe('Comment CRUD...', function () {

    const commentData = {
        "content": "This is a comment.",
        "url": ""
    }

    beforeEach(function () {
        cy.login()
    })

    afterEach(function () {
        cy.logout()
    })

    it('...creating a new comment.', function () {
        // create a new Listing
        cy.create_new_listing()
        
        cy.get('#navbar > ul > li.dropdown > a').contains('Your Account').should('be.visible').click()
        cy.get('#navbar > ul > li.dropdown.open > ul').contains('Your Profile').should('be.visible').click()

        cy.get('div.grid.transitions-enabled.masonry > div:nth-child(1) > div.panel-footer.pin-content > div.name > b > a')
            .contains('Test Title').click()

        cy.get('body > div:nth-child(8) > div > div:nth-child(6) > div.comments > h4').contains('Post a Comment')
        cy.get('#comment_body').clear().type(commentData.content)
        cy.get('#submit-btn').contains('Create Comment').click()
    })

    it('...reads a listing comment.', function () {
        cy.get('#navbar > ul > li.dropdown > a').contains('Your Account').should('be.visible').click()
        cy.get('#navbar > ul > li.dropdown.open > ul').contains('Your Profile').should('be.visible').click()

        cy.get('div.grid.transitions-enabled.masonry > div:nth-child(1) > div.panel-footer.pin-content > div.name > b > a')
            .contains('Test Title').click()
        cy.get('body > div:nth-child(8) > div > div:nth-child(6) > div.comments > small > b').contains('This post has 1 Comment')
        cy.get('body > div:nth-child(8) > div > div:nth-child(6) > div.comments > div > div > small').contains(commentData.content)
    })

    it('...reads a listing comment, as a guest.', function () {
        // guest asserts need to logout and login to leave the application in a known state
        cy.logout()
        cy.get('body > div:nth-child(8) > div > div:nth-child(10) > div > div:nth-child(4) > div:nth-child(5) > ul > li:nth-child(1) > a')
            .contains('Activities & Events').click()

        cy.get('div > div:nth-child(1) > div.panel-footer.pin-content > div.name > b > a')
            .contains('Test Title').click()
        cy.get('body > div:nth-child(8) > div > div:nth-child(6) > div.comments > small > b').contains('This post has 1 Comment')
        cy.get('body > div:nth-child(8) > div > div:nth-child(6) > div.comments > div > div > small').contains(commentData.content)
        cy.login()
    })

    // currently not able to update a comment
    // it('...updating a listing comment.', function () {
    // })

    // Currently not able to delete a comment
    // it('...deleting a listing comment.', function () {
    // })
})
