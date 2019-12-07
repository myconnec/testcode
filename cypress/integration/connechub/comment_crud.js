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
        commentData.url = cy.url()

        // cy.get('#navbar > ul > li.dropdown > a').contains('Your Account').should('be.visible').click()
        // cy.get('#navbar > ul > li.dropdown.open > ul').contains('Your Profile').should('be.visible').click()

        // cy.get('body > div:nth-child(8) > div > div:nth-child(6) > div.comments > h4').contains('Post a Comment')
        // cy.get('#comment_body').clear().type(commentData.content)
        // cy.get('#submit-btn').contains('submit').click
    })

    // it('...reads a listing.', function () {
    //     cy.visit(commentData.url)
    //     cy.get('body > div:nth-child(8) > div > div:nth-child(6) > div.comments > small > b').contains('This post has 1 Comment')
    //     cy.get('body > div:nth-child(8) > div > div:nth-child(6) > div.comments > div > div > small').contains(commentData.content)
    // })

    // currently not able to update a comment
    // it('...updating a listing data.', function () {
    // })

    // Currently not able to delete a comment
    // it('...deleting a listing.', function () {
    // })
})
