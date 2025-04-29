use ecommerce;
CREATE TABLE orderss (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10, 2),
    product_id INT
);

INSERT INTO orderss (order_id, order_date, amount, product_id) VALUES
(101, '2023-01-15', 250.00, 1),
(102, '2023-01-20', 320.00, 2),
(103, '2023-02-05', 180.00, 3),
(104, '2023-02-15', 450.00, 1),
(105, '2023-03-10', 100.00, 2),
(106, '2023-03-22', 220.00, 1),
(107, '2023-04-03', 310.00, 4),
(108, '2023-04-25', 410.00, 3),
(109, '2023-05-05', 90.00, 2),
(110, '2023-05-14', 270.00, 4),
(111, '2023-06-01', 330.00, 1),
(112, '2023-06-10', 190.00, 3),
(113, '2023-07-11', 360.00, 2),
(114, '2023-07-18', 140.00, 3),
(115, '2023-08-01', 280.00, 4);

SELECT * FROM orderss;

-- EXTRACT(MONTH FROM order_date)
SELECT 
    EXTRACT(MONTH FROM order_date) AS month_number,
    COUNT(*) AS total_orders FROM  orderss
GROUP BY EXTRACT(MONTH FROM order_date);

-- Group by Year and Month
SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    COUNT(*) AS orders_count FROM orderss
GROUP BY YEAR(order_date), MONTH(order_date);

-- Use SUM() for Total Revenue
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS total_revenue
FROM orderss
GROUP BY YEAR(order_date), MONTH(order_date);

-- Use COUNT(DISTINCT order_id) for Volume
SELECT 
    EXTRACT(YEAR_MONTH FROM order_date) AS years_month,
    COUNT(DISTINCT order_id) AS order_volume
FROM orderss
GROUP BY years_month;

-- Use ORDER BY for Sorting
SELECT 
    product_id,
    SUM(amount) AS revenue
FROM orderss
GROUP BY product_id
ORDER BY revenue DESC;

-- Limit Results for Specific Time Periods
SELECT * FROM orderss
WHERE order_date BETWEEN '2023-01-01' AND '2023-06-30';

-- Rolling 3-Month Revenue
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS years_month,
    SUM(amount) AS monthly_revenue FROM orderss
WHERE order_date >= DATE_SUB('2023-08-01', INTERVAL 3 MONTH)
GROUP BY years_month
ORDER BY years_month;

-- Grouping online sales by year and month to analyze revenue and order volume
SELECT
    YEAR(order_date) AS order_year, MONTH(order_date) AS order_month,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(amount) AS total_revenue, AVG(amount) AS avg_order_value,
    MIN(amount) AS min_order_value, MAX(amount) AS max_order_value
FROM orderss
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);