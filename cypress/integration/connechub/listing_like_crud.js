
describe('Liking like CRUD...', function () {

    const userData = [
        {
            bio: 'Lorem ipsum dolor sit amet....',
            email: 'asdf+test@test.com',
            name: 'Test User ASDF',
            password: 'Cs^6^*HG$AKMowIskiwRF*P$lM6y4g*i'
        },
        {
            bio: '...consectetur adipiscing elit.',
            email: 'zxcv+test@test.com ZXCV',
            name: 'Test User',
            password: 'ruNK2QRddLk9#cKju#9rZYiu7chEaX0&nE'
        }
    ]

    const listingData = [
        {
            "category": "Sale",
            "sub_category": "Jewelry & Watches",
            "price": "24.68",
            "title": "Test Title",
            "city": "Tampa",
            "state": "FL",
            "zipcode": "33612",
            "description": "Test Description.",
            "fileupload": "24fps.mp4"
        },
        {
            "category": "Sale",
            "sub_category": "Sports & Outdoors",
            "price": "13.57",
            "title": "Updated Test Title",
            "city": "Clearwater",
            "state": "FL",
            "zipcode": "33612",
            "description": "Updated Test Description.",
            "fileupload": "24fps.mp4"
        }
    ]

    it('...creating a new listing, as user 0.', function () {
        cy.create_new_user(userData[0])
        cy.create_new_listing(listingData[0])
        cy.logout()
    })

    it('...like a listing, as a guest.', function () {
        cy.get('body > div:nth-child(8) > div > div:nth-child(10) > div > div:nth-child(1) > div.category_title > ul > li:nth-child(7) > a')
            .contains(listingData[0]['sub_category']).click()
        cy.get('div.grid > div > div.panel-footer.pin-content > div.name > b > a')
            .contains(listingData[0]['title']).click()

        const element = 'body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a'
        cy.get(element).invoke('text').invoke('trim').then((text1) => {
            cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a').click()
            cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a').contains(text1)
        })
    })

    it('...like a listing, as user 0.', function () {
        cy.login(userData[0])
        cy.get('body > div:nth-child(8) > div > div:nth-child(10) > div > div:nth-child(1) > div.category_title > ul > li:nth-child(7) > a')
            .contains(listingData[0]['sub_category']).click()
        cy.get('div.grid > div > div.panel-footer.pin-content > div.name > b > a')
            .contains(listingData[0]['title']).click()

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
        cy.visit('')
        cy.login() // log in as typical test user
        cy.get('body > div:nth-child(8) > div > div:nth-child(10) > div > div:nth-child(1) > div.category_title > ul > li:nth-child(7) > a')
            .contains(listingData[0]['sub_category']).click()
        cy.get('body > div:nth-child(8) > div.container_12 > div.leftbar_old.col-xs-6.col-sm-8.col-md-10 > div > div:nth-child(1) > div.panel-footer.pin-content > div.name > b > a')
            .contains(listingData[0]['title']).click()

            const element = 'body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a'
        cy.get(element).invoke('text').invoke('trim').then((text1) => {
            text1 = Number.parseInt(text1)
            var text2 = text1 + 1
            cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a').click()
            cy.get('body > div:nth-child(8) > div > div:nth-child(7) > div.hero-title > span > a').contains(text2)
        })

        cy.logout() // log out as typical test user
    })
})
