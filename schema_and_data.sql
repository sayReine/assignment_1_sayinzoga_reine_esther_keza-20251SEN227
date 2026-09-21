
DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS customers CASCADE;


CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  city VARCHAR(50) NOT NULL
);

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  category VARCHAR(50) NOT NULL,
  price NUMERIC(10,2) NOT NULL
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT REFERENCES customers(customer_id) ON DELETE CASCADE,
  order_date DATE NOT NULL
);

CREATE TABLE order_items (
  order_item_id INT PRIMARY KEY,
  order_id INT REFERENCES orders(order_id) ON DELETE CASCADE,
  product_id INT REFERENCES products(product_id) ON DELETE CASCADE,
  quantity INT NOT NULL CHECK (quantity > 0)
);


INSERT INTO customers (customer_id, customer_name, email, city) VALUES
(1, 'Alice Smith', 'alice@example.com', 'Kigali'),
(2, 'Bob Jones', 'bob@example.com', 'Musanze'),
(3, 'Charlie Brown', 'charlie@example.com', 'Kigali'),
(4, 'Diana Prince', 'diana@example.com', 'Huye'),
(5, 'Evan Wright', 'evan@example.com', 'Rubavu'),
(6, 'Fiona Gallagher', 'fiona@example.com', 'Kigali'); 


INSERT INTO products (product_id, product_name, category, price) VALUES
(101, 'Organic Milk 1L', 'Dairy', 2.50),
(102, 'Cheddar Cheese 250g', 'Dairy', 4.00),
(103, 'Whole Wheat Bread', 'Bakery', 1.80),
(104, 'Chocolate Chip Cookies', 'Bakery', 3.20),
(105, 'Fresh Apples 1kg', 'Produce', 3.00),
(106, 'Bananas 1kg', 'Produce', 1.50),
(107, 'Greek Yogurt 500g', 'Dairy', 3.50),
(108, 'Croissant 4-Pack', 'Bakery', 2.80);


INSERT INTO orders (order_id, customer_id, order_date) VALUES
(201, 1, '2026-09-01'),
(202, 2, '2026-09-02'),
(203, 1, '2026-09-03'),
(204, 3, '2026-09-04'),
(205, 4, '2026-09-05'),
(206, 2, '2026-09-06'),
(207, 5, '2026-09-07'),
(208, 1, '2026-09-08'),
(209, 3, '2026-09-09'),
(210, 4, '2026-09-10'),
(211, 2, '2026-09-11'),
(212, 5, '2026-09-12'),
(213, 1, '2026-09-13'),
(214, 3, '2026-09-14'),
(215, 4, '2026-09-15');


INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES
(1, 201, 101, 2),
(2, 201, 103, 1),
(3, 202, 102, 3),
(4, 202, 105, 2),
(5, 203, 107, 4),
(6, 204, 104, 2),
(7, 204, 106, 5),
(8, 205, 108, 1),
(9, 205, 101, 2),
(10, 206, 102, 1),
(11, 206, 103, 3),
(12, 207, 105, 4),
(13, 208, 107, 2),
(14, 208, 104, 1),
(15, 209, 101, 3),
(16, 209, 108, 2),
(17, 210, 102, 2),
(18, 210, 106, 4),
(19, 211, 105, 2),
(20, 212, 103, 5),
(21, 213, 107, 1),
(22, 213, 101, 2),
(23, 214, 104, 3),
(24, 214, 102, 1),
(25, 215, 108, 2),
(26, 215, 105, 3);