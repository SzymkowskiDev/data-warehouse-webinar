import csv
from faker import Faker
import random
from datetime import datetime, timedelta

def write_to_csv(data, filename, headers=None):
    with open(filename, 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)
        if headers:
            writer.writerow(headers)
        writer.writerows(data)

# Dummy data for markets
markets_data = [(id + 1, iso_code) for id, iso_code in enumerate([
    'AF', 'AX', 'AL', 'DZ', 'AS', 'AD', 'AO', 'AI', 'AQ', 'AG', 'AR', 'AM', 'AW', 'AU', 'AT', 'AZ', 'BS', 'BH',
    'BD', 'BB', 'BY', 'BE', 'BZ', 'BJ', 'BM', 'BT', 'BO', 'BQ', 'BA', 'BW', 'BV', 'BR', 'IO', 'BN', 'BG', 'BF',
    'BI', 'CV', 'KH', 'CM', 'CA', 'KY', 'CF', 'TD', 'CL', 'CN', 'CX', 'CC', 'CO', 'KM', 'CG', 'CD', 'CK', 'CR',
    'CI', 'HR', 'CU', 'CW', 'CY', 'CZ', 'DK', 'DJ', 'DM', 'DO', 'EC', 'EG', 'SV', 'GQ', 'ER', 'EE', 'SZ', 'ET',
    'FK', 'FO', 'FJ', 'FI', 'FR', 'GF', 'PF', 'TF', 'GA', 'GM', 'GE', 'DE', 'GH', 'GI', 'GR', 'GL', 'GD', 'GP',
    'GU', 'GT', 'GG', 'GN', 'GW', 'GY', 'HT', 'HM', 'VA', 'HN', 'HK', 'HU', 'IS', 'IN', 'ID', 'IR', 'IQ', 'IE',
    'IM', 'IL', 'IT', 'JM', 'JP', 'JE', 'JO', 'KZ', 'KE', 'KI', 'KP', 'KR', 'KW', 'KG', 'LA', 'LV', 'LB', 'LS',
    'LR', 'LY', 'LI', 'LT', 'LU', 'MO', 'MK', 'MG', 'MW', 'MY', 'MV', 'ML', 'MT', 'MH', 'MQ', 'MR', 'MU', 'YT',
    'MX', 'FM', 'MD', 'MC', 'MN', 'ME', 'MS', 'MA', 'MZ', 'MM', 'NA', 'NR', 'NP', 'NL', 'NC', 'NZ', 'NI', 'NE',
    'NG', 'NU', 'NF', 'MP', 'NO', 'OM', 'PK', 'PW', 'PS', 'PA', 'PG', 'PY', 'PE', 'PH', 'PN', 'PL', 'PT', 'PR',
    'QA', 'RE', 'RO', 'RU', 'RW', 'BL', 'SH', 'KN', 'LC', 'MF', 'PM', 'VC', 'WS', 'SM', 'ST', 'SA', 'SN', 'RS',
    'SC', 'SL', 'SG', 'SX', 'SK', 'SI', 'SB', 'SO', 'ZA', 'GS', 'SS', 'ES', 'LK', 'SD', 'SR', 'SJ', 'SE', 'CH',
    'SY', 'TW', 'TJ', 'TZ', 'TH', 'TL', 'TG', 'TK', 'TO', 'TT', 'TN', 'TR', 'TM', 'TC', 'TV', 'UG', 'UA', 'AE',
    'GB', 'US', 'UM', 'UY', 'UZ', 'VU', 'VE', 'VN', 'VG', 'VI', 'WF', 'EH', 'YE', 'ZM', 'ZW'
])]
headers = ['market_id', 'iso_code']
write_to_csv(markets_data, 'warehouse/staging/markets.csv', headers=headers)

# Dummy data for products
products_data = [
    ('product_id', 'product_name', 'category_id', 'price'),
    (1, 'Laptop', 1, 999.99),
    (2, 'Smartphone', 1, 699.99),
    (3, 'Tablet', 1, 399.99),
    (4, 'Headphones', 2, 99.99),
    (5, 'Mouse', 2, 19.99),
    (6, 'Keyboard', 2, 49.99),
    (7, 'T-shirt', 3, 29.99),
    (8, 'Jeans', 3, 59.99),
    (9, 'Sneakers', 3, 79.99)
]
write_to_csv(products_data, 'warehouse/staging/products.csv')

# Dummy data for product categories
product_categories_data = [
    ('category_id', 'category_name'),
    (1, 'Electronics'),
    (2, 'Accessories'),
    (3, 'Apparel')
]
write_to_csv(product_categories_data, 'warehouse/staging/product_categories.csv')

# Function to generate customer data
def generate_customer_data(num_customers):
    customer_data = [('customer_id', 'market_id', 'name', 'email')]
    for id in range(1, num_customers + 1):
        name = f'Customer{id}'
        email = f'customer{id}@example.com'
        market_id = (id % 5) + 1
        customer_data.append((id, market_id, name, email))
    return customer_data
customers_data = generate_customer_data(123)
write_to_csv(customers_data, 'warehouse/staging/customers.csv')

import csv
import random
from datetime import datetime, timedelta

# Function to generate order data
def generate_order_data(num_orders):
    order_data = [('order_id', 'customer_id', 'order_date', 'amount')]
    for id in range(1, num_orders + 1):
        customer_id = (id % 123) + 1
        order_date = datetime.now() - timedelta(days=(id % 30) * 10)
        amount = round(random.random() * 1000 + 100, 2)
        order_data.append((id, customer_id, order_date.strftime('%Y-%m-%d'), amount))
    return order_data
orders_data = generate_order_data(500)
write_to_csv(orders_data, 'warehouse/staging/orders.csv')

# Function to generate order product data
def generate_order_product_data(num_order_products, num_orders, num_products):
    order_product_data = [('order_product_id', 'order_id', 'product_id', 'quantity')]
    for id in range(1, num_order_products + 1):
        order_id = random.randint(1, num_orders)
        product_id = random.randint(1, num_products)
        quantity = random.randint(1, 5)  # Assuming quantity ranges from 1 to 5
        order_product_data.append((id, order_id, product_id, quantity))
    return order_product_data
num_orders = 500  # Update with the actual number of orders
num_products = 9  # Update with the actual number of products
num_order_products = 1000  # Update with the desired number of order products
order_products_data = generate_order_product_data(num_order_products, num_orders, num_products)
write_to_csv(order_products_data, 'warehouse/staging/order_products.csv')