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
        cy.view_user_profile()
      
        cy.get('div > div > div > div.name > b > a').contains('Test Title').click()
        cy.get('div.comments > h4').contains('Post a Comment')
        cy.get('#comment_body').clear().type(commentData.content)
        cy.get('#submit-btn').contains('Create Comment').click()
    })

    it('...reads a listing comment.', function () {
        cy.view_user_profile()

        cy.get('div > div > div > div.name > b > a').contains('Test Title').click()
        cy.get('div.comments > small > b').contains('This post has 1 Comment')
        cy.get('div.comments > div > div > small').contains(commentData.content)
    })

    it('...reads a listing comment, as a guest.', function () {
        // guest asserts need to logout and login to leave the application in a known state
        cy.logout()

        cy.get('ul > li > a').contains('Activities & Events').click()
        cy.get('div.name > b > a').contains('Test Title').click()
        cy.get('div.comments > small > b').contains('This post has 1 Comment')
        cy.get('div.comments > div > div > small').contains(commentData.content)
        cy.login()
    })

    // currently not able to update a comment
    // it('...updating a listing comment.', function () {
    // })

    // Currently not able to delete a comment
    // it('...deleting a listing comment.', function () {
    // })
})
