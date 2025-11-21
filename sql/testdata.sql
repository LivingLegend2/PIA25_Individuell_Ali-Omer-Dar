INSERT INTO Brands (name, country, founded_year, description) VALUES
('Apple', 'USA', 1976, 'Premium electronics and computers'),
('Samsung', 'South Korea', 1938, 'Global electronics and appliances company'),
('Sony', 'Japan', 1946, 'Audio/video and consumer technology leader'),
('Dell', 'USA', 1984, 'Computer hardware and enterprise solutions'),
('LG', 'South Korea', 1958, 'Consumer electronics and home appliances');

INSERT INTO Products (name, brand_id, sku, release_year, price, warranty_months, category, stock_quantity) VALUES
('iPhone 14 Pro', 1, 'APL-IP14P-2022', 2022, 12990, 24, 'Smartphone', 15),
('MacBook Air M2', 1, 'APL-MBA-M2-2023', 2023, 13990, 24, 'Laptop', 8),
('Apple iPad Pro', 1, 'APL-IPADPRO-2021', 2021, 10990, 24, 'Tablet', 12),
('AirPods Pro', 1, 'APL-AIRPODS-2023', 2023, 2990, 12, 'Headphones', 25),
('Samsung Galaxy S23', 2, 'SM-GS23-2023', 2023, 9990, 24, 'Smartphone', 10),
('Samsung QLED TV 55"', 2, 'SM-QLED-Q80-2022', 2022, 11990, 36, 'TV', 4),
('Samsung Galaxy Tab S8', 2, 'SM-TABS8-2022', 2022, 6990, 24, 'Tablet', 7),
('Samsung Galaxy Buds', 2, 'SM-BUDS-2023', 2023, 1290, 12, 'Headphones', 30),
('Sony WH-1000XM5', 3, 'SONY-WH1000XM5', 2022, 3490, 24, 'Headphones', 19),
('Sony PlayStation 5', 3, 'SONY-PS5-2020', 2020, 5990, 24, 'Gaming', 6),
('Sony Xperia 1 V', 3, 'SONY-XP1V-2023', 2023, 11990, 24, 'Smartphone', 6),
('Sony Bravia TV 65"', 3, 'SONY-BRAVIA-2023', 2023, 14990, 36, 'TV', 3),
('Dell XPS 13', 4, 'DELL-XPS13-2023', 2023, 12990, 24, 'Laptop', 5),
('Dell UltraSharp Monitor', 4, 'DELL-U2723-2022', 2022, 4990, 36, 'Monitor', 8),
('LG OLED TV 55"', 5, 'LG-OLED55-2023', 2023, 13990, 36, 'TV', 4),
('LG Gram 17', 5, 'LG-GRAM17-2023', 2023, 14990, 24, 'Laptop', 3);

INSERT INTO Customers (first_name, last_name, email, phone, city) VALUES
('Erik', 'Nilsson', 'erik.nilsson@gmail.com', '0701234567', 'Stockholm'),
('Anna', 'Lundgren', 'anna.lundgren@yahoo.com', '0732345612', 'Berlin'),
('Sara', 'Bergman', 'sara.bergman@hotmail.com', '0723456987', 'Madrid'),
('Johan', 'Persson', 'johan.persson@gmail.com', '0707896543', 'Paris'),
('Maria', 'Håkansson', 'maria.hakansson@outlook.com', '0765432189', 'London');

INSERT INTO Orders (customer_id, order_date, total_amount, status, shipping_city) VALUES
(1, '2023-11-10', 12990, 'completed', 'Stockholm'),
(1, '2020-12-15', 5990, 'completed', 'Stockholm'),
(2, '2024-03-21', 13990, 'pending', 'Berlin'),
(2, '2023-09-17', 11990, 'completed', 'Berlin'),
(2, '2023-05-10', 10990, 'completed', 'Berlin'),
(2, '2022-11-03', 6990, 'completed', 'Berlin'),
(3, '2022-12-12', 10990, 'completed', 'Madrid'),
(4, '2021-06-02', 6990, 'cancelled', 'Paris'),
(4, '2023-04-28', 14990, 'completed', 'Paris'),
(5, '2022-04-20', 11990, 'pending', 'London'),
(5, '2024-05-13', 9990, 'completed', 'London'),
(5, '2023-08-19', 3490, 'completed', 'London'),
(5, '2021-03-14', 12990, 'completed', 'London');

INSERT INTO Order_Items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 12990),
(2, 10, 1, 5990),
(3, 2, 1, 13990),
(4, 6, 1, 11990),
(5, 3, 1, 10990),
(6, 7, 1, 6990),
(7, 3, 1, 10990),
(8, 7, 1, 6990),
(9, 12, 1, 14990),
(10, 11, 1, 11990),
(11, 5, 1, 9990),
(12, 9, 1, 3490),
(13, 13, 1, 12990);

INSERT INTO Reviews (product_id, customer_id, rating, comment, review_date) VALUES
(1, 1, 5, 'Very sharp display and smooth camera. Pricey, but top quality.', '2023-12-01'),
(2, 2, 4, 'Light, fast startup, great battery for work but premium price.', '2024-03-22'),
(3, 3, 5, 'Perfect for drawing and movies, pen works smoothly.', '2023-01-06'),
(5, 5, 3, 'Solid phone, but the battery drains faster than expected.', '2024-05-22'),
(6, 2, 5, 'Excellent colors and smart features for streaming.', '2023-09-19'),
(7, 4, 2, 'Tablet feels laggy after updates, not recommended for gaming.', '2022-05-10'),
(9, 3, 4, 'Quiet fit, great noise cancelling, but slightly bulky.', '2023-02-03'),
(10, 1, 4, 'Fun console, very loud fan noises in heavy games.', '2021-01-15'),
(11, 5, 2, 'Good camera, but small screen makes it less enjoyable.', '2022-04-25'),
(13, 4, 5, 'Excellent laptop, lightweight and powerful for coding.', '2023-05-01'),
(14, 2, 4, 'Great monitor, colors are accurate for design work.', '2023-07-12'),
(15, 3, 5, 'Best TV I have owned, incredible picture quality.', '2024-01-20');
