# source http://blog.rambabusaravanan.com/send-smtp-email-using-aws-lambda/ https://gist.github.com/rambabusaravanan/dfa2b80369c89ce7517855f4094367e6
import smtplib
import os

# Create the plain-text and HTML version of your message
def craft_message():
    # body = body + " filename: <a href=\"https://connechub.com/listings/" + event['Records'][0]['s3']['object']['key'] + "\" target=\"_new\">." 

    message = MIMEMultipart("alternative")

    text = """\
    Hi,
    How are you?
    ConnecHub has many great Listings!
    https://connechub.com"""

    html = """\
    <html>
    <body>
        <p>Hi,<br>
        How are you?<br>
        <a href="https://connechub.com">ConnecHub</a> 
        has many great Listings!
        </p>
    </body>
    </html>
    """

    # Turn these into plain/html MIMEText objects
    part1 = MIMEText(text, "plain")
    part2 = MIMEText(html, "html")

    # Add HTML/plain-text parts to MIMEMultipart message
    # The email client will try to render the last part first
    message.attach(part1)
    message.attach(part2)

    return message

def send_email(host, port, username, password, subject, body, mail_to, message, mail_from = None, reply_to = None):
    if mail_from is None: mail_from = username
    if reply_to is None: reply_to = mail_to

    message = """From: %s\nTo: %s\nReply-To: %s\nSubject: %s\n\n%s""" % (mail_from, mail_to, reply_to, subject, body)
    print (message)
    try:
        server = smtplib.SMTP(host, port)
        server.ehlo()
        server.starttls()
        server.login(username, password)
        server.sendmail(mail_from, mail_to, message)
        server.close()
        return True
    except Exception as ex:
        print (ex)
        return False

def lambda_handler(event, context):

    # initialize variables
    # body = event['body']
    # reply_to = event['queryStringParameters'].get('reply')
    # subject = event['queryStringParameters']['subject']
    body = os.environ['SMTPBODY']
    host = os.environ['SMTPHOST']
    mail_from = os.environ.get('MAIL_FROM')
    mail_from = os.environ['SMTPREPLYTO']
    mail_to = os.environ['MAIL_TO']     # separate multiple recipient by comma. eg: "abc@gmail.com, xyz@gmail.com"
    origin = os.environ.get('ORIGIN')
    password = os.environ['PASSWORD']
    port = os.environ['SMTPPORT']
    reply_to = os.environ['SMTPREPLYTO']
    subject = os.environ['SMTPSUBJECT']
    username = os.environ['USERNAME']
    message = craft_message()

    # send mail
    return send_email(host, port, username, password, subject, body, mail_to, message, mail_from, reply_to)
