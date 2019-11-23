import os
import pymysql
import sys

def get_listing(db_conn, event):

    cursor = connection.cursor()
    cursor.execute("SELECT id, sub_category, user_id FROM listings WHERE media_file_name = '" + event['Records'][0]['s3']['object']['key'] + "';")
    record = cursor.fetchone()
    cursor.close()

    return {'id' : record[0], 'sub_category': record[1], 'user_id' : record[2]}

def get_user(db_conn, listing_data):

    cursor = connection.cursor()
    cursor.execute("SELECT id, promo_1 FROM users WHERE id = '" + int(listing_data[2]) + "';")
    record = cursor.fetchone()
    cursor.close()

    return {'id' : record[0], 'promo_1': record[1]}

def process_promo_count(db_conn, listing_data, user_data):
    '''
    If the listing is a paid sub_cat, and the user has a promo counter > 0; decrease user promo counter by 1
    '''
    if int(user_data.promo_1) > 0:
        user_data.promo_1 = int(user_data.promo_1) - 1

        cursor = connection.cursor()
        cursor.execute("UPDATE users SET promo_1 = '" + user_data.promo_1 + "' WHERE id = '" + int(listing_data[2]) + "';")
        record = cursor.fetchone()
        cursor.close()

    return {'id' : record[0], 'promo_1': record[1]}

def lambda_handler(event, context):
    app_env  = str(os.environ['APP_ENV'])
    app_name = str(os.environ['APP_NAME'])
    sql_host = str(os.environ['SQL_HOST'])
    sql_pass = str(os.environ['SQL_PASS'])
    sql_sche = str(os.environ['SQL_SCHE'])
    sql_user = str(os.environ['SQL_USER'])

    db_conn = pymysql.connect(
        host = sql_host,
        user = sql_user,
        password = sql_pass,
        db = sql_sche
    )

    # get Listing data from DB
    listing_data = get_listing(db_conn, event)
    user_data = get_user(db_conn, listing_data)
    process_promo_count(db_conn, listing_data, user_data)

    db_conn.close()

    # function response
    return {'status': 'success', 'code': 200}
