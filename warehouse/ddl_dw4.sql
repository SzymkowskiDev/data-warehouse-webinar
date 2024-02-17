-- using composite pramy key variant

CREATE TABLE fact_orderlines (
    product_id INTEGER,
    category_id INTEGER,
    date_id INTEGER,
    market_id INTEGER,
    customer_id INTEGER,
    amount DECIMAL(10,2)  -- MONEY data type is not supported, use DECIMAL instead
);

CREATE TABLE dim_date (
    date_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    order_date DATE
);

CREATE TABLE dim_products (
    product_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    product_name VARCHAR(255),
    price DECIMAL(10,2)  -- MONEY data type is not supported, use DECIMAL instead
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

-- Add composite PK on fact table
ALTER TABLE fact_orderlines ADD CONSTRAINT pk_fact_orderlines PRIMARY KEY (product_id, category_id, date_id, market_id, customer_id);

-- Add foreign key constraints
ALTER TABLE fact_orderlines ADD CONSTRAINT fk_fact_orderlines_customer_id FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id);
ALTER TABLE fact_orderlines ADD CONSTRAINT fk_fact_orderlines_market_id FOREIGN KEY (market_id) REFERENCES dim_markets(market_id);
ALTER TABLE fact_orderlines ADD CONSTRAINT fk_fact_orderlines_date_id FOREIGN KEY (date_id) REFERENCES dim_date(date_id);
ALTER TABLE fact_orderlines ADD CONSTRAINT fk_fact_orderlines_product_id FOREIGN KEY (product_id) REFERENCES dim_products(product_id);
ALTER TABLE fact_orderlines ADD CONSTRAINT fk_fact_orderlines_category_id FOREIGN KEY (category_id) REFERENCES dim_product_categories(category_id);