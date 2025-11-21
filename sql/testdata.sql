INSERT INTO Brands (name, country, founded_year, description) VALUES
('Apple', 'USA', 1976, 'Premium electronics and computers'),
('Samsung', 'South Korea', 1938, 'Global electronics and appliances company'),
('Sony', 'Japan', 1946, 'Audio/video and consumer technology leader');

INSERT INTO Products (name, brand_id, sku, release_year, price, warranty_months, category, stock_quantity) VALUES
('iPhone 14 Pro', 1, 'APL-IP14P-2022', 2022, 13790, 24, 'Smartphone', 15),
('MacBook Air M2', 1, 'APL-MBA-M2-2023', 2023, 14990, 24, 'Laptop', 8),
('Apple iPad Pro', 1, 'APL-IPADPRO-2021', 2021, 9390, 24, 'Tablet', 12),
('Samsung Galaxy S23', 2, 'SM-GS23-2023', 2023, 9990, 24, 'Smartphone', 10),
('Samsung QLED TV', 2, 'SM-QLED-Q80-2022', 2022, 14990, 36, 'TV', 4),
('Samsung Galaxy Tab S8', 2, 'SM-TABS8-2022', 2022, 7990, 24, 'Tablet', 7),
('Sony WH-1000XM5', 3, 'SONY-WH1000XM5', 2022, 3890, 24, 'Headphones', 19),
('Sony PlayStation 5', 3, 'SONY-PS5-2020', 2020, 7490, 24, 'Gaming', 6),
('Sony Xperia 1 IV', 3, 'SONY-XP1IV-2022', 2022, 7990, 24, 'Smartphone', 6),
('Sony Bravia TV', 3, 'SONY-BRAVIA-2023', 2023, 13290, 36, 'TV', 3);

INSERT INTO Customers (first_name, last_name, email, phone, city) VALUES
('Erik', 'Nilsson', 'erik.nilsson@gmail.com', '0701234567', 'Stockholm'),
('Anna', 'Lundgren', 'anna.lundgren@yahoo.com', '0732345612', 'Berlin'),
('Sara', 'Bergman', 'sara.bergman@hotmail.com', '0723456987', 'Madrid'),
('Johan', 'Persson', 'johan.persson@gmail.com', '0707896543', 'Paris'),
('Maria', 'Håkansson', 'maria.hakansson@outlook.com', '0765432189', 'London');

INSERT INTO Orders (customer_id, order_date, total_amount, status, shipping_city) VALUES
(1, '2023-11-10', 13790, 'completed', 'Stockholm'),
(2, '2024-03-21', 14990, 'pending', 'Berlin'),
(3, '2022-12-12', 9390, 'completed', 'Madrid'),
(4, '2021-06-02', 7990, 'cancelled', 'Paris'),
(5, '2022-04-20', 7990, 'pending', 'London'),
(2, '2023-09-17', 14990, 'completed', 'Berlin'),
(3, '2022-08-04', 3890, 'completed', 'Madrid'),
(1, '2020-12-15', 7490, 'completed', 'Stockholm'),
(4, '2023-04-28', 13290, 'completed', 'Paris'),
(5, '2024-05-13', 9990, 'completed', 'London');

INSERT INTO Order_Items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 13790),
(2, 2, 1, 14990),
(3, 3, 1, 9390),
(4, 6, 1, 7990),
(5, 9, 1, 7990),
(6, 5, 1, 14990),
(7, 7, 2, 3890),
(8, 8, 1, 7490),
(9, 10, 1, 13290),
(10, 4, 1, 9990);

INSERT INTO Reviews (product_id, customer_id, rating, comment, review_date) VALUES
(1, 1, 5, 'Very sharp display and smooth camera. Pricey, but top quality.', '2023-12-01'),
(2, 2, 4, 'Light, fast startup, great battery for work but premium price.', '2024-03-22'),
(3, 3, 5, 'Perfect for drawing and movies, pen works smoothly.', '2023-01-06'),
(4, 5, 3, 'Solid phone, but the battery drains faster than expected.', '2024-05-22'),
(5, 2, 5, 'Excellent colors and smart features for streaming.', '2023-09-19'),
(6, 4, 2, 'Tablet feels laggy after updates, not recommended for gaming.', '2022-05-10'),
(7, 3, 4, 'Quiet fit, great noise cancelling, but slightly bulky.', '2023-02-03'),
(8, 1, 4, 'Fun console, very loud fan noises in heavy games.', '2021-01-15'),
(9, 5, 2, 'Good camera, but small screen makes it less enjoyable.', '2022-04-25'),
(10, 4, 3, 'Nice TV, but remote sometimes disconnects.', '2023-05-01');
