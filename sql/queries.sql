-- 1. Gets all products sorted by name
SELECT * FROM Products ORDER BY name;

-- 2. Gets all products that cost more than 5000
SELECT * FROM Products WHERE price > 5000;

-- 3. Gets all orders from 2024
SELECT * FROM Orders WHERE EXTRACT(YEAR FROM order_date) = 2024;

-- 4. Gets all pending orders
SELECT * FROM Orders WHERE status = 'pending';

-- 5. Shows all products with their brand name (JOIN)
SELECT Products.*, Brands.name AS brand_name
FROM Products
JOIN Brands ON Products.brand_id = Brands.id;

-- 6. Shows all orders with customer name and total amount (JOIN)
SELECT Orders.id, Orders.order_date, Orders.total_amount, Orders.status, Customers.first_name, Customers.last_name
FROM Orders
JOIN Customers ON Orders.customer_id = Customers.id;

-- 7. Lists products each customer has bought (JOIN)
SELECT Customers.first_name, Customers.last_name, Products.name AS product_name
FROM Customers
JOIN Orders ON Customers.id = Orders.customer_id
JOIN Order_Items ON Orders.id = Order_Items.order_id
JOIN Products ON Order_Items.product_id = Products.id
ORDER BY Customers.id;

-- 8. Counts number of products per brand (GROUP BY)
SELECT Brands.name AS brand_name, COUNT(Products.id) AS num_products
FROM Brands
LEFT JOIN Products ON Products.brand_id = Brands.id
GROUP BY Brands.name
ORDER BY num_products DESC;

-- 9. Finds customers who have spent the most (SUM & GROUP BY)
SELECT Customers.id, Customers.first_name, Customers.last_name, SUM(Orders.total_amount) AS total_spent
FROM Customers
JOIN Orders ON Customers.id = Orders.customer_id
GROUP BY Customers.id
ORDER BY total_spent DESC;

-- 10. Shows products with average rating from reviews (AVG & GROUP BY)
SELECT Products.name AS product_name, ROUND(AVG(Reviews.rating), 2) AS avg_rating, COUNT(Reviews.id) AS num_reviews
FROM Products
LEFT JOIN Reviews ON Products.id = Reviews.product_id
GROUP BY Products.name, Products.id
ORDER BY avg_rating DESC NULLS LAST;
