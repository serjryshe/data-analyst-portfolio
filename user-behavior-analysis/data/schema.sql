CREATE TABLE users (
    user_id INT PRIMARY KEY,
    signup_date DATE,
    country VARCHAR(50),
    acquisition_channel VARCHAR(50)
);

CREATE TABLE sessions (
    session_id INT PRIMARY KEY,
    user_id INT,
    session_date DATE,
    device_type VARCHAR(20)
);

CREATE TABLE events (
    event_id INT PRIMARY KEY,
    session_id INT,
    event_type VARCHAR(50),
    event_time DATETIME
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE event_products (
    event_id INT,
    product_id INT
);

CREATE TABLE subscriptions (
    subscription_id INT PRIMARY KEY,
    user_id INT,
    plan_name VARCHAR(50),
    start_date DATE,
    monthly_price DECIMAL(10,2),
    status VARCHAR(20)
);

CREATE TABLE marketing_spend (
    spend_id INT PRIMARY KEY,
    acquisition_channel VARCHAR(50),
    spend_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO users VALUES
(1, '2024-03-01', 'USA', 'Google Ads'),
(2, '2024-03-02', 'Canada', 'Organic Search'),
(3, '2024-03-03', 'USA', 'Instagram'),
(4, '2024-03-03', 'UK', 'Google Ads'),
(5, '2024-03-04', 'USA', 'Referral'),
(6, '2024-03-05', 'Canada', 'Organic Search'),
(7, '2024-03-05', 'Germany', 'Instagram'),
(8, '2024-03-06', 'USA', 'Google Ads'),
(9, '2024-03-07', 'Mexico', 'Referral'),
(10, '2024-03-08', 'USA', 'Organic Search'),
(11, '2024-03-08', 'UK', 'Google Ads'),
(12, '2024-03-09', 'Canada', 'Instagram');

INSERT INTO sessions VALUES
(1, 1, '2024-03-01', 'mobile'),
(2, 1, '2024-03-03', 'desktop'),
(3, 2, '2024-03-02', 'desktop'),
(4, 3, '2024-03-03', 'mobile'),
(5, 4, '2024-03-04', 'desktop'),
(6, 5, '2024-03-04', 'mobile'),
(7, 6, '2024-03-05', 'tablet'),
(8, 7, '2024-03-06', 'mobile'),
(9, 8, '2024-03-06', 'desktop'),
(10, 9, '2024-03-07', 'mobile'),
(11, 10, '2024-03-08', 'desktop'),
(12, 11, '2024-03-08', 'mobile'),
(13, 12, '2024-03-09', 'desktop'),
(14, 3, '2024-03-10', 'mobile'),
(15, 5, '2024-03-11', 'desktop'),
(16, 8, '2024-03-12', 'mobile');

INSERT INTO events VALUES
(1, 1, 'view_product', '2024-03-01 10:00:00'),
(2, 1, 'add_to_cart', '2024-03-01 10:05:00'),
(3, 1, 'purchase', '2024-03-01 10:10:00'),

(4, 2, 'view_product', '2024-03-03 09:00:00'),
(5, 2, 'view_product', '2024-03-03 09:03:00'),

(6, 3, 'view_product', '2024-03-02 14:00:00'),
(7, 3, 'add_to_cart', '2024-03-02 14:08:00'),

(8, 4, 'view_product', '2024-03-03 16:00:00'),
(9, 4, 'add_to_cart', '2024-03-03 16:06:00'),
(10, 4, 'purchase', '2024-03-03 16:10:00'),

(11, 5, 'view_product', '2024-03-04 11:00:00'),
(12, 5, 'purchase', '2024-03-04 11:12:00'),

(13, 6, 'view_product', '2024-03-04 13:00:00'),

(14, 7, 'view_product', '2024-03-05 15:00:00'),
(15, 7, 'add_to_cart', '2024-03-05 15:12:00'),

(16, 8, 'view_product', '2024-03-06 10:00:00'),
(17, 8, 'add_to_cart', '2024-03-06 10:07:00'),
(18, 8, 'purchase', '2024-03-06 10:15:00'),

(19, 9, 'view_product', '2024-03-06 18:00:00'),
(20, 9, 'view_product', '2024-03-06 18:04:00'),

(21, 10, 'view_product', '2024-03-07 09:00:00'),
(22, 10, 'purchase', '2024-03-07 09:11:00'),

(23, 11, 'view_product', '2024-03-08 08:00:00'),
(24, 11, 'add_to_cart', '2024-03-08 08:10:00'),
(25, 11, 'purchase', '2024-03-08 08:20:00'),

(26, 12, 'view_product', '2024-03-08 19:00:00'),

(27, 13, 'view_product', '2024-03-09 12:00:00'),
(28, 13, 'add_to_cart', '2024-03-09 12:10:00'),

(29, 14, 'view_product', '2024-03-10 17:00:00'),
(30, 14, 'purchase', '2024-03-10 17:09:00'),

(31, 15, 'view_product', '2024-03-11 14:00:00'),
(32, 15, 'add_to_cart', '2024-03-11 14:10:00'),

(33, 16, 'view_product', '2024-03-12 20:00:00'),
(34, 16, 'add_to_cart', '2024-03-12 20:06:00'),
(35, 16, 'purchase', '2024-03-12 20:12:00');

INSERT INTO products VALUES
(1, 'Starter Plan', 'Subscription', 19.99),
(2, 'Pro Plan', 'Subscription', 49.99),
(3, 'Analytics Add-on', 'Addon', 14.99),
(4, 'Team Dashboard', 'Addon', 29.99),
(5, 'Priority Support', 'Service', 9.99),
(6, 'Automation Pack', 'Addon', 39.99);

INSERT INTO event_products VALUES
(1, 1),
(2, 1),
(3, 1),

(4, 2),
(5, 3),

(6, 2),
(7, 2),

(8, 3),
(9, 3),
(10, 3),

(11, 2),
(12, 2),

(13, 5),

(14, 4),
(15, 4),

(16, 1),
(17, 1),
(18, 1),

(19, 6),
(20, 2),

(21, 5),
(22, 5),

(23, 2),
(24, 2),
(25, 2),

(26, 1),

(27, 4),
(28, 4),

(29, 3),
(30, 3),

(31, 6),
(32, 6),

(33, 2),
(34, 2),
(35, 2);

INSERT INTO subscriptions VALUES
(1, 1, 'Starter', '2024-03-01', 19.99, 'active'),
(2, 3, 'Starter', '2024-03-03', 19.99, 'active'),
(3, 4, 'Pro', '2024-03-04', 49.99, 'active'),
(4, 8, 'Starter', '2024-03-06', 19.99, 'cancelled'),
(5, 10, 'Starter', '2024-03-07', 19.99, 'active'),
(6, 11, 'Pro', '2024-03-08', 49.99, 'active'),
(7, 8, 'Pro', '2024-03-12', 49.99, 'active');

INSERT INTO marketing_spend VALUES
(1, 'Google Ads', '2024-03-01', 300.00),
(2, 'Google Ads', '2024-03-08', 250.00),
(3, 'Instagram', '2024-03-03', 180.00),
(4, 'Instagram', '2024-03-09', 170.00),
(5, 'Organic Search', '2024-03-02', 50.00),
(6, 'Referral', '2024-03-04', 40.00);

