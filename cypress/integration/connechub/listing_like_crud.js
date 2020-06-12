
describe('Liking like CRUD...', function () {

    const userData = [
        {
            bio: 'Lorem ipsum dolor sit amet....',
            email: 'asdf+test@connechub.com',
            name: 'Test User ASDF',
            password: 'Cs^6^*HG$AKMowIskiwRF*P$lM6y4g*i'
        },
        {
            bio: '...consectetur adipiscing elit.',
            email: 'zxcv+test@connechub.com ZXCV',
            name: 'Test User',
            password: 'ruNK2QRddLk9#cKju#9rZYiu7chEaX0&nE'
        }
    ]

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

    it('...creating a new listing, as user 0.', function () {
        cy.create_new_user(userData[0])
        cy.create_new_listing(listingData[0])
        cy.logout()
    })

    it('...like a listing, as a guest.', function () {
        cy.visit('')
        cy.get('div.main-content > div > div > div.pin-content > div.name > b > a').contains(listingData[0]['title']).click()

        const element = 'body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a'
        cy.get(element).invoke('text').invoke('trim').then((text1) => {
            cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a').click()
            cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a').contains(text1)
        })
    })

    it('...like a listing, as user 0.', function () {
        cy.login(userData[0])
        cy.get('div.main-content > div > div > div.pin-content > div.name > b > a').contains(listingData[0]['title']).click()

        const element = 'body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a'
        cy.get(element).invoke('text').invoke('trim').then((text1) => {
            text1 = Number.parseInt(text1)
            var text2 = text1 + 1
            cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a').click()
            cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a').contains(text2)
        })

        cy.logout()
    })

    it('...like a listing, as user 1.', function () {
        // log in as typical test user
        cy.login()

        cy.get('div.main-content > div > div > div.pin-content > div.name > b > a').contains(listingData[0]['title']).click()

        const element = 'body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a'
        cy.get(element).invoke('text').invoke('trim').then((text1) => {
            text1 = Number.parseInt(text1)
            var text2 = text1 + 1
            cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a').click()
            cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a').contains(text2)
        })

        // log out as typical test user
        cy.logout()
    })
})
