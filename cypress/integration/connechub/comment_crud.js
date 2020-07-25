/**
 * Create a new Listing
 * View Listing
 * Comment on Listing
 * Confirm comment is readable
 */
describe('Comment CRUD...', function () {

    const commentData = {
        "content": "This is a comment."
    }

    const listingData = [
        {
            "category": "Campus",
            "sub_category": "Activities & Events",
            "condition": 'Average',
            "price": "90.12",
            "title": "Test Title Comment CRUD",
            "city": "Tampa",
            "state": "FL",
            "zipcode": "33612",
            "description": "Test Description Comment CRUD",
            "fileupload": "24fps.mp4"
        }
    ]

    const userData = [
        {
            name: 'Test User Comment Crud',
            email: 'test+comment_crud@connechub.com',
            password: 'lsdlkfjasfh@#$%'
        }
    ]

    it('...creating a new comment.', function () {
        // create a new Listing
        cy.create_user(userData[0]).create_listing(listingData[0])
        cy.get('a').contains(listingData[0].title).click()
        cy.get('div.comments > h4').contains('Post a Comment')
        cy.get('#comment_body').type(commentData.content)
        cy.get('#submit-btn').contains('Create Comment').click()
        cy.logout()
    })

    it('...reads a listing comment.', function () {
        cy.login(userData[0])
        cy.get('a').contains(listingData[0].title).click()
        cy.get('div.comments > small > b').contains('This post has 1 Comment')
        cy.get('div.comments > div > div > small').contains(commentData.content)
        cy.logout()
    })

    it('...reads a listing comment, as a guest.', function () {
        cy.visit('')
        cy.get('a').contains(listingData[0].title).click()
        cy.get('div.comments > small > b').contains('This post has 1 Comment')
        cy.get('div.comments > div > div > small').contains(commentData.content)
    })

    // currently not able to update a comment
    // it('...updating a listing comment.', function () {
    // })

    // Currently not able to delete a comment
    // it('...deleting a listing comment.', function () {
    // })
})
