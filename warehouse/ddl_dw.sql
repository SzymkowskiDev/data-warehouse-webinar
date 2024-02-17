-- linking table variant

CREATE TABLE fact_orders (
    order_id INTEGER IDENTITY(1,1) PRIMARY KEY, -- SERIAL not supported use IDENTITY instead
    customer_id INTEGER,
    market_id INTEGER,
    date_id INTEGER,
    amount DECIMAL(10,2)  -- MONEY data type is not supported, use DECIMAL instead
);

CREATE TABLE dim_date (
    date_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    order_date DATE
);

CREATE TABLE dim_products (
    product_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    product_name VARCHAR(255),
    category_id INTEGER,
    price DECIMAL(10,2)  -- MONEY data type is not supported, use DECIMAL instead
);

CREATE TABLE order_products (
    order_product_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER
);

CREATE TABLE dim_product_categories (
    category_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    category_name VARCHAR(255)
);

CREATE TABLE dim_customers (
    customer_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE dim_markets (
    market_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    iso_code VARCHAR(2)
);

-- Add foreign key constraints
ALTER TABLE fact_orders ADD CONSTRAINT fk_fact_orders_customer_id FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id);
ALTER TABLE fact_orders ADD CONSTRAINT fk_fact_orders_market_id FOREIGN KEY (market_id) REFERENCES dim_markets(market_id);
ALTER TABLE fact_orders ADD CONSTRAINT fk_fact_orders_date_id FOREIGN KEY (date_id) REFERENCES dim_date(date_id);
ALTER TABLE dim_products ADD CONSTRAINT fk_dim_products_category_id FOREIGN KEY (category_id) REFERENCES dim_product_categories(category_id);
ALTER TABLE order_products ADD CONSTRAINT fk_order_products_order_id FOREIGN KEY (order_id) REFERENCES fact_orders(order_id);
ALTER TABLE order_products ADD CONSTRAINT fk_order_products_product_id FOREIGN KEY (product_id) REFERENCES dim_products(product_id);
