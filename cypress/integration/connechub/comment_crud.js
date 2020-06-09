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

    it('...creating a new comment.', function () {
        // create a new Listing
        cy.login().create_new_listing().view_user_profile()

        cy.get('div.grid > div > div.panel-footer.pin-content > div.name > b > a')
            .contains('Test Demo Title').click()

        cy.get('body > div:nth-child(8) > div > div:nth-child(6) > div.comments > h4').contains('Post a Comment')
        cy.get('#comment_body').clear().type(commentData.content)
        cy.get('#submit-btn').contains('Create Comment').click()
    })

    it('...reads a listing comment.', function () {
        cy.login()
        cy.get('div.grid > div > div.panel-footer.pin-content > div.name > b > a').contains('Test Demo Title').click()
        cy.get('body > div:nth-child(8) > div > div:nth-child(6) > div.comments > small > b').contains('This post has 1 Comment')
        cy.get('body > div:nth-child(8) > div > div:nth-child(6) > div.comments > div > div > small').contains(commentData.content)
        cy.logout()
    })

    it('...reads a listing comment, as a guest.', function () {
        cy.visit('')
        cy.get('div.main-content > div > div > div.panel-footer > div.name > b > a').contains('Test Demo Title').click()
        cy.get('body > div:nth-child(8) > div > div:nth-child(6) > div.comments > small > b').contains('This post has 1 Comment')
        cy.get('body > div:nth-child(8) > div > div:nth-child(6) > div.comments > div > div > small').contains(commentData.content)
    })

    // currently not able to update a comment
    // it('...updating a listing comment.', function () {
    // })

    // Currently not able to delete a comment
    // it('...deleting a listing comment.', function () {
    // })
})
