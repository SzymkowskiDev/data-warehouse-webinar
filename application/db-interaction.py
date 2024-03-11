import json
import psycopg2
from ddl import ddl
from gen_data import gen_data

def lambda_handler(event, context):

    conn = psycopg2.connect(
        database = "retail_app_db",
        host = "database-1.cnwcummcolsk.eu-central-1.rds.amazonaws.com",
		user = "postgres",
		password = "Masmix!123Ponton",
		port = "5432")
    cursor = conn.cursor()
    
    # cursor.execute("SELECT * FROM markets;")
    # print(cursor.fetchall())
    # cursor.execute("SELECT * FROM product_categories;")
    # print(cursor.fetchall())
    # cursor.execute("SELECT * FROM customers;")
    # print(cursor.fetchall())
    # cursor.execute("SELECT * FROM products;")
    # print(cursor.fetchall())
    # cursor.execute("SELECT * FROM order_products;")
    # print(cursor.fetchall())
    # cursor.execute("SELECT * FROM orders;")
    # print(cursor.fetchall())
    
    #cursor.execute("INSERT INTO product_categories (category_name) VALUES ('Other');")
    
    cursor.execute("select * from information_schema.tables;")
    print(cursor.fetchall())
    
    conn.commit()
    conn.close()

    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }
