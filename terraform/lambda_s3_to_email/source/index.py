# source http://blog.rambabusaravanan.com/send-smtp-email-using-aws-lambda/
# source https://gist.github.com/rambabusaravanan/dfa2b80369c89ce7517855f4094367e6
# source https://pynative.com/python-mysql-database-connection/
# source https://www.isc.upenn.edu/accessing-mysql-databases-aws-python-lambda-function
# TODO split the email and promo handling into seperate Lambdas
# TODO connection pooling to the DB
import email.message
import os
import pymysql
import smtplib
import sys

def get_listing(sql_host, sql_user, sql_pass, sql_sche, event):

    try:
        connection = pymysql.connect(host=str(sql_host), user=str(sql_user), password=str(sql_pass), db=str(sql_sche))
        cursor = connection.cursor()
        cursor.execute(
            "SELECT id, ademail, media_file_name, subcategory_id, user_id FROM listings WHERE media_file_name = %s;",
            (
                str(event['Records'][0]['s3']['object']['key'])
            )
        )
        record = cursor.fetchone()
        print(record)
        cursor.close()
        connection.close()
    except:
        print("ERROR: Could not execute database logic for email sending.")
        sys.exit()

    return {'id' : record[0], 'ademail': record[1], 'media_file_name' : record[2], 'subcategory_id' : record[3], 'user_id' : record[4]}

def msg_content(app_env, listing):
    content = """
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
            <title>A message from ConnecHub.</title>
        </head>
        <body>
            Your listing is ready. <a href="https://""" + str(app_env) + """.connechub.com/listings/""" + str(listing['id']) + """" target="_new">Click here</a> to view it.
        </body>
    </html>
    """

    return content

def send_html_email(host, port, username, password, mail_from = 'admin@connechub.com', message = 'Placeholder message.', listing = {}):
    msg = email.message.Message()
    msg['Subject'] = 'A message from ConnecHub.'
    msg['From'] = mail_from
    msg['To'] = listing['ademail'] # user email
    msg.add_header('Content-Type', 'text/html')
    msg.set_payload(message)

    server = smtplib.SMTP(host, port)
    server.starttls()

    # Login Credentials for sending the mail
    server.login(username, password)
    server.sendmail(msg['From'], [msg['To']], msg.as_string())

def decrease_promo_counter(sql_host, sql_user, sql_pass, sql_sche,  listing = {}):
    '''
    Ref: https://www.terraform.io/docs/providers/aws/r/s3_bucket_notification.html
    NOTE: An S3 bucket can not have two notifications. The S3 Event _CAN_ trigger two Lambdas. Dont have time to refactor 3 TF modules. Stuffing it here for now.
    Decrease the promo counter in the user table IF:
    1) Listing was a paid list
    2) User.promo_1 > 0
    '''
    # try:
    connection = pymysql.connect(host=str(sql_host), user=str(sql_user), password=str(sql_pass), db=str(sql_sche))
    cursor = connection.cursor()

    # is the sub_cat of the listing a paid sub_cat?
    print('Determine if the listing is in a paid sub cat.')
    cursor.execute(
        "SELECT chargable FROM subcategories WHERE id = %s;",
        (
            int(listing['subcategory_id'])
        )
    )
    listing_sub_cat_charable = cursor.fetchone()
    print(listing_sub_cat_charable)

    if int(listing_sub_cat_charable[0]) == 0:
        print('Sub cat does not req. promo_1 logic.')
        return True

    print('Select user data.')
    cursor.execute(
        "SELECT id, promo_1 FROM users WHERE id = %s;",
        (
            int(listing['user_id'])
        )
    )
    user = cursor.fetchone()
    print(user)
    user = {'id' : user[0], 'promo_1': user[1]}

    # Decrease promo_1 counter by 1 if over 0
    if int(user['promo_1']) > 0:
        print('Decrease user.promo_1')
        counter = int(user['promo_1']) - 1
        print('User promo_1 counter after math: ' + str(counter))
        cursor.execute(
            "UPDATE users SET promo_1 = %s WHERE id = %s;",
            (
                counter,
                user['id']
            )
        )
        connection.commit()
    
    cursor.close()
    connection.close()
    # except:
    #     print("ERROR: Could not execute database logic for promo_1.")
    #     sys.exit()

    return True

def lambda_handler(event, context):
    smpt_host = os.environ['SMTP_HOST']
    smpt_port = os.environ['SMTP_PORT']
    smpt_user = os.environ['SMTP_USER']
    smpt_pass = os.environ['SMTP_PASS']

    mail_from = os.environ['SMTP_FROM']

    sql_host = os.environ['SQL_HOST']
    sql_user = os.environ['SQL_USER']
    sql_pass = os.environ['SQL_PASS']
    sql_sche = os.environ['SQL_SCHE']

    app_env  = os.environ['APP_ENV']
    app_name = os.environ['APP_NAME']

    print('Event data payload.')
    print(event)
    
    # get Listing data from DB
    listing = get_listing(sql_host, sql_user, sql_pass, sql_sche, event)

    # create message
    message = msg_content(app_env, listing)

    # send mail
    send_html_email(smpt_host, smpt_port, smpt_user, smpt_pass, mail_from, message, listing)

    # handling promo_1 counter
    promo_1 = decrease_promo_counter(sql_host, sql_user, sql_pass, sql_sche, listing)

    # function response
    return {'status': 'success', 'code': 200}
