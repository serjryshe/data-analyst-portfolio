CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    sale_price DECIMAL(10,2),
    cost_price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE
);

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO customers VALUES
(1, 'John Smith', 'USA'),
(2, 'Alice Brown', 'Canada'),
(3, 'David Lee', 'USA'),
(4, 'Emma Wilson', 'UK'),
(5, 'Michael Chen', 'Canada'),
(6, 'Olivia Davis', 'USA'),
(7, 'Daniel Garcia', 'Mexico'),
(8, 'Sophia Martinez', 'USA');

INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 1200, 800),
(2, 'Phone', 'Electronics', 800, 500),
(3, 'Headphones', 'Accessories', 150, 50),
(4, 'Monitor', 'Electronics', 300, 200),
(5, 'Keyboard', 'Accessories', 100, 40),
(6, 'Mouse', 'Accessories', 50, 20),
(7, 'Tablet', 'Electronics', 600, 400),
(8, 'Smartwatch', 'Electronics', 250, 150);

INSERT INTO orders VALUES
(1, 1, '2024-01-10'),
(2, 2, '2024-01-12'),
(3, 1, '2024-01-15'),
(4, 3, '2024-01-20'),
(5, 4, '2024-01-22'),
(6, 5, '2024-01-25'),
(7, 6, '2024-02-01'),
(8, 7, '2024-02-05'),
(9, 8, '2024-02-10'),
(10, 2, '2024-02-15');

INSERT INTO order_items VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(3, 4, 1),
(3, 5, 1),
(4, 1, 1),
(4, 2, 1),
(5, 6, 3),
(6, 7, 1),
(7, 8, 2),
(8, 3, 1),
(9, 2, 2),
(9, 5, 1),
(10, 1, 1),
(10, 4, 1);
