describe('User password management functionality.', function () {

    const userData = [
        {
            name: 'Test User Reset Password',
            email: 'admin+reset_password@connechub.com',
            password: 'KcBnExf1mli@t1rgv2QA$ob%oP2R&@AwWRp^oeaYX9dRfrUGj8RJMYPPMLjyM931Pbz4%KvOq#cdln1!I7pxeg5Pv^htFT$QcWw',
            new_password: '%dcaQZ1D&U!^azafAMFDR#P10fO@!$i#*Q&VR0i5oFKV#GZX!vl2rlg1tno#Qv1WRM5ZhBIx4l5TPob1#Ho5hR&3z4L5KNV8DUj'
        }
    ]

    it('...reset and confirm new password on website.', function () {
        cy.create_user(userData[0]).view_user_profile()

        cy.get('#inside_view_left > div > a').contains('Edit Your Profile').click()

        cy.get('div.small-heading').contains('Optional')
        cy.get('div.small-heading').contains('The following two fields must match to change password.')
        cy.get('div.small-heading').contains('You will be prompted to log in with your new password after the change.')

        cy.get('#user_password').clear().type(userData[0].new_password)
        cy.get('#user_password_confirmation').clear().type(userData[0].new_password)
        cy.get('#profile_submit').click()
        
        cy.handle_splash_message('You need to sign in or sign up before continuing.', 'alert')
        cy.get('#user_email').clear().type(userData[0].email)
        cy.get('#user_password').clear().type(userData[0].new_password)
        cy.get('#new_user > fieldset > div:nth-child(2) > div > div:nth-child(3) > input').click()
        cy.handle_splash_message('Signed in successfully.', 'notice')

        cy.logout()
    })
})
