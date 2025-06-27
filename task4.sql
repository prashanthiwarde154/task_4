-- Sample Table: Orders
create database ecommerce;
use ecommerce;

CREATE TABLE Orders (
  order_id INT,
  customer_name VARCHAR(100),
  product_name VARCHAR(100),
  quantity INT,
  price DECIMAL(10, 2),
  city VARCHAR(50)
);

-- Sample Data
INSERT INTO Orders (order_id, customer_name, product_name, quantity, price, city) VALUES
(1, 'Ravi', 'Laptop', 1, 60000.00, 'Mumbai'),
(2, 'Anita', 'Phone', 2, 15000.00, 'Delhi'),
(3, 'Ravi', 'Mouse', 3, 500.00, 'Mumbai'),
(4, 'Meena', 'Keyboard', 1, 800.00, 'Pune'),
(5, 'Anita', 'Laptop', 1, 62000.00, 'Delhi'),
(6, 'Ravi', 'Phone', 1, 16000.00, 'Mumbai');

-- 1. Total Sales Value
SELECT SUM(price * quantity) AS Total_Sales
FROM Orders;

-- 2. Total Orders by Each Customer
SELECT customer_name, COUNT(*) AS Total_Orders
FROM Orders
GROUP BY customer_name;

-- 3. Average Price of Products
SELECT AVG(price) AS Average_Price
FROM Orders;

-- 4. Total Quantity Sold by Product
SELECT product_name, SUM(quantity) AS Total_Quantity
FROM Orders
GROUP BY product_name;

-- 5. Number of Orders by City
SELECT city, COUNT(order_id) AS Orders_Count
FROM Orders
GROUP BY city;

-- 6. Customers Who Ordered More Than 2 Times
SELECT customer_name, COUNT(*) AS Total_Orders
FROM Orders
GROUP BY customer_name
HAVING COUNT(*) > 2;

-- 7. Products with Average Price Greater Than 10000
SELECT product_name, AVG(price) AS Avg_Price
FROM Orders
GROUP BY product_name
HAVING AVG(price) > 10000;
