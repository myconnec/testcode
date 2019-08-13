# source http://blog.rambabusaravanan.com/send-smtp-email-using-aws-lambda/
# source https://gist.github.com/rambabusaravanan/dfa2b80369c89ce7517855f4094367e6
import email.message
import os
import smtplib

def msg_content():
    content = """
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
            <title>A message from ConnecHub.</title>
        </head>
        <body>
            Your listing is ready. <a href="https://www.connechub.com/listings" target="_new">Click here</a> to view it.
        </body>
    </html>
    """

    return content

# def send_html_email(host, port, username, password, subject, body, mail_to, message, mail_from = None, reply_to = None):
def send_html_email(host, port, username, password, mail_to, mail_from = 'admin@connechub.com'):
   
    message = 'A message fromo ConnecHub.'

    msg = email.message.Message()
    msg['Subject'] = 'A message from ConnecHub.'
    msg['From'] = mail_from
    msg['To'] = mail_to
    msg.add_header('Content-Type', 'text/html')
    msg.set_payload(msg_content())

    server = smtplib.SMTP(host, port)
    server.starttls()
    
    # Login Credentials for sending the mail
    server.login(username, password)
    server.sendmail(msg['From'], [msg['To']], msg.as_string())

def lambda_handler(event, context):
    host = os.environ['SMTPHOST']
    port = os.environ['SMTPPORT']
    username = os.environ['USERNAME']
    password = os.environ['PASSWORD']

    mail_from = os.environ['SMTPREPLYTO']
    mail_to = os.environ['MAIL_TO']

    # send mail
    #  def send_html_email(host, port, username, password, subject, body, mail_to, message, mail_from, reply_to):
    return send_html_email(host, port, username, password, mail_to, mail_from)
