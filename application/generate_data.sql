-- Populate the 'products' table with dummy data
INSERT INTO products (product_name, category_id, price)
VALUES
    ('Laptop', 1, 999.99),
    ('Smartphone', 1, 699.99),
    ('Tablet', 1, 399.99),
    ('Headphones', 2, 99.99),
    ('Mouse', 2, 19.99),
    ('Keyboard', 2, 49.99),
    ('T-shirt', 3, 29.99),
    ('Jeans', 3, 59.99),
    ('Sneakers', 3, 79.99);

-- Populate the 'product_categories' table with dummy data
INSERT INTO product_categories (category_name)
VALUES
    ('Electronics'),
    ('Accessories'),
    ('Apparel');

-- Populate the 'customers' table with dummy data for 123 clients
INSERT INTO customers (name, email, market_id)
SELECT
    CONCAT('Customer', id) AS name,
    CONCAT('customer', id, '@example.com') AS email,
    (id % 5) + 1 AS market_id
FROM generate_series(1, 123) AS id;

-- Populate the 'markets' table with ISO codes for all countries directly
INSERT INTO markets (iso_code)
VALUES
    ('AF'),('AX'),('AL'),('DZ'),('AS'),('AD'),('AO'),('AI'),('AQ'),('AG'),('AR'),('AM'),('AW'),('AU'),('AT'),('AZ'),('BS'),('BH'),('BD'),('BB'),('BY'),('BE'),('BZ'),('BJ'),('BM'),('BT'),('BO'),('BQ'),('BA'),('BW'),('BV'),('BR'),('IO'),('BN'),('BG'),('BF'),('BI'),('CV'),('KH'),('CM'),('CA'),('KY'),('CF'),('TD'),('CL'),('CN'),('CX'),('CC'),('CO'),('KM'),('CG'),('CD'),('CK'),('CR'),('CI'),('HR'),('CU'),('CW'),('CY'),('CZ'),('DK'),('DJ'),('DM'),('DO'),('EC'),('EG'),('SV'),('GQ'),('ER'),('EE'),('SZ'),('ET'),('FK'),('FO'),('FJ'),('FI'),('FR'),('GF'),('PF'),('TF'),('GA'),('GM'),('GE'),('DE'),('GH'),('GI'),('GR'),('GL'),('GD'),('GP'),('GU'),('GT'),('GG'),('GN'),('GW'),('GY'),('HT'),('HM'),('VA'),('HN'),('HK'),('HU'),('IS'),('IN'),('ID'),('IR'),('IQ'),('IE'),('IM'),('IL'),('IT'),('JM'),('JP'),('JE'),('JO'),('KZ'),('KE'),('KI'),('KP'),('KR'),('KW'),('KG'),('LA'),('LV'),('LB'),('LS'),('LR'),('LY'),('LI'),('LT'),('LU'),('MO'),('MK'),('MG'),('MW'),('MY'),('MV'),('ML'),('MT'),('MH'),('MQ'),('MR'),('MU'),('YT'),('MX'),('FM'),('MD'),('MC'),('MN'),('ME'),('MS'),('MA'),('MZ'),('MM'),('NA'),('NR'),('NP'),('NL'),('NC'),('NZ'),('NI'),('NE'),('NG'),('NU'),('NF'),('MP'),('NO'),('OM'),('PK'),('PW'),('PS'),('PA'),('PG'),('PY'),('PE'),('PH'),('PN'),('PL'),('PT'),('PR'),('QA'),('RE'),('RO'),('RU'),('RW'),('BL'),('SH'),('KN'),('LC'),('MF'),('PM'),('VC'),('WS'),('SM'),('ST'),('SA'),('SN'),('RS'),('SC'),('SL'),('SG'),('SX'),('SK'),('SI'),('SB'),('SO'),('ZA'),('GS'),('SS'),('ES'),('LK'),('SD'),('SR'),('SJ'),('SE'),('CH'),('SY'),('TW'),('TJ'),('TZ'),('TH'),('TL'),('TG'),('TK'),('TO'),('TT'),('TN'),('TR'),('TM'),('TC'),('TV'),('UG'),('UA'),('AE'),('GB'),('US'),('UM'),('UY'),('UZ'),('VU'),('VE'),('VN'),('VG'),('VI'),('WF'),('EH'),('YE'),('ZM'),('ZW');

-- Populate the 'orders' table with dummy data
INSERT INTO orders (customer_id, order_date, amount)
SELECT
    (id % 123) + 1 AS customer_id,
    CURRENT_DATE - INTERVAL '10 days' * (id % 30) AS order_date,
    (RANDOM() * 1000 + 100)::numeric(10, 2) AS amount
FROM generate_series(1, 500) AS id;

-- Populate the 'order_products' table with dummy data
INSERT INTO order_products (order_id, product_id, quantity)
SELECT
    (id % 500) + 1 AS order_id,
    (id % 9) + 1 AS product_id,
    (id % 5) + 1 AS quantity
FROM generate_series(1, 1000) AS id;
