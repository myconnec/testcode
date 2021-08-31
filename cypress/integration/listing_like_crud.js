
describe('Liking like CRUD...', function () {

    const listingData = [
        {
            "category": "Sale",
            "sub_category": "Jewelry & Watches",
            "price": "24.68",
            "title": "Test Listing Liking Title",
            "city": "Tampa",
            "state": "FL",
            "zipcode": "33612",
            "description": "Test Listing Liking Description.",
            "fileupload": "24fps.mp4"
        }
    ]

    const userData = [
        {
            bio: 'Lorem ipsum dolor sit amet....',
            email: 'admin+likeing_like_crud_zero@connechub.com',
            name: 'Test User Liking Listing 0',
            password: 'Cs^6^*HG$AKMowIskiwRF*P$lM6y4g*i'
        },
        {
            bio: '...consectetur adipiscing elit.',
            email: 'admin+liking_like_crud_one@connechub.com',
            name: 'Test User Liking Listing 1',
            password: 'ruNK2QRddLk9#cKju#9rZYiu7chEaX0&nE'
        }
    ]

    // it('...creating a new listing, as user 0.', function () {
    //     cy.create_user(userData[0]).create_listing(listingData[0]).logout()
    // })

    // // only signed in users can like a listing
    // it('...like a listing, as user 0.', function () {
    //     cy.create_user(userData[0]).create_listing(listingData[0]).visit('')

    //     cy.get('div.main-content > div > div > div.pin-content > div.name > b > a').contains(listingData[0]['title']).click()
    //     cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a').click()
    //     cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span').contains(1)

    //     cy.logout()
    // })

    // it('...like a listing, as a guest.', function () {
    //     cy.create_user(userData[0]).create_listing(listingData[0]).logout()

    //     cy.visit('')
    //     cy.get('div.main-content > div > div > div.pin-content > div.name > b > a').contains(listingData[0]['title']).click()
    //     cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a').click()
    //     cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a').contains(1)
    // })

    it('...like a listing, as user 1.', function () {
        cy.create_user(userData[0]).logout()
        //.create_listing(listingData[0])
        // cy.create_user(userData[1])

        // cy.visit('')
        // cy.get('div.main-content > div > div > div.pin-content > div.name > b > a').contains(listingData[0]['title']).click()
        // cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a').click()
        // cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a').contains(2)

        // cy.logout()
    })
})
