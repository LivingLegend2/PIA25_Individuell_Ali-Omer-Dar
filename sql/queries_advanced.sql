-- 1. Finds all products with price higher than average price
SELECT id, name, price, category, brand_id
FROM Products
WHERE price > (
    SELECT AVG(price)
    FROM Products
)
ORDER BY price DESC;

-- 2. Finds customers who have ordered more than the average number of orders
SELECT c.id, c.first_name, c.last_name, c.email, COUNT(o.id) AS order_count
FROM Customers c
JOIN Orders o ON c.id = o.customer_id
GROUP BY c.id, c.first_name, c.last_name, c.email
HAVING COUNT(o.id) > (
    SELECT AVG(order_count)
    FROM (
        SELECT customer_id, COUNT(*) AS order_count
        FROM Orders
        GROUP BY customer_id
    ) AS customer_orders
)
ORDER BY order_count DESC;

-- 3. Ranks products per brand based on price (ROW_NUMBER)
SELECT 
    p.id,
    p.name AS product_name,
    b.name AS brand_name,
    p.price,
    ROW_NUMBER() OVER (PARTITION BY p.brand_id ORDER BY p.price DESC) AS price_rank_in_brand
FROM Products p
JOIN Brands b ON p.brand_id = b.id
ORDER BY b.name, price_rank_in_brand;

-- 4. Shows each customer's total spending and their rank among all customers (RANK)
SELECT 
    c.id,
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS spending_rank
FROM Customers c
JOIN Orders o ON c.id = o.customer_id
GROUP BY c.id, c.first_name, c.last_name
ORDER BY spending_rank;

-- 5. Categorizes products as 'Budget' (<1000), 'Medium' (1000-5000), 'Premium' (>5000)
SELECT 
    id,
    name,
    price,
    category,
    CASE 
        WHEN price < 1000 THEN 'Budget'
        WHEN price BETWEEN 1000 AND 5000 THEN 'Medium'
        WHEN price > 5000 THEN 'Premium'
    END AS price_category
FROM Products
ORDER BY price;

-- 6. Shows customers as 'VIP' (>3 orders), 'Regular' (2-3), 'New' (1)
SELECT 
    c.id,
    c.first_name,
    c.last_name,
    c.email,
    COUNT(o.id) AS order_count,
    CASE 
        WHEN COUNT(o.id) > 3 THEN 'VIP'
        WHEN COUNT(o.id) BETWEEN 2 AND 3 THEN 'Regular'
        WHEN COUNT(o.id) = 1 THEN 'New'
        ELSE 'No Orders'
    END AS customer_status
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customer_id
GROUP BY c.id, c.first_name, c.last_name, c.email
ORDER BY order_count DESC;