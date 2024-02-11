DROP TABLE IF EXISTS orders CASCADE;
CREATE TABLE IF NOT EXISTS orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    order_date DATE,
    amount MONEY
);

DROP TABLE IF EXISTS products CASCADE;
CREATE TABLE IF NOT EXISTS products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    category_id INTEGER,
    price MONEY
);

DROP TABLE IF EXISTS order_products CASCADE;
CREATE TABLE IF NOT EXISTS order_products (
    order_product_id SERIAL PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER
);

DROP TABLE IF EXISTS product_categories CASCADE;
CREATE TABLE IF NOT EXISTS product_categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255)
);

DROP TABLE IF EXISTS customers CASCADE;
CREATE TABLE IF NOT EXISTS customers (
    customer_id SERIAL PRIMARY KEY,
        market_id INTEGER,
    name VARCHAR(255),
    email VARCHAR(255)
);

DROP TABLE IF EXISTS markets CASCADE;
CREATE TABLE IF NOT EXISTS markets (
    market_id SERIAL PRIMARY KEY,
    iso_code VARCHAR(2)
);

-- Add foreign key constraint
-- ALTER TABLE orders ADD CONSTRAINT fk_orders_customer_id FOREIGN KEY (customer_id) REFERENCES customers(customer_id);
-- ALTER TABLE products ADD CONSTRAINT fk_products_category_id FOREIGN KEY (category_id) REFERENCES product_categories(category_id);
-- ALTER TABLE order_products ADD CONSTRAINT fk_order_products_order_id FOREIGN KEY (order_id) REFERENCES orders(order_id);
-- ALTER TABLE order_products ADD CONSTRAINT fk_order_products_product_id FOREIGN KEY (product_id) REFERENCES products(product_id);
-- ALTER TABLE customers ADD CONSTRAINT fk_customers_market_id FOREIGN KEY (market_id) REFERENCES markets(market_id);
