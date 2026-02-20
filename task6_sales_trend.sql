CREATE DATABASE sales_trend;
USE sales_trend;
CREATE TABLE online_sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id INT);
    
INSERT INTO online_sales VALUES
(1, '2023-01-05', 500, 101),
(2, '2023-01-15', 700, 102),
(3, '2023-02-10', 300, 103),
(4, '2023-02-18', 900, 104),
(5, '2023-03-12', 400, 105),
(6, '2023-03-25', 800, 106),
(7, '2023-04-05', 1000, 107),
(8, '2023-04-18', 650, 108),
(9, '2023-05-09', 750, 109),
(10, '2023-05-22', 1200, 110);

-- MONTHLY REVENUE ANALYSIS
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS monthly_revenue
FROM online_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

-- MONTHLY ORDER VOLUME
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

-- Combined Revenue + Volume
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

-- Top 3 Months by Sales
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS monthly_revenue
FROM online_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY monthly_revenue DESC
LIMIT 3;
