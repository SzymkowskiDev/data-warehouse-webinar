CREATE TABLE IF NOT EXISTS fact_orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    market_id INTEGER,
    date_id INTEGER,
    amount MONEY
);

CREATE TABLE IF NOT EXISTS dim_date (
    date_id SERIAL PRIMARY KEY,
    order_date DATE
);

CREATE TABLE IF NOT EXISTS dim_products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    category_id INTEGER,
    price MONEY
);

CREATE TABLE IF NOT EXISTS order_products (
    order_product_id SERIAL PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER
);

CREATE TABLE IF NOT EXISTS dim_product_categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS dim_customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS dim_markets (
    market_id SERIAL PRIMARY KEY,
    iso_code VARCHAR(2)
);

-- Add foreign key constraint
-- ALTER TABLE fact_orders ADD CONSTRAINT fk_fact_orders_customer_id FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id);
-- ALTER TABLE dim_dates ADD CONSTRAINT fk_dim_dates_date_id FOREIGN KEY (date_id) REFERENCES dim_dates(date_id);
-- ALTER TABLE dim_markets ADD CONSTRAINT fk_dim_markets_market_id FOREIGN KEY (market_id) REFERENCES dim_markets(market_id);
-- ALTER TABLE dim_products ADD CONSTRAINT fk_dim_products_category_id FOREIGN KEY (category_id) REFERENCES dim_product_categories(category_id);
-- ALTER TABLE order_products ADD CONSTRAINT fk_order_products_order_id FOREIGN KEY (order_id) REFERENCES fact_orders(order_id);
-- ALTER TABLE order_products ADD CONSTRAINT fk_order_products_product_id FOREIGN KEY (product_id) REFERENCES dim_products(product_id);