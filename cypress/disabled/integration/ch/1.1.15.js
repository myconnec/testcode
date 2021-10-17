/**
 * Release 1.1.15 changes
 */
describe('Release 1.1.15 changes ...', function () {

    const listingData = [
        {
            "category": "Housing",
            "sub_category": "Apartments",
            "price": "123.00",
            "condition": "Excellent",
            "title": "Test Subcategory ad count 0",
            "city": "Tampa",
            "state": "FL",
            "zipcode": "33612",
            "description": "Test SubCategory count 0.",
            "fileupload": "24fps.mp4"
        },
        {
            "category": "Housing",
            "sub_category": "Apartments",
            "price": "456.00",
            "condition": "Excellent",
            "title": "Test Subcategory ad count 1",
            "city": "Tampa",
            "state": "FL",
            "zipcode": "33612",
            "description": "Test SubCategory count 1.",
            "fileupload": "24fps.mp4"
        },
        {
            "category": "Housing",
            "sub_category": "Apartments",
            "price": "789.00",
            "condition": "Excellent",
            "title": "Test Subcategory ad count 2",
            "city": "Tampa",
            "state": "FL",
            "zipcode": "33612",
            "description": "Test SubCategory count 2.",
            "fileupload": "24fps.mp4"
        },
    ]

    const userData = [
        {
            name: 'Test User OneOneFifteen',
            email: 'admin+deployment_1_1_15_test_user@connechub.com',
            password: 'R#vNLo0Wu#gcSo6eFf3*V$H&WijHp@J&8%k$R3rToYIXnurmGG4pvggsy$5twhg*#zJ@y2!l&CenIYJ57dAI4tzC1bKO4tay0@X'
        }
    ]

    // Incorrect ad count
    // https://trello.com/c/niiELgkp/110-incorrect-ad-count
    it('...Incorrect ad count', function () {
        cy.create_user(userData[0])
        cy.create_listing(listingData[0]).create_listing(listingData[1]).create_listing(listingData[2])
        cy.visit('/categories/3')
        cy.get('ul > li:nth-child(1) > span').contains('3')
        cy.delete_listing(listingData[0]).delete_listing(listingData[2])
        cy.visit('/categories/3')
        cy.get('ul > li:nth-child(1) > span').contains('1')
        cy.logout()
    })
})
