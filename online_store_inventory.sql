-- creating product table

CREATE TABLE products (
 id INT AUTO_INCREMENT PRIMARY KEY,
 product_name VARCHAR(255) NOT NULL,
 price DECIMAL(10, 2) NOT NULL,
 stock_quantity INT NOT NULL
);

-- creating customers table 
CREATE TABLE customers (
 id INT AUTO_INCREMENT PRIMARY KEY,
 first_name VARCHAR(255) NOT NULL,
 last_name VARCHAR(255) NOT NULL,
 email VARCHAR(255) UNIQUE NOT NULL
);

-- creating order table
CREATE TABLE orders (
 id INT AUTO_INCREMENT PRIMARY KEY,
 customer_id INT,
 order_date DATE NOT NULL,
 FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- creating order_items 
CREATE TABLE order_items (
 order_id INT,
 product_id INT,
 quantity INT NOT NULL,
 PRIMARY KEY (order_id, product_id),
 FOREIGN KEY (order_id) REFERENCES orders(id),
 FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Inserting Products
Inserting values:
INSERT INTO products (product_name, price, stock_quantity) VALUES
('Laptop', 999.99, 10),
('Smartphone', 499.99, 20),
('Headphones', 199.99, 15),
('Smartwatch', 249.99, 30),
('Tablet', 299.99, 25);


-- Inserting Customers
INSERT INTO customers (first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Brown', 'bob.brown@example.com');


-- Inserting Orders
INSERT INTO orders (customer_id, order_date) VALUES
(1, '2024-10-01'),
(2, '2024-10-02'),
(3, '2024-10-03'),
(1, '2024-10-04'),
(4, '2024-10-05');


-- Inserting Order Items
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1), -- Order 1: 1 Laptop
(1, 2, 2), -- Order 1: 2 Smartphones
(2, 3, 1), -- Order 2: 1 Headphones
(2, 4, 1), -- Order 2: 1 Smartwatch
(3, 2, 1), -- Order 3: 1 Smartphone
(3, 5, 2), -- Order 3: 2 Tablets
(4, 1, 1), -- Order 4: 1 Laptop
(4, 3, 1), -- Order 4: 1 Headphones
(5, 4, 2), -- Order 5: 2 Smartwatches
(5, 5, 1); -- Order 5: 1 Tablet

--Retrieve the names and stock quantities of all products

select product_name, stock_quantity from products;

--Retrieve the product names and quantities for one of the orders placed (e.g.,Order ID 1)

select p.product_name, oi.quantity from order_items oi 
join products p on oi.product_id = p.id where oi.order_id = 1;

--Retrieve all orders placed by a specific customer (e.g., Customer ID 1)

select o.id as order_id, oi.product_id, oi.quantity from orders o
join order_items oi on o.id = oi.order_id where o.customer_id = 1;

--Update Data
Update products select stock_quantity = stock_quantity - 1 where id in(select product_id from order_items where order_id = 1);

-- Delete data

Delete from order_items were order_id = 2;
Delete from order where id = 2;



