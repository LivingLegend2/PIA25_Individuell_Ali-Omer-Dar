-- QUERY 1: Products filtered by price
-- Before optimization
EXPLAIN ANALYZE
SELECT * FROM Products 
WHERE price > 10000;

-- Optimization: Create index on price for faster filtering
CREATE INDEX idx_products_price ON Products(price);

-- After optimization (same query, now uses index)
EXPLAIN ANALYZE
SELECT * FROM Products 
WHERE price > 10000;


-- QUERY 2: Orders filtered by date
-- Before optimization
EXPLAIN ANALYZE
SELECT * FROM Orders 
WHERE order_date >= '2024-01-01';

-- Optimization: Create index on order_date for faster filtering
CREATE INDEX idx_orders_date ON Orders(order_date);

-- After optimization (same query, now uses index)
EXPLAIN ANALYZE
SELECT * FROM Orders 
WHERE order_date >= '2024-01-01';
