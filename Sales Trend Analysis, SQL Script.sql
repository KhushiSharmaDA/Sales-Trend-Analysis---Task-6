-- Task 6: Sales Trend Analysis Using Aggregations
-- Objective: Analyze monthly revenue and order volume

-- Table creation
CREATE TABLE orders (
  order_id INT,
  order_date DATE,
  amount DECIMAL(10,2),
  product_id INT
);

-- Sample data
INSERT INTO orders VALUES
(1, '2024-01-05', 1200.00, 101),
(2, '2024-01-15', 800.00, 102),
(3, '2024-02-03', 1500.00, 101),
(4, '2024-02-20', 700.00, 103),
(5, '2024-03-10', 2000.00, 104),
(6, '2024-03-18', 500.00, 102);

-- Monthly revenue and order volume
SELECT
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY
  EXTRACT(YEAR FROM order_date),
  EXTRACT(MONTH FROM order_date)
ORDER BY
  year, month;

