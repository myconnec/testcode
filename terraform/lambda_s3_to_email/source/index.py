# source http://blog.rambabusaravanan.com/send-smtp-email-using-aws-lambda/
# source https://gist.github.com/rambabusaravanan/dfa2b80369c89ce7517855f4094367e6
# source https://pynative.com/python-mysql-database-connection/
# source https://www.isc.upenn.edu/accessing-mysql-databases-aws-python-lambda-function
import email.message
import os
import pymysql
import smtplib
import sys

def get_listing(sql_host, sql_user, sql_pass, sql_sche, event):

    try:
        connection = pymysql.connect(host=str(sql_host), user=str(sql_user), password=str(sql_pass), db=str(sql_sche))
        db_info = connection.get_server_info()
        cursor = connection.cursor()
        cursor.execute("SELECT id, ademail, media_file_name FROM listings WHERE media_file_name = '" + event['Records'][0]['s3']['object']['key'] + "';")
        record = cursor.fetchone()
        cursor.close()
        connection.close()
    except:
        print("ERROR: Could not connect to MySql instance.")
        sys.exit()

    return {'id' : record[0], 'ademail': record[1], 'media_file_name' : record[2]}

def msg_content(listing, app_env):
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

    # get Listing data from DB
    listing = get_listing(sql_host, sql_user, sql_pass, sql_sche, event)

    # create message
    message = msg_content(listing, app_env)

    # send mail
    send_html_email(smpt_host, smpt_port, smpt_user, smpt_pass, mail_from, message, listing)

    # function response
    return {'status': 'success', 'code': 200}
