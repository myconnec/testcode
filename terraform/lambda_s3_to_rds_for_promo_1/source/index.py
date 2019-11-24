import os
import pymysql
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

def lambda_handler(event, context):
    sql_host = os.environ['SQL_HOST']
    sql_user = os.environ['SQL_USER']
    sql_pass = os.environ['SQL_PASS']
    sql_sche = os.environ['SQL_SCHE']

    app_env  = os.environ['APP_ENV']
    app_name = os.environ['APP_NAME']

    # get Listing data from DB
    listing = get_listing(sql_host, sql_user, sql_pass, sql_sche, event)

    # function response
    return {'status': 'success', 'code': 200}
